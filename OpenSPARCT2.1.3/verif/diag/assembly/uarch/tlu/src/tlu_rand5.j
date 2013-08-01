/* 
 * vim: wrap:wm=0
 *
 * Instruction set to irritate TLU related logic
 *      Trap/HTrap instructions from user/priv/hpriv modes
 *      Trap instructions
 *      Read/write TLU ASR/ASI
 *      Divides & Div/0
 *      saves/restores (trap handlers)
 *      Cause ldst exceptions (alignment, access_error, priv_action..)
 *      Toggle between user/super/hyper ..
 *      Branches with traps in delay slots
 *      Splash hpstate (tlz)
 *      Demap all (stxa to 0x57/0x5f with data = 0x80)
 *      Clean window traps
 *      Spill/fill traps
 *      SIR
 *      Red state entry ...
 *      TBA/HTBA switching
 *      MMU on/off
 *      Int Vect (SW & $EV)
 *      Softint (SW and SM/TM)
 *      Mondo
 *      XIR ($EV)
 *      Hintp
 *      MT parking/unparking ..
 *      Instruction breakpoint
 *      Watchpoints
 *      Random change to TSA and done/retry
 *      nfo/unauth access ..
 *      pmu traps
 *      cwq traps
 *      MA trap
 *      DAE/IAE TTE exceptions
 *      Execution with high pc bits set ..
 *      instruction_access_range
 *      instruction/data_invalid_TSB_entry ..
 *      unsupported_page_size
 *      instruction/data_access_mmu_error
 *      CETER/CERER programming
 *      conditional user events 
 *      tick enable toggling
 *
 *      Can't change pstate/hpstate and TL randomly, Nas croaks if it gets
 *      the condition TL>MAXPTL and HPRIV=0
 *
 *  WARNING : RUN INDRA with -cpp_args=-I$DIAG_ROOT/assembly/include if your
 *  =======   $JALPATH is not $DIAG_ROOT/assembly/
 *
 *
 * Diag Conditionals
 *
 *      MULTIPASS      : Run main diag code MULTIPASS+1 times
 *      SPC            : Bench Conditional 
 *      XIR_RND_CORES  : Randomly send XIR to multiple threads
 *      SPLASH_HIDECR  : Set initial decr (hi32 bits) value

 * Generator Conditionals:
 *    NO_MHIT   :   Uses TTE_Size 0 instead of random
 *    HIGH_VAS  :   Uses text VAs in >32 bit range - ON by default
 *    MT        :   MT features - ON by default 
 *    NOVAHOLE  :   Don't branch to vahole ..
 *    TH_STRESS :   Include random threads running stress opcodes..
 *    NO_CMP    :   Don use any CMP parking/unparking ..
 *    NO_SPU    :   Do not include and tlu_rand5 SPU rules
 *    TEMPLATE1 :   External template # 1
 *    TEMPLATE2 :   External template # 2
 *    LOWTL     :   Don't write high TL values ..
 *    LOWGL     :   Don't write high GL values ..
 */

#ij define MT
#ij define HIGH_VAS
#ij define NOVAHOLE

template main();

// %%section c_declarations & thread groupings{{{
%%section c_declarations
    int label = 0;
    int myrand ;
    int myrand2 ;
    int myrand3 ;
    int myrand2n ;
    int myrand3n ;
    int tgmh1, tgml1 ;
    int tgmh2, tgml2 ;
    int tgrand1, tgrand2, tmast ;
    int i,j, tst1=0;
    int mythid = 0;
    int thall = 0xff;
    int tt1=0, tt2=0;
    char label_suffix [16];
    int cmpex = 0;
%%
// }}}

// %%section init {{{
%%section init
#!/usr/bin/perl -w
$ver = '$Id: tlu_rand5.j,v 1.1.1.1 2007/02/13 22:21:08 drp Exp $ ';
$ver =~ s/\$Id\s*:|Exp\s+\$//go;
print "!# Diag Generated using $ver\n\n";
#ijifdef WT_FILE
print "\n!# Included Weight File ", WT_FILE , "\n\n";
#ijendif
open (GEN, "jal.jj");
while (<GEN>){next if (!/^inst:/&&!$in);$in=1;$inst .= $_; last if(/^\s*;/)} 
close GEN;print "/* Grammar Weightings\n\n$inst  \n*/\n" ;
%%
// }}}

// %%section init {{{
%%section init

    // Pick master and TG master threads
    i = IJ_random()&0x3;
    j = IJ_random()&0x3;
    tgml1 = (1<<i); tgmh1 = ((1 <<j)<<4);
    tgrand1 = tgml1 | tgmh1;
    i = IJ_random()&0x3;
    j = IJ_random()&0x3;
    tgml2 = (1<<i); tgmh2 = ((1 <<j)<<4);
    tgrand2 = tgml2 | tgmh2;
    tmast = (1 << (IJ_random()&0x7));

#ijifdef TEMPLATE1
    // Pick unique (single) thread for tt1 and tt2
    i = IJ_random()&0x7;
    tt1 = (1<<i);
    while ((tt1&(tgrand1|tgrand2|tmast))){
        i = IJ_random()&0x7;
        tt1 = (1<<i);
    }
#ijendif
#ijifdef TEMPLATE2
    i = IJ_random()&0x7;
    tt2 = (1<<i);
    while ((tt2&(tt1|tgrand1|tgrand2|tmast))){
        i = IJ_random()&0x7;
        tt2 = (1<<i);
    }
#ijendif

    myrand = IJ_random()&0xff & ~(tt1|tt2);
    myrand2 = IJ_random()&0xff & ~(tt1|tt2);
    myrand3 = IJ_random()&0xff & ~(tt1|tt2);
    myrand2n = (~myrand2)&0xff & ~(tt1|tt2);
    myrand3n = (~myrand3)&0xff & ~(tt1|tt2);

#ijifdef TH_STRESS
    tst1 = IJ_random()&0xff ;
#ijendif
    tst1 = tst1 & ~(tgrand1|tgrand2|tmast|tt2|tt1);

    myrand = myrand & ~tst1;
    myrand2 = myrand2 & ~tst1;
    myrand3 = myrand3 & ~tst1;
    thall = thall & ~(tst1|tt1|tt2);

    //printf ("TA=0x%x TM=0x%x, TG1=0x%x, TG2=0x%x, MR=0x%x, MR2=0x%x, MR3=0x%x, MR2N=0x%x, MR3N=0x%0x, TST1=0x%x TT1=0x%x TT2=0x%x\n", thall, tmast, tgrand1, tgrand2, myrand, myrand2, myrand3, myrand2n, myrand3n, tst1, tt1, tt2);
   
#ij ifdef MT
    IJ_bind_thread_group(th_realall, 0xff);
    IJ_bind_thread_group(th_all, thall);
    IJ_bind_thread_group(th_A, 0x55);
    IJ_bind_thread_group(th_B,0xaa);
    IJ_bind_thread_group(th_C,0x11);
    IJ_bind_thread_group(th_D,0xee);
    IJ_bind_thread_group(th_E,0x10);
    IJ_bind_thread_group(th_stress,tst1);
    IJ_set_rvar(Rv_tid,"4'b0rrr");
    IJ_set_rvar(Rv_intdisvec,"32'hrrr0rrrr");
    IJ_bind_thread_group(th_rand,myrand);
    IJ_bind_thread_group(th_rand2,myrand2);
    IJ_bind_thread_group(th_rand3,myrand3);
    IJ_bind_thread_group(th_rand2n,myrand2n);
    IJ_bind_thread_group(th_rand3n,myrand3n);
    IJ_bind_thread_group(th_tgm1,tgrand1);
    IJ_bind_thread_group(th_tgm2,tgrand2);
    IJ_bind_thread_group(th_tgmh1,tgmh1);
    IJ_bind_thread_group(th_tgmh2,tgmh2);
    IJ_bind_thread_group(th_tgml1,tgml1);
    IJ_bind_thread_group(th_tgml2,tgml2);
    IJ_bind_thread_group(th_mast,tmast);
    IJ_bind_thread_group(th_tt1,tt1);
    IJ_bind_thread_group(th_tt2,tt2);
    IJ_bind_thread_group(th_none, 0x0);
    IJ_bind_thread_group(th_0, 0x01);
    IJ_bind_thread_group(th_1, 0x02);
    IJ_bind_thread_group(th_2, 0x04);
    IJ_bind_thread_group(th_3, 0x08);
    IJ_bind_thread_group(th_4, 0x10);
    IJ_bind_thread_group(th_5, 0x20);
    IJ_bind_thread_group(th_6, 0x40);
    IJ_bind_thread_group(th_7, 0x80);
#ij else
    IJ_bind_thread_group(th_all, 0x01);
    IJ_bind_thread_group(th_A, 0x01);
    IJ_bind_thread_group(th_B,0x01);
    IJ_set_rvar(Rv_tid,"4'b0000");
    IJ_set_rvar(Rv_intdisvec,"18'hrrrrr, 6'h00, 8'hrr");
#ij endif

    IJ_bind_thread_group(th_0, 0x01);
    IJ_bind_thread_group(th_nz, 0xfe);

    // Random 64 bits //
    IJ_set_rvar(Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
    IJ_set_rvar(Rv_rand_32,"32'hrrrrrrrr");


    IJ_set_rvar(Rv_pdist_reg,"5'brrrr0");

    IJ_set_rvar(Rv_intdest,"5'brrrrr");

    IJ_set_rvar(Rv_offset,"6'brrr000");

    IJ_set_rvar(Rv_ceter,"{7:2,1..6}");

    IJ_set_rvar(Rv_cmpr,"{0x100, 0x150:2, 0x200:3, 0x250:2, 0x300}");
    IJ_set_rvar(Rv_fcmpr,"{0x380, 0x550, 0x700, 0x900, 0xc00}");
    IJ_set_rvar(Rv_nintdis,"{0,1:3}");  // Inverse of intdis ..

    // Rand register 

    IJ_set_rvar(Rv_randreg, "{6..20}");

    // TBA/HTBA values 

    IJ_set_rvar(Rv_htba, "29'{0}, 2'b0l, 11'{0}, 6'b1010l0, 16'{0}");
    IJ_set_rvar(Rv_tba, "29'{0}, 2'bj0, 11'{0}, 6'b1110j0, 16'{0}");
    
    //  LSU cntl reg ..
    //IJ_set_rvar(Rv_lsucntl,"63'hrrrrrrrr_rrrrrrrr,1'{1}");
    IJ_set_rvar(Rv_lsucntl,"32'hrrrrrrrr");
    IJ_set_rvar(Rv_lsucntl2,"{1..7}");

    // Pwr mgmt
    IJ_set_rvar(Rv_pwrmgmt,"14'brrrrrrrrrrrrrrr");

    // Illegal combos
    IJ_set_rvar(Rv_illtrap, "2'b1r,5'brrrr,6'b101rrr,19'hrrrrr");

    // Register usage - use 0-20 //
    // R31 is memory pointer
    // R30 is trap number register
    // R28/29 is return PC/NPC for reset traps when TL=MAXTL ..
    // R27 is used as a jmp ptr
    // DO NOT USE R31, R15, as these are used for memptr
    // FREE to use 0..13, 16..20 in this template 
    // (%o0-%o5, %l0-%l4)
    // (%r21 - %r26) (%l5 - %i2) should be used in handlers

    // Reset/RED handlers and relocators use l1-l7 (17-23).

    IJ_set_ropr_fld(ijdefault, Ft_Rs1, "{1..13,16..20}");
    IJ_set_ropr_fld(ijdefault, Ft_Rs2, "{1..13,16..20}");
    IJ_set_ropr_fld(ijdefault, Ft_Rd, "{8..13,16..20}");
    IJ_set_ropr_fld(ijdefault, Ft_Simm13, "13'brrrrrrrrrrrrr");
    IJ_set_ropr_fld(ijdefault, Ft_Simm11, "11'brrrrrrrrrrr");
    IJ_set_ropr_fld(ijdefault, Ft_Imm_Asi, "{0x4, 0xc, 0x10, 0x12,0x17,0x1e,0x20, 0x14, 0x16, 0x1c, 0x2a, 0x30, 0x36, 0x39, 0x80, 0x82, 0x83, 0x88, 0x8a, 0x8b,0xc9, 0xe2,0xea,0xf8}");
    IJ_set_ropr_fld(ijdefault, Ft_A, "{0,1:2}");
    IJ_set_ropr_fld(ijdefault, Ft_Fcn, "{24}");
    IJ_set_ropr_fld(ijdefault, Ft_Disp22, "{1:6,2}");
    IJ_set_ropr_fld(ijdefault, Ft_Disp19, "{1:6,2}");
    IJ_set_ropr_fld(ijdefault, Ft_D16, "{1:6,2}");
    
    // Load/Store pointer = r31
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Rs1, "{31}");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Simm13, "{0x0}, 9'brrrrr0000");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Imm_Asi, "{0x4, 0xc, 0x10, 0x12,0x17,0x1e,0x20, 0x14, 0x16, 0x1c, 0x2a, 0x30, 0x36, 0x39, 0x80, 0x82, 0x83, 0x88, 0x8a, 0x8b,0xc9, 0xe2,0xea,0xf8}");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Fcn, "{24}");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Disp22, "{1:6,2}");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_Disp19, "{1:6,2}");
    IJ_set_ropr_fld(Ro_ldst_ptr, Ft_D16, "{1:6,2}");
    IJ_set_rvar(Rv_memptr, "32'{0}, 16'b011000000rr10100, 16'{0}");

    // ASI register values 
    IJ_set_ropr_fld(Ro_wrasi_i, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrasi_i, Ft_Simm13, "{0x4, 0x20, 0x10, 0x14, 0x16, 0x1c, 0x30, 0x36, 0x39, 0x4f, 0x58, 0x55, 0x80, 0x82, 0x83, 0x88, 0x89, 0x8a, 0x8b}");
  
    // General Ldst ASIs to use .. 50% should be illegal ..
    IJ_set_ropr_fld(Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x17,0x1e,0x20, 0x14, 0x16, 0x1c, 0x2a, 0x30, 0x36, 0x39, 0x80, 0x82, 0x83, 0x88, 0x8a, 0x8b,0xc9, 0xe2,0xea,0xf8}");
    IJ_set_ropr_fld(Ro_nontrap_ldasi, Ft_Rs1, "{31}");
    IJ_set_ropr_fld(Ro_nontrap_ldasi, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 9'brrrrrr000");

    IJ_set_ropr_fld(Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
    IJ_set_ropr_fld(Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 9'brrrrr0000");
    IJ_set_ropr_fld(Ro_nontrap_ldasi_z, Ft_Fcn, "{24}");

    // General Ldst alignment to use .. 50% should be illegal ..
    IJ_set_ropr_fld(Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
    IJ_set_ropr_fld(Ro_nontrap_ld, Ft_Rs1, "{31}");
    IJ_set_ropr_fld(Ro_nontrap_ld, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_nontrap_ld, Ft_Simm13, "{0x0}, 9'brrrrrrrrr");
    IJ_set_ropr_fld(Ro_nontrap_ld, Ft_Fcn, "{24}");
    
    // Block ldst ..
    IJ_set_ropr_fld(Ro_blksts, Ft_Imm_Asi, "{0x16,0x1f, 0xf0,0xf8, 0xf9,0xe0, 0xea, 0xe2, 0xf1, 0xd0, 0xd3, 0xda, 0xd9}");
    IJ_set_ropr_fld(Ro_blksts, Ft_Rs1, "{31}");
    IJ_set_ropr_fld(Ro_blksts, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_blksts, Ft_Rd, "{0,16,32,48}");
    IJ_set_ropr_fld(Ro_blksts, Ft_Simm13, "{0x0}, 9'brrrr00000");
    IJ_set_ropr_fld(Ro_blksts, Ft_Fcn, "{24}");
    IJ_set_ropr_fld(Ro_blksts, Ft_Disp22, "{1:6,2}");
    IJ_set_ropr_fld(Ro_blksts, Ft_Disp19, "{1:6,2}");
    IJ_set_ropr_fld(Ro_blksts, Ft_D16, "{1:6,2}");

    // Trap ASI operands
    IJ_set_tlist (tl_asi,
    /* asi (key), format, VAs */
        0x25,       "s", "{0x3c0,0x3c8,0x3d0,0x3d8,0x3e0,0x3e8,0x3f0,0x3f8}", NULL,
        0x48,       "s", "{0x8, 0x10}", NULL,
        0x49,       "s", "{0x8, 0x10}", NULL,
        0x4a,       "s", "{0x8, 0x110}", NULL,
        0x4c,       "s", "{0x0,0x8, 0x10, 0x18, 0x20, 0x28}", NULL,
        0x50,       "s", "{0x18, 0x38}", NULL,
        0x58,       "s", "{0x18, 0x20, 0x38}", NULL, 
        0x5a,       "s", "{0x0, 0x8, 0x10, 0x20, 0x28, 0x30, 0x38}", NULL,
        0x5b,       "s", "{0x0, 0x8, 0x10, 0x20, 0x28, 0x30, 0x38}", NULL,
        0x72,       "s", "{0x0}", NULL,
        0x73,       "s", "{0x0}", NULL,
        0x74,       "s", "{0x0}", NULL,
                 -1);
    //IJ_set_ropr_fld(Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x4c, 0x50, 0x58, 0x5a, 0x5b, 0x72..0x74}");
    IJ_set_ropr_fld(Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x4c, 0x50, 0x5a, 0x5b, 0x72..0x74}");
    IJ_set_ropr_fld(Ro_traps_asi, Ft_Rs1, "{1}");
    IJ_set_ropr_fld(Ro_traps_asi, Ft_Rs2, "{0}");
    // IJ_set_rvar(Rv_traps_asi, "{0x25, 0x4c, 0x50, 0x58, 0x5a, 0x5b, 0x72..0x74}");
    IJ_set_rvar(Rv_traps_asi, "{0x25, 0x4c, 0x50, 0x5a, 0x5b, 0x72..0x74, 0x48,0x49,0x4a}");

    // Trap #s to use
    IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x32..0x35, 0xb2..0xb5}");
    IJ_set_ropr_fld(Ro_traps_i, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
    IJ_set_ropr_fld(Ro_traps_r, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_traps_r, Ft_Rs2, "{30}");
    IJ_set_ropr_fld(Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
    //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
    IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x32..0x35, 0xb2..0xb5}");
    IJ_set_rvar(Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");

    // FPRS splash
    IJ_set_ropr_fld(Ro_wrfprs, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrfprs, Ft_Simm13, "{0, 4}");

    // Pstate splash
    IJ_set_ropr_fld(Ro_wrpstate, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrpstate, Ft_Simm13,  "1'{0,1:3},"   //tct[12]
                                             "8'brrrrrrrr,"          
                                             "1'{0:3,1},"   //am[3]
                                             "2'brr,"
                                             "1'{0,1:3}");  //ie[0]
    IJ_set_rvar(Rv_wrtstate, "32'h00rrrr00");

    // Hpstate splash
    IJ_set_ropr_fld(Ro_wrhpstate, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrhpstate, Ft_Simm13, "2'brr,"
                                             "1'{0,1:3},"   //ibe[10]
                                             "4'brrrr,"          
#ijifndef NORED
                                             "1'{0:25,1},"   //red[5]
#ijelse
                                             "1'b0,"   //red[5]
#ijendif
                                             "2'brr,"
                                             "1'{0,1:4},"   //hpriv[2]
                                             "1'br,"          
                                             "1'{0,1:3}");   //tlz[0]
                                             
    IJ_set_ropr_fld(Ro_wrrhpstate, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrrhpstate, Ft_Simm13, "2'brr,"
                                             "1'{0,1:3},"   //ibe[10]
                                             "4'brrrr,"          
#ijifndef NORED
                                             "1'{0:30,1},"   //red[5]
#ijelse
                                             "1'b0,"   //red[5]
#ijendif
                                             "2'brr,"
                                             "1'{0,1:4},"   //hpriv[2]
                                             "1'br,"          
                                             "1'{0,1:3}");   //tlz[0]

    IJ_set_ropr_fld(Ro_wrhp_nonhp, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrhp_nonhp, Ft_Simm13, "1'b0r,"
                                             "1'{0,1},"   //ibe[10]
                                             "4'brrrr,"          
                                             "1'{0},"       //red[5]
                                             "2'brr,"
                                             "1'b0,"       //hpriv[2]
                                             "1'br,"          
                                             "1'{0,1}");   //tlz[0]
    IJ_set_rvar(Rv_wrhp_nonhp,               "2'b0r,"
                                             "1'{0,1},"   //ibe[10]
                                             "4'brrrr,"          
                                             "1'b0,"       //red[5]
                                             "2'brr,"
                                             "1'{0},"       //hpriv[2]
                                             "1'br,"          
                                             "1'{0,1}");   //tlz[0]
    IJ_set_rvar(Rv_wrp_nonp,                 "1'{0,1},"   //tct[12]
                                             "8'brrrrrrrr,"          
                                             "1'{0,1},"   //am[3]
                                             "1'b0,"        //priv[2]
                                             "1'br,"
                                             "1'{0,1}");  //ie[0]
    // TT splash
    IJ_set_ropr_fld(Ro_wrtt, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");

    // GL splash
    IJ_set_ropr_fld(Ro_wrgl, Ft_Rs1, "{0}");
#ijifndef LOWGL
    IJ_set_ropr_fld(Ro_wrgl, Ft_Simm13, "4'brrrr");
#ijelse
    IJ_set_ropr_fld(Ro_wrgl, Ft_Simm13, "4'b0000");
#ijendif

    // TL splash
    IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{0..1}");
    IJ_set_ropr_fld(Ro_tl, Ft_Rs1,    "{0}");
    IJ_set_ropr_fld(Ro_tl5, Ft_Simm13, "{0..5}");
    IJ_set_ropr_fld(Ro_tl5, Ft_Rs1,    "{0}");

    // CWP splash
    IJ_set_ropr_fld(Ro_wrcwp, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_wrcwp, Ft_Simm13, "3'brrr");

    IJ_set_ropr_fld(Ro_save_restore, Ft_Rs1, "{31}");
    IJ_set_ropr_fld(Ro_save_restore, Ft_Rd,  "{31}");
    IJ_set_ropr_fld(Ro_save_restore, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_save_restore, Ft_Simm13, "{0..5}");

    IJ_set_ropr_fld(Ro_winops, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_winops, Ft_Simm13, "{0..5}");

    // {H}TBA Splash
    IJ_set_ropr_fld(Ro_tba, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_tba, Ft_Rs2, "{12}");

    // Dest reg is %g0
    IJ_set_ropr_fld(Ro_rd0, Ft_Rd, "{0}");
    
    // Splash cmprs
    IJ_set_ropr_fld(Ro_cmpr, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_cmpr, Ft_Rs2, "{10}");
    IJ_set_ropr_fld(Ro_cmpr, Ft_Rd, "{10}");
    IJ_set_ropr_fld(Ro_cmpr, Ft_Simm13, "13'b1111rrr111111");

    // Int Vector Setup
    IJ_set_ropr_fld(Ro_intvec_asi, Ft_Imm_Asi , "{0x73}");
    IJ_set_ropr_fld(Ro_intvec_asi, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_intvec_asi, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_intvec_asi, Ft_Rd, "{28}");
    IJ_set_ropr_fld(Ro_intvec_asi, Ft_Simm13, "{0x73}");

    // Mondo VAs
    IJ_set_ropr_fld(Ro_q_va, Ft_Simm13, "{0x3c0:3, 0x3c8, 0x3d0:3, 0x3d8, 0x3e0:3, 0x3e8}");
    IJ_set_ropr_fld(Ro_q_asi, Ft_Rs1, "{0x0}");
    IJ_set_ropr_fld(Ro_q_asi, Ft_Simm13, "{0x25}");

    // Debug 
    IJ_set_ropr_fld(Ro_debug, Ft_Rs1, "{0}");
    /*
    IJ_set_rvar(Rv_instmask, "25'{0},2'b10,"
                             "1'{0:2,1},"
                             "4'b0000,"
                             "2'{0,2,3},"
                             "8'brrrrrr11,22'hr");
    */
    IJ_set_rvar(Rv_instmask, "25'{0},39'hrrrrrrrrrr");
    IJ_set_rvar(Rv_ivaw_lsucntl, "2'{1}," "8'{1..256}," "2'brr");
    IJ_set_rvar(Rv_dvaw_lsucntl, "2'{2,3}," "8'{1..256}," "2'brr");
    IJ_set_rvar(Rv_tt, "{0x11, 0x21, 0x102, 0x120, 0x211, 0x221, 0x320}");

    // Cmp
    IJ_set_rvar(Rv_cmp,"8'brrrrrrrr");
    IJ_set_ropr_fld(Ro_cmp, Ft_Rs1, "{0}");

    // PMU
    IJ_set_ropr_fld(Ro_pmu, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_pmu, Ft_Rs2, "{7}");
    IJ_set_rvar(Rv_pic_64,"64'hffffffbr_ffffffar");
    IJ_set_rvar(Rv_pcr_32,"1'b0,"               // 0v1
                          "4'{2,3,4,5,0xb},"        // SL1
                          "8'b0rrrrrrr,"        // Mask1
                          "1'b0,"               // Ov0
                          "4'{2,3,4,5,0xb},"        // SL0
                          "8'b0rrrrrrr,"        // Mask0
                          "2'b11,"              // TOE
                          "4'brrrr");

    // CWQ 
    IJ_set_rvar(Rv_cwq_32,"32'h206100r0");

    // SMA 
    IJ_set_rvar(Rv_sma,"21'brrr100001111111111111");

    // FPD
    IJ_set_ropr_fld(Ro_fpd, Ft_Rs1, "{0}");
    IJ_set_ropr_fld(Ro_fpd, Ft_Rs2, "{4}");
    IJ_set_ropr_fld(Ro_fpd, Ft_Rd, "{4,6,8}");

    // Jmptr
    IJ_set_rvar(Rv_jmptr, "28'{0}, 20'b00001110000kk0100000, 16'{0}");
    IJ_set_ropr_fld(Ro_jmptr, Ft_Rs1, "{27}");
    IJ_set_ropr_fld(Ro_jmptr, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_jmptr, Ft_Rd, "{27}");

    // Frzjmp
    IJ_set_rvar(Rv_frzptr, "28'{0}, 23'b0000001111001011rr00000, 13'{0}");
    IJ_set_ropr_fld(Ro_frzptr, Ft_Rs1, "{27}");
    IJ_set_ropr_fld(Ro_frzptr, Ft_Rs2, "{0}");
    IJ_set_ropr_fld(Ro_frzptr, Ft_Rd, "{27}");

    // Loopz
    IJ_set_rvar(Rv_loopz, "7'b0rrrr11");

    // Weights
    IJ_set_default_rule_wt_rvar ("{5}");
    IJ_set_rvar(wt_high, "{9}");
    IJ_set_rvar(wt_med,  "{4}");
    IJ_set_rvar(wt_low,  "{1}");
    IJ_set_rvar(wt_nul,  "{0}");
    IJ_set_rvar(wt_rnd,  "{1,5,9}");

    // User Tokens
    IJ_define_user_token_group (uBR, tBRZ,tBRLEZ,tBRLZ,tBRNZ,tBRGZ,tBRGEZ,tFBPN,tFBPU,tFBPG,tFBPUG,tFBPL,tFBPUL,tFBPLG,tFBPNE,tFBPE,tFBPUE,tFBPGE,tFBPUGE,tFBPLE,tFBPULE,tFBPO,tBA,tBN,tBNE,tBE,tBG,tBLE,tBGE,tBL,tBGU,tBLEU,tBCC,tBCS,tBPOS,tBNEG,tBVC,tBVS) ;

    IJ_define_user_token_group (uCMPR,  tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R);
    IJ_define_user_token_group (uCMPR1,  tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R);
#ij ifdef FC8
    IJ_define_user_token_group (uSTATE,  tILLTRAP, tWRHPR_HPSTATE_I, tWRPR_PSTATE_I);
    IJ_define_user_token_group (uSTATE1,  tILLTRAP, tWRHPR_HPSTATE_I, tWRPR_PSTATE_I);
#ij else
    IJ_define_user_token_group (uSTATE,  tSIR, tWRHPR_HPSTATE_I, tWRPR_PSTATE_I);
    IJ_define_user_token_group (uSTATE1,  tSIR, tWRHPR_HPSTATE_I, tWRPR_PSTATE_I);
#ij endif
    IJ_define_user_token_group (uSTATE2,  tWRHPR_HPSTATE_I, tWRPR_PSTATE_I, tBN);
    IJ_define_user_token_group (uSTATE3,  tWRHPR_HPSTATE_I, tWRPR_PSTATE_I);
#ij ifdef FC8
    IJ_define_user_token_group (uDIFF,  tFDIVd, FMULq, FMULD8SUx16, tFBPUGE, tBRLEZ, tFCMPNE32, tFCMPd);
    IJ_define_user_token_group (uDIFFC,  tFDIVd, FMULq, FMULD8SUx16, tFCMPNE32, tFCMPd);
    IJ_define_user_token_group (uDIFFD,  tFDIVd, FMULq,  tFBPUGE,  tFCMPNE32);
#ij else
    IJ_define_user_token_group (uDIFF,  tFDIVd, FMULq, FMULD8SUx16, tFBPUGE, tBRLEZ, tFCMPNE32, tFCMPd, tSIR);
    IJ_define_user_token_group (uDIFFC,  tFDIVd, FMULq, FMULD8SUx16, tFCMPNE32, tFCMPd, tSIR);
    IJ_define_user_token_group (uDIFFD,  tFDIVd, FMULq,  tFBPUGE,  tFCMPNE32, tSIR);
#ij endif
    IJ_define_user_token_group (uLONG,  tFDIVd, FMULq, FMULD8SUx16, tFBPUGE, tBRLEZ, tFCMPNE32, tFCMPd, tCASA_I, tSTD_I, tPREFETCH_I);
    IJ_define_user_token_group (uLONGH,  tFDIVd, FMULq, FMULD8SUx16, tFBPUGE, tBRLEZ, tFCMPNE32, tFCMPd, tCASA_I, tSTD_I, tPREFETCH_I);
    IJ_define_user_token_group (uDIFF1,  tCASA_I, tSTD_I, tPREFETCH_I, tSTXFSR_R, tLDXFSR_R);
    IJ_define_user_token_group (uFPD,  tFDIVd, tFDIVs, tFCMPLE32, tFCMPd );
    IJ_define_user_token_group (uFPD1,  tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uDBG1,  tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uBLK2,  tSTDFA_R, tLDDFA_R, tBN);
    IJ_define_user_token_group (uDBG4,  tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uBLK5,  tSTDFA_R, tLDDFA_R, tSTDA_R, tLDDA_R);
    IJ_define_user_token_group (uDBG6,  tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I, tLDDA_R, tSTXFSR_R, tLDD_I, tLDDF_I, tSTDA_R, tLDDA_R, tPREFETCHA_I);
    IJ_define_user_token_group (uBLK8,  tSTDFA_R, tSTDFA_R, tLDDFA_R, tSTDA_R, tLDDA_R);
    IJ_define_user_token_group (uDBG9,  tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tCASA_R, tLDDF_I, tLDDA_R, tSTXFSR_R, tLDD_I, tSTDA_R, tLDDA_R);
    IJ_define_user_token_group (uBLK11,  tSTDFA_R, tSTDFA_R, tLDDFA_R, tLDDFA_R);
    IJ_define_user_token_group (uDBG12,  tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I, tCASA_R,tLDDF_I, tLDD_I, tSTXFSR_R, tLDDA_R, tSTDA_R, tLDDA_R, tPREFETCHA_I);
    IJ_define_user_token_group (uSRW, tSAVE_R, tRESTORE_R, tWRPR_WSTATE_R);
    IJ_define_user_token_group (uSRW1, tSAVE_R, tRESTORE_R, tWRPR_WSTATE_R);
    IJ_define_user_token_group (uBLK14,  tSTDFA_R,  tLDDFA_R,  tBN, tPDIST);
    IJ_define_user_token_group (uDBG15,  tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I, tLDDA_R, tSTXFSR_I, tLDDA_R, tLDDF_I,tBN, tPDIST);
    IJ_define_user_token_group (uDBG16,  tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I, tCASA_R, tLDDA_R, tSTXFSR_I, tLDD_I, tPDIST);
#ij ifdef FC8
    IJ_define_user_token_group (uDBG3,  tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I,  tLDDA_R, tSTXFSR_I,  tLDD_I, tPREFETCHA_I);
    IJ_define_user_token_group (uDBG7,  tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uDBG10,  tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uDBG13,  tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd,  tBN);
    IJ_define_user_token_group (uDBG17,  tFABSq, tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I,  tLDDA_R, tSTXFSR_I,  tLDD_I);
#ij else
    IJ_define_user_token_group (uDBG3,  tSIR, tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I,  tLDDA_R, tSTXFSR_I,  tLDD_I, tPREFETCHA_I);
    IJ_define_user_token_group (uDBG7,  tSIR, tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uDBG10,  tSIR, tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd);
    IJ_define_user_token_group (uDBG13,  tPDIST, tPOPC_I, tFDIVd, tFDIVs, tFCMPLE32, tFCMPd,  tSIR, tBN);
    IJ_define_user_token_group (uDBG17,  tFABSq, tSIR, tSTDA_R ,tSTD_I , tSTDF_I , tLDUHA_R , tLDXA_R, tCASA_I ,tLDDF_I,  tLDDA_R, tSTXFSR_I,  tLDD_I);
#ij endif
    IJ_define_user_token_group(uASI_LD_R, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDXA_R);
    IJ_define_user_token_group(uASI_LD_I, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDXA_R, tLDD_I);
    IJ_define_user_token_group(uASI_LDX_I, tLDXA_R, tPDIST);
    IJ_define_user_token_group(uASI_LDX_R, tLDXA_R);
    IJ_define_user_token_group(uLDD_I, tLDD_I);
    IJ_define_user_token_group(uFRZ, tBN, tBN, tBN, tSTDFA_R,  tLDDFA_R, tBN);
    IJ_define_user_token_group(uCR, tBN, tBN, tBN, tSTDFA_R,  tLDDFA_R, tBN);
    IJ_define_user_token_group(uLOOPB, tSTDFA_R,  tLDDFA_R );
    IJ_define_user_token_group(uLOOPZ,  tLDDF_I, tCASA_R, tLDD_R, tSTXFSR_I, tLDD_I );

    // Skip 
    IJ_copy_ropr (Ro_skip, ijdefault);
    IJ_set_ropr_fld (Ro_skip, Ft_P, "1'br");
    IJ_set_ropr_fld (Ro_skip, Ft_A, "1'br");
    IJ_set_ropr_fld (Ro_skip, Ft_D16, "{0x1,0x2, 0x5}");
    IJ_set_ropr_fld (Ro_skip, Ft_Disp22, "{0x1, 0x2, 0x5}");
    IJ_set_ropr_fld (Ro_skip, Ft_Disp19, "{0x1, 0x2, 0x5}");
    IJ_set_ropr_fld (Ro_skip, Ft_Disp30, "{0x1, 0x2, 0x5}");
    IJ_set_ropr_fld (Ro_skip, Ft_Label_Prefix, "skip_%y");
    IJ_set_rvar(Rv_align,"{128,512,1024,2048:2,4096}");
    IJ_set_rvar(Rv_align1,"{128,512,1024,2048:2}");

    IJ_set_ropr_fld (Ro_dummy, Ft_Label_Prefix, "%y");

    IJ_set_rvar(Rv_broffset,"{0,4}");
    
    // Sync Counter usage :
    // Sync counters 4-6 available in groups of 8
    // sync_thr_counter4 used for ANY CMP syncing.
    //    Master thread must never be parked
    // sync_thr_counter5 used for CWQ syncing
    // sync_thr_counter6 used for SMA syncing
    //
// !SIMS+ARGS: -vcs_run_args=+random_ccx_gnt

%asm<th_all>{
#ij ifdef MT
!# Diag generated in Multi Threaded mode ..
!# Embedded args follow:
!SIMS+ARGS: -vcs_run_args=+inval_rate=100
!SIMS+ARGS: -vcs_run_args=+noredwdrkill
!SIMS+ARGS: -vcs_run_args=+err_sync_on
!SIMS+ARGS: -vcs_run_args=+max_ccx_gnt_delay=0
%}
/*
if (IJ_random()&0x1) {
    IJ_printf (th_all, "!SIMS+ARGS: -vcs_run_args=+fast_boot\n");
}
*/
if (IJ_random()&0x1) {
    IJ_printf (th_all, "!SIMS+ARGS: -vcs_run_args=+l2miss_type=2\n"); 
}
/*
switch (IJ_random()&0xf) {
    case 2: IJ_printf (th_all, "!SIMS+ARGS: -vcs_run_args=+pwr_throttle=cycle\n"); 
            IJ_printf (th_all, "!SIMS+ARGS: -vcs_run_args=+pwr_throttle_freq=300\n");break;
    case 3: IJ_printf (th_all, "!SIMS+ARGS: -vcs_run_args=+pwr_throttle=pulse\n"); 
            IJ_printf (th_all, "!SIMS+ARGS: -vcs_run_args=+pwr_throttle_freq=300\n");break;
}
*/
if (!(IJ_random()%3)) {
    IJ_printf (th_all, "!SIMS+ARGS: -midas_args=-DCACHE_ASSOCIATE_MASK=%01d\n",IJ_random()&0x3);
}
switch (IJ_random()&0x3) {
    case 0:
        IJ_printf (th_all, "!SIMS+ARGS: -midas_args=-DTSB_SEARCH_BURST\n"); break;
    case 1:
        IJ_printf (th_all, "!SIMS+ARGS: -midas_args=-DTSB_SEARCH_PREDICTION\n"); break;
}
IJ_printf (th_all, "!#\n!# Master Thread Mask = %x\n", tmast);
IJ_printf (th_all, "!# Group Masters TG1 Mask = %x, (%x, %x)\n", tgrand1, tgmh1, tgml1);
IJ_printf (th_all, "!# Group Masters TG2 Mask = %x, (%x, %x)\n", tgrand2, tgmh2, tgml2);
IJ_printf (th_all, "!# Random sets: th_all=0x%x, th_rand=0x%x, th_rand2=0x%x, th_rand3=0x%x, th_rand2n=0x%x, th_rand3n=0x%x\n", thall, myrand, myrand2, myrand3, myrand2n, myrand3n);
#ijifdef TH_STRESS
IJ_printf (th_all, "!# Stress set: th_stress=0x%x\n", tst1);
#ijendif
#ijifdef TEMPLATE1
IJ_printf (th_all, "!# Template 1 mask set : th_tt1=0x%x\n", tt1);
#ijendif
#ijifdef TEMPLATE2
IJ_printf (th_all, "!# Template 2 mask set : th_tt2=0x%x\n", tt2);
#ijendif
IJ_printf (th_all, "!#\n\n");

%asm<th_all>{

#ij endif

#ij ifdef NO_SPU
#define NO_INTERNAL_SPU
#ij endif

#define IMMU_SKIP_IF_NO_TTE
#define DMMU_SKIP_IF_NO_TTE
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define DISABLE_PART_LIMIT_CHECK
#define MAIN_PAGE_USE_CONFIG 3
#define PART0_Z_TSB_SIZE_3 10
#define PART0_Z_PAGE_SIZE_3 1
#define PART0_NZ_TSB_SIZE_3 10
#define PART0_NZ_PAGE_SIZE_3 1
#define PART0_Z_TSB_SIZE_1 3
#define PART0_NZ_TSB_SIZE_1 3
#ij ifdef HIGH_VAS
#define PART_0_BASE 0x0
#define USER_PAGE_CUSTOM_MAP
#define MAIN_BASE_TEXT_VA 0x333000000
#define MAIN_BASE_TEXT_RA 0x033000000
#define MAIN_BASE_DATA_VA 0x379400000
#define MAIN_BASE_DATA_RA 0x079400000
#define HIGHVA_HIGHNUM 0x3
#ij else
#define TRAP_SECT_HV_ALSO
#ij endif

#define NO_EOB_MARKER

#undef INC_ERR_TRAPS

#undef H_HT0_Instruction_Access_MMU_Error_0x71
#define H_HT0_Instruction_Access_MMU_Error_0x71
#define SUN_H_HT0_Instruction_Access_MMU_Error_0x71 \
	mov 0x80, %l3;\
    stxa    %g0, [%l3]0x57;\
    retry;
#undef H_HT0_Instruction_access_error_0x0a
#define H_HT0_Instruction_access_error_0x0a 
#define SUN_H_HT0_Instruction_access_error_0x0a retry
#undef H_HT0_Internal_Processor_Error_0x29
#define H_HT0_Internal_Processor_Error_0x29 
#define SUN_H_HT0_Internal_Processor_Error_0x29 retry
#undef H_HT0_Data_Access_MMU_Error_0x72
#define H_HT0_Data_Access_MMU_Error_0x72 
#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
	mov 0x80, %l3;\
    stxa    %g0, [%l3]0x5f;\
    retry;
#undef H_HT0_Data_access_error_0x32
#define H_HT0_Data_access_error_0x32 
#define SUN_H_HT0_Data_access_error_0x32  \
	add     %g0, 0x18, %i1;\
	ldxa  [%i1] 0x58, %i2;\
    cmp %i2, 0x4;\
    bne 1f;\
    nop;\
    done;\
    1:retry
#undef H_HT0_Hw_Corrected_Error_0x63
#define H_HT0_Hw_Corrected_Error_0x63
#define SUN_H_HT0_Hw_Corrected_Error_0x63 ldxa [%g0]ASI_DESR, %i1; retry
#undef H_HT0_Sw_Recoverable_Error_0x40
#define H_HT0_Sw_Recoverable_Error_0x40 
#define SUN_H_HT0_Sw_Recoverable_Error_0x40 ldxa [%g0]ASI_DESR, %i1; retry
#undef H_HT0_Store_Error_0x07
#define H_HT0_Store_Error_0x07
#define SUN_H_HT0_Store_Error_0x07 retry

#define DAE_SKIP_IF_SOCU_ERROR

#ij include "tlu_custom_trap_handlers.s"
#ij include "tlu_custom_intr_handlers.s"

!# Steer towards main TBA on these errors ..
!# These are redefines ...
#undef My_RED_Mode_Other_Reset 
#define My_RED_Mode_Other_Reset
#define My_RED_Mode_Other_Reset \
    mov ZRED_Mode_Other_Reset ,%r1;\
    jmp %g1; nop;retry;nop;nop;nop;nop
/*
#undef SUN_H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
    best_set_reg(0x120000, %r1, %r2);\
    wrpr %r0, %r2, %tba; \
    done;nop

#undef SUN_H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
    best_set_reg(0x120000, %r1, %r2);\
    wrpr %r0, %r2, %tba; \
    done;nop
*/
#undef SUN_H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    set resolve_bad_tte, %g3;\
    jmp %g3;\
    nop

#undef My_HT0_IAE_privilege_violation_0x08
#define My_HT0_IAE_privilege_violation_0x08 \
    set resolve_bad_tte, %g3;\
    jmp %g3;\
    nop

#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    rdpr %tpc, %g1;\
    rdpr %tnpc, %g2;\
    stw %g1, [%i7];\
    stw %g2, [%i7+4];\
    jmpl %r27+8, %r27;\
    fdivd %f0, %f4, %f4;\
    nop;

#define H_HT0_Instruction_real_range_0x0e
#define SUN_H_HT0_Instruction_real_range_0x0e \
    rdpr %tpc, %g1;\
    rdpr %tnpc, %g2;\
    stw %g1, [%i7];\
    stw %g2, [%i7+4];\
    jmpl %r27+8, %r27;\
    fdivd %f0, %f4, %f4;\
    nop;

#undef SUN_H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    set resolve_bad_tte, %g3;\
    jmp %g3;\
    nop

#define H_HT0_Instruction_Invalid_TSB_Entry_0x2a
#define SUN_H_HT0_Instruction_Invalid_TSB_Entry_0x2a \
    set restore_range_regs, %g3;\
    jmp %g3;\
    nop

#define H_HT0_Data_Invalid_TSB_Entry_0x2b
#define SUN_H_HT0_Data_Invalid_TSB_Entry_0x2b \
    set restore_range_regs, %g3;\
    jmp %g3;\
    nop

#define H_T1_Reserved_0x00
#define SUN_H_T1_Reserved_0x00 \
    nop;\
    jmpl %r27+8, %r0;\
    nop;

#undef FAST_BOOT
#include "hboot.s"

#ifndef MULTIPASS
#define MULTIPASS 0
#endif

#ij ifdef HIGH_VAS
#define LOMEIN_TEXT_VA [0x]mpeval(MAIN_BASE_TEXT_VA&0xffffffff,16)
#define LOMEIN_DATA_VA [0x]mpeval(MAIN_BASE_DATA_VA&0xffffffff,16)
changequote([, ])dnl
SECTION .LOMEIN TEXT_VA=LOMEIN_TEXT_VA, DATA_VA=LOMEIN_DATA_VA
attr_text {
    Name = .LOMEIN,
    VA= LOMEIN_TEXT_VA,
    RA= MAIN_BASE_TEXT_RA,
    PA= ra2pa2(MAIN_BASE_TEXT_RA, 0),
    part_0_ctx_nonzero_tsb_config_1,
    part_0_ctx_zero_tsb_config_1,
    TTE_G=1, TTE_Context=0x44, TTE_V=1, 
    TTE_Size=0, TTE_NFO=0, TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=1,
    tsbonly
    }
attr_data {
    Name = .LOMEIN,
    VA= LOMEIN_DATA_VA,
    RA= MAIN_BASE_DATA_RA,
    PA= ra2pa2(MAIN_BASE_DATA_RA, 0),
    part_0_ctx_nonzero_tsb_config_2,
    part_0_ctx_zero_tsb_config_2
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
    tsbonly
        }
attr_data {
    Name = .LOMEIN,
    VA= LOMEIN_DATA_VA,
    RA= MAIN_BASE_DATA_RA,
    PA= ra2pa2(MAIN_BASE_DATA_RA, 0),
    part_0_ctx_nonzero_tsb_config_3,
    part_0_ctx_zero_tsb_config_3
        TTE_G=1, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
    tsbonly
        }
.text
.align 0x100000
    nop
.data
    .word 0x0

SECTION .MAIN TEXT_VA=MAIN_BASE_TEXT_VA, DATA_VA=MAIN_BASE_DATA_VA
attr_text {
    Name = .MAIN,
    VA=MAIN_BASE_TEXT_VA,
    RA= LOMEIN_TEXT_VA,
    PA= LOMEIN_TEXT_VA,
    part_0_ctx_nonzero_tsb_config_2,
    part_0_ctx_zero_tsb_config_2,
    TTE_G=1, TTE_Context=0x44, TTE_V=1, 
    TTE_Size=0, TTE_NFO=0, TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=1,
    }

attr_data {
    Name = .MAIN,
    VA=MAIN_BASE_DATA_VA
    RA= LOMEIN_DATA_VA,
    PA= LOMEIN_DATA_VA,
    part_0_ctx_nonzero_tsb_config_1,
    part_0_ctx_zero_tsb_config_1
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
        }

attr_data {
    Name = .MAIN,
    VA=MAIN_BASE_DATA_VA
    RA= LOMEIN_DATA_VA,
    PA= LOMEIN_DATA_VA,
    part_0_ctx_nonzero_tsb_config_3,
    part_0_ctx_zero_tsb_config_3
        TTE_G=1, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
    tsbonly
        }

attr_text {
    Name = .MAIN,
    VA=MAIN_BASE_TEXT_VA,
    hypervisor
}

attr_data {
    Name = .MAIN,
    VA=MAIN_BASE_DATA_VA
    hypervisor
}
changequote(`,')dnl'
#ij endif
.text
.global main
main:

    ! Set up ld/st area per thread
    ta T_CHANGE_HPRIV
    ldxa [%g0]0x63, %o2
    and %o2, 0x7, %o1
    brnz %o1, init_start
    mov 0xff, %r11
lock_sync_thds:
    set sync_thr_counter4, %r23
#if(!defined SPC && !defined PORTABLE_CORE)
    and %o2, 0x38, %o2
    add %o2,%r23,%r23           !Core's sync counter
#endif
    st %r11, [%r23]             !lock sync_thr_counter4
    add %r23, 64, %r23
    st %r11, [%r23]             !lock sync_thr_counter5
    add %r23, 64, %r23
    st %r11, [%r23]             !lock sync_thr_counter6
init_start:
    wrhpr %g0, 0x0, %hpstate  ! ta T_CHANGE_NONHPRIV
	umul	%r9, 256, %r31
	setx	user_data_start, %r1, %r3
	add	%r31, %r3, %r31
    wr  %r0, 0x4, %asi

%}
    // Initialize registers ..
    int i, j, k;
    IJ_printf  (th_all,"!Initializing integer registers\n");
    for (k=0; k<7; k++) {
        for (i = 0; i < 30; i++) {
            if (i==15) {
                IJ_printf  (th_all,"\tmov %%r31, %%r15\n");
                continue;
            }
            j=i*8;
            IJ_printf  (th_all,"\tldx [%%r31+%d], %%r%d\n", j,i);
        }
        IJ_printf  (th_all,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
        IJ_printf  (th_all,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
        IJ_printf  (th_all,"\tsave %%r31, %%r0, %%r31\n");
    }
    for (k=0; k<3; k++) {
        IJ_printf  (th_all,"\trestore\n");
    }

    IJ_printf  (th_all,"!Initializing float registers\n");
    for (i = 0; i < 31; i=i+2) {
        j=i*8;
        IJ_printf  (th_all,"\tldd [%%r31+%d], %%f%d\n", j,i);
    }

%asm<th_all>{
    !! Set TPC/TNPC to diag-finish in case we get to a strange TL ..
    ta T_CHANGE_HPRIV
    setx diag_finish, %r29, %r28
    add %r28, 4, %r29
%}
    for (k=1; k<7; k++) {
%asm<th_all>{
    wrpr %g0, $k, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
%}
    }
%asm<th_all>{
    wrpr %g0, 0, %tl
%}


%asm<th_all>{

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr

#if  (MULTIPASS > 0)
    mov 0x38, %g1
    stxa %r0, [%g1]ASI_SCRATCHPAD
#endif

    ! Set up fpr PMU traps 
    set @Rv_pcr_32, %g2
    b fork_threads
    wr %g2, %g0, %pcr
%}    
    IJ_printf(th_all, ".align %d\n", IJ_get_rvar_val32(Rv_align));
%asm<th_all>{
common_target:
    nop
    sub %r27, 8, %r27
    and %r27, 8, %r12
    mov HIGHVA_HIGHNUM, %r11
    sllx %r11, 32, %r11
    or %r27, %r11, %r27
    brz,a  %r12, .+8
    lduw [%r27], %r12      ! load jmp dest into dcache - xinval
    return %r27
%}
    if (IJ_random()&0x1) {
        IJ_generate_from_token(1, th_all, ijdefault, uDIFFC, uSTATE);
    } else  {
        IJ_generate_from_token(1, th_all, Ro_nontrap_ld, uDIFF1);
    }
    IJ_printf(th_all,"\tnop\n\tjmp %%r27\n");
    IJ_printf(th_all,"\tnop\n");
    IJ_printf(th_all,"!$EV trig_pc_d(1,@VA(.MAIN.fork_threads)) -> marker(bootEnd, *, 1)\n");
    IJ_printf(th_all, "fork_threads:\n");
    IJ_printf(th_all, "\trd %%tick, %%r17\n");
    IJ_printf(th_all, "\tmov 0x40, %%g1\n");
    IJ_printf(th_all, "setup_hwtw_config:\n");
    IJ_printf(th_all, "\tstxa %%r17, [%%g1]0x58\n");
#ij ifdef MT
    IJ_th_fork_group(th_realall);
#ij endif
%asm<th_mast>{
master_thread_stuff:
    
setup_tick:
    setx @Rv_rand_64, %r1, %r17
    wrpr %g0, %r17, %tick

    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_@{"%y"}:
    setx @Rv_rand_64, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
#ifdef SPLASH_HIDECR
    mov 8, %r1
    set SPLASH_HIDECR, %r2
    sllx %r2, 32, %r2
    stxa %r2, [%r1] 0x45
#endif
#if  (MULTIPASS > 0)
    mov 0x38, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %r10
    brnz %g1, unlock_sync_thds_@{"%y"}
    wrpr %g0, %g0, %pstate
#endif
#ifndef NO_INTERNAL_SPU
setup_spu_@{"%y"}:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %l6

#ifndef SPC
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
#ifndef PORTABLE_CORE
    sllx %o2, 5, %o2    !(CID*256)
    add %l6, %o2, %l6
#endif
#endif


    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %l5				!# then end of CWQ region to LAST
#ifndef SPC
    add %l5, %o2, %l5
#endif
    stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi

    !# set  CWQ control word ([39:37] is strand ID ..)
    best_set_reg(@Rv_cwq_32, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2

    !# write CWQ entry (%l6 points to CWQ)
    stx  %l2, [%l6 + 0x0]

    setx msg, %g1, %l2
    stx %l2, [%l6 + 0x8]	!# source address

    stx %g0, [%l6 + 0x10]	!# Authentication Key  Address (40-bit)
    stx %g0, [%l6 + 0x18]	!# Authentication IV   Address (40-bit)
    stx %g0, [%l6 + 0x20]	!# Authentication FSAS Address (40-bit)
    stx %g0, [%l6 + 0x28]	!# Encryption Key Address (40-bit)
    stx %g0, [%l6 + 0x30]	!# Encryption Initialization Vector Address (40-bit)

    setx    results, %g1, %o3
    stx %o3, [%l6 + 0x38]	!# Destination Address (40-bit)

    membar #Sync

    ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
    add %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi

    !# Kick off the CWQ operation by writing to the CWQ_CSR
    !# Set the enabled bit and reset the other bits
    or      %g0, 0x1, %g1
    stxa    %g1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
#endif
unlock_sync_thds_@{"%y"}:
    set sync_thr_counter6, %r23
#if (!defined SPC && ! defined PORTABLE_CORE)
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
    add %o2, %r23, %r23
#endif
    st %r0, [%r23]          !unlock sync_thr_counter6
    sub %r23, 64, %r23
    st %r0, [%r23]          !unlock sync_thr_counter5
    sub %r23, 64, %r23
    st %r0, [%r23]          !unlock sync_thr_counter4

    wr %r0, %r12, %asi
%}
%asm<th_all>{
    wrhpr %g0, @Rv_wrhp_nonhp, %hpstate  ! ta T_CHANGE_NONHPRIV 
%}


%%

// }}}

// %%section finish {{{
%%section finish

#ij ifndef NO_CMP
%asm<th_mast> {
#ijelse
%asm<th_none> {
#ijendif
cmpenall_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
    mov 0xff, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0xff, %r9                   ! My core mask
#endif
cmpenall_startwait@{"%y"}_$label:
    mov 0x@{"%y"}, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_@{"%y"}_$label
    nop
cmpenall_wait@{"%y"}_$label:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait@{"%y"}_$label
    nop
    ba,a cmpenall_startwait@{"%y"}_$label
continue_cmpenall_@{"%y"}_$label:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_@{"%y"}_$label
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_@{"%y"}_$label:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_@{"%y"}_$label
    ldxa [0x58]%asi, %r16       !Running_status
    st %g0, [%r23]              !clear lock
#if  (MULTIPASS > 0)
multipass_check_mt:
    rd %asi, %r12
    wr %g0, ASI_SCRATCHPAD, %asi
    ldxa [0x38]%asi, %r10
    cmp  %r10, MULTIPASS
    inc %r10
    stxa %r10, [0x38]%asi
    be finish_diag
    wr %g0, %r12, %asi
lock_sync_thds_again:
    mov 0xff, %r10
    set sync_thr_counter4, %r23
#ifndef SPC
    add %r23,%r8,%r23           !Core's sync counter
#endif
    st %r10, [%r23]             !lock sync_thr_counter4
    add %r23, 64, %r23
    st %r10, [%r23]             !lock sync_thr_counter5
    add %r23, 64, %r23
    st %r10, [%r23]             !lock sync_thr_counter6
    ba fork_threads
    wrpr %g0, %g0, %gl
#endif
%}
    IJ_printf(th_realall, "\tnop\n\tnop\n");
    IJ_printf(th_realall, "\tta T_CHANGE_PRIV\n");
    IJ_printf(th_realall, "\twrpr %%g0, %%g0, %%gl\n");
    IJ_printf(th_realall, "\tnop\n\tnop\n");
    IJ_th_join_group(th_realall);
%asm<th_all> {
SECTION .MAIN
.text
diag_finish:
    nop
    nop
    nop
    ta T_CHANGE_HPRIV
#if  (MULTIPASS > 0)
multipass_check:
    rd %asi, %r12
    wr %g0, ASI_SCRATCHPAD, %asi
    ldxa [0x38]%asi, %r10
    cmp  %r10, MULTIPASS
    inc %r10
    stxa %r10, [0x38]%asi
    wr %g0, %r12, %asi
    bne fork_threads
    wrpr %g0, %g0, %gl
#endif
finish_diag:
	best_set_reg(HV_TRAP_BASE_PA, %r1, %r2)
    wrhpr %g2, %g0, %htba
    ta T_GOOD_TRAP
    nop
    nop
    nop
.data
    .xword 0x0
    ! fp data rs1, rs2, fsr, gsr quads ..
.global fp_data_quads
fp_data_quads:
	.xword 0x0044000000000000
	.xword 0x4028000000000000
	.xword 0x0fc0400400000000 
	.xword 0x0000000000000000 
	.xword 0x0041000000000000
	.xword 0x4022000000000000
	.xword 0x0600800000000000 
	.xword 0x0000000000000000 
	.xword 0x0220000000000000
	.xword 0x4140000000000000
	.xword 0x4fc0400400000000 
	.xword 0x0000000000000000 
	.xword 0x4090000000000000
	.xword 0x0090000000000000
	.xword 0x0f80400800000000 
	.xword 0x0a00000000000000 
.align 128
.global user_data_start
.data
user_data_start:

%}
    int i,j;
    for (i = 0; i < 256; i++) {
        IJ_printf  (th_all,"\t.xword\t0x%016llrx\n", Rv_rand_64);
    }

%asm<th_all>{

SECTION .HTRAPS
.text
.global restore_range_regs
restore_range_regs:
    wr %g0, ASI_MMU_REAL_RANGE, %asi
    mov 1, %g1
    sllx %g1, 63, %g1
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_3] %asi
    retry

.global wdog_2_ext
#ij include "tlu_custom_trap_extensions.s"

%}

    for (i = 0; i < 4; i++) {
        IJ_iseg_printf  (MyHTRAPS, i, th_all,".text\n");
        IJ_iseg_printf  (MyHTRAPS, i, th_all, "#include \"htraps.s\"\n");
        IJ_iseg_printf  (MyHTRAPS, i, th_all,"#include \"tlu_htraps_ext.s\"\n");
        IJ_iseg_printf  (MyTRAPS, i, th_all,"#include \"traps.s\"\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,".text\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"nuff_said_%d:\n",i);
        IJ_iseg_generate_from_token (2, MyTEXT, i, th_all, Ro_blksts, uFPD,uBLK5);
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tmov HIGHVA_HIGHNUM, %%r11\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tsllx %%r11, 32, %%r11\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tor %%r27, %%r11, %%r27\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tjmpl %%r27+8, %%r0\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tjmpl %%r27+8, %%r0\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tjmpl %%r27+8, %%r0\n");
        IJ_iseg_printf  (MyTEXT, i, th_all,"\tjmpl %%r27+8, %%r0\n");
        IJ_iseg_generate_from_token (2, MyTEXT, i, th_all, Ro_blksts, uFPD,uBLK5);
        IJ_iseg_printf  (MyDATA, i, th_all,".data\n");
        for (j = 0; j < 32; j++) {
            IJ_iseg_printf  (MyDATA, i, th_all,"\t.xword\t0x%016llrx\n", Rv_rand_64);
        }
    }
    IJ_iseg_printf  (VaHOLE, 0, th_all, ".text\n.global vahole_target0\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, ".text\n.global vahole_target1\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, ".text\n.global vahole_target2\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, ".text\n.global vahole_target3\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "\tnop\n.align 4096\n\tnop\n.align 2048\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "\tnop\n.align 1024\n\tnop\n.align 512\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "\tnop\n.align 256\n\tnop\n.align 128\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "\tnop\n.align 64\n\tnop\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "\tnop\n.align 16\n\tnop;nop;nop\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "vahole_target0: nop;nop\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "vahole_target1: nop\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "vahole_target2: nop;nop;nop\n");
    IJ_iseg_printf  (VaHOLE, 0, th_all, "vahole_target3: nop;nop;nop\n");
    IJ_iseg_printf  (VaHOLEL, 0, th_all, ".text\n\tnop\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n.align 4096\n\tnop\n.align 2048\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n.align 1024\n\tnop\n.align 512\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n.align 256\n\tnop\n.align 128\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n.align 64\n\tnop\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n.align 16\n\tnop;nop;nop\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n\tnop\n\tjmpl %%r27+8, %%r0\n\tnop\n");
    IJ_iseg_printf  (VaHOLE_PA, 0, th_all, "\tnop\n\tnop\n\tjmpl %%r27+8, %%r0\n\tnop\n");
    IJ_iseg_printf  (MASKEDHOLE, 0, th_all,"\tmov HIGHVA_HIGHNUM, %%r11\n");
    IJ_iseg_printf  (MASKEDHOLE, 0, th_all,"\tsllx %%r11, 32, %%r11\n");
    IJ_iseg_printf  (MASKEDHOLE, 0, th_all,"\tor %%r27, %%r11, %%r27\n");
    IJ_iseg_printf  (MASKEDHOLE, 0, th_all, "\treturn %%r27+8\n\tnop\n");
    for (i = 0; i < 4; i++) {
        IJ_iseg_printf  (MyFRZn, i, th_all, "\tnop\n\tnop\n");
        IJ_iseg_printf  (MyFRZn, i, th_all, "\treturn %%r27+8\n");
        IJ_iseg_generate_from_token (1, MyFRZn, i, th_all, Ro_blksts, uDBG1, uBLK5, uDBG3);
        IJ_iseg_printf  (MyFRZ, i, th_all, "
.text
.global last_in_frz_1_%d

    nop
.align 4096
    nop
.align 2048
    nop
.align 1024
    nop
.align 512
    nop
.align 256
    nop
.align 128
    nop
.align 64
    nop
.align 16
    nop; nop; ;nop; nop; nop; nop; nop; nop; nop; nop; nop
last_in_frz_1_%d:
        ",i,i);
        IJ_iseg_generate_from_token (1, MyFRZ, i, th_all, Ro_blksts, uFPD, uBR, uDBG1, uBLK5, uDBG3);
    }
    IJ_iseg_printf  (ZERO, 0, th_all, "
.text
	nop
    mov HIGHVA_HIGHNUM, %%r11
    sllx %%r11, 32, %%r11
    or %%r27, %%r11, %%r27
	jmpl %%r27+8, %%r0
	nop
	jmpl %%r27+8, %%r0
	nop

Power_On_Reset:
    setx HRedmode_Reset_Handler, %%g1, %%g2
    jmp %%g2
    nop
.align 32
    
Watchdog_Reset:
    setx wdog_red_ext, %%g1, %%g2
    jmp %%g2
    nop
.align 32
    
External_Reset:
    My_External_Reset

.align 32
    
Software_Initiated_Reset:
    setx Software_Reset_Handler, %%g1, %%g2
    jmp %%g2
    nop

.align 32
    
.global ZRED_Mode_Other_Reset
ZRED_Mode_Other_Reset:
 ! IF TL=6, shift stack by one ..
    rdpr %%tl, %%l1
    cmp %%l1, 6
    be start_tsa_shift
    nop

continue_red_other:
    mov 0x1f, %%l1
    stxa    %%l1, [%%g0] ASI_LSU_CTL_REG

    rdpr %%tt, %%l1

    rdhpr %%htstate, %%l2
    and %%l2, 0x4, %%l2    ! If previously in hpriv mode, go to hpriv 
    brnz,a %%l2, red_goto_handler
    rdhpr %%htba, %%l2
    srlx %%l1, 7, %%l2     ! Send priv sw traps to priv mode ..
    cmp %%l2, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a red_goto_handler
    rdpr %%tba, %%l2
    rdhpr %%htba, %%l2
red_goto_handler:

    sllx %%l1, 5, %%l1
    add %%l1, %%l2, %%l2
    rdhpr %%htstate, %%l1
    andn %%l1, 0x20, %%l1
    wrhpr %%g0, %%l1, %%htstate
    rdhpr %%hpstate, %%l1
    jmp %%l2
    wrhpr %%l1, 0x20, %%hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %%tl, %%l1
    cmp %%l1, 6
    bl wdog_end
start_tsa_shift:
    mov 0x2, %%l2

tsa_shift:
    wrpr %%l2, %%tl
    rdpr %%tt, %%l3
    rdpr %%tpc, %%l4
    rdpr %%tnpc, %%l5
    rdpr %%tstate, %%l6
    rdhpr %%htstate, %%l7
    dec %%l2
    wrpr %%l2, %%tl
    wrpr %%l3, %%tt
    wrpr %%l4, %%tpc
    wrpr %%l5, %%tnpc
    wrpr %%l6, %%tstate
    wrhpr %%l7, %%htstate
    add %%l2, 2, %%l2
    cmp %%l2, %%l1
    ble tsa_shift
    nop
tsa_shift_done:
    dec %%l1
    wrpr %%l1, %%tl

wdog_end:
 ! If TT != 2, then goto trap handler
    rdpr %%tt, %%l1

    cmp %%l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %%l1
    stxa    %%l1, [%%g0] ASI_LSU_CTL_REG
    done
");

#ijifndef NO_SPU
%asm<th_all>{

SECTION .CWQ_DATA DATA_VA =0x4000
attr_data {
    Name = .CWQ_DATA 
    hypervisor
}

.data
.align 16
.global msg
msg:
.xword 0xad32fa52374cc6ba
.xword 0x4cbf52280549003a

.align 16
.global results
results:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
!# CWQ data area 
!# CWQ_BASE for core N is CWQ_BASE+(N*256)
!# CWQ_LAST for core N is CWQ_LAST+(N*256)
.align 64
.global CWQ_BASE
CWQ_BASE:
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.global CWQ_LAST
.align 64
CWQ_LAST:
.word 0x0
.align 64
cwq_base1:
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
cwq_last1:
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
%}
#ijendif

%%

// }}}

// %%section map {{{
%%section map


SECTION .MyHTRAPS  TEXT_VA = "29'{0}, 2'b0l, 11'{0}, 6'b1010l0, 16'{0}", 
                   DATA_VA = "29'{0}, 2'b0l, 11'{0}, 6'b1011l0, 16'{0}",
attr_text {
    Name = .MyHTRAPS,
    RA = "29'{0}, 2'b0l, 11'{0}, 6'b1010l0, 16'{0}",
    part_0_ctx_zero_tsb_config_3,
    part_0_ctx_nonzero_tsb_config_3,
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_Z_PAGE_SIZE_3, 
    TTE_NFO=0, TTE_IE=0, TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,
    TTE_CP="1'br",  TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P=1,        TTE_W=0, TTE_X=0
    }
attr_data {
    Name = .MyHTRAPS,  
    RA = "29'{0}, 2'b0l, 11'{0}, 6'b1011l0, 16'{0}",
    part_0_ctx_zero_tsb_config_3,
    part_0_ctx_nonzero_tsb_config_3,
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_Z_PAGE_SIZE_3, 
    TTE_NFO=0, TTE_IE=0, TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,
    TTE_CP="1'br",  TTE_CV="1'br", 
    TTE_E=0,      TTE_P=1,        TTE_W=0
    }
#ij ifndef HIGH_VAS
attr_text {
    Name = .MyHTRAPS,
    hypervisor
    }
attr_data {
    Name = .MyHTRAPS,
    hypervisor
    }
#ij endif
  enumerate {
    TEXT_VA
  }  

SECTION .MyTRAPS  TEXT_VA = "29'{0}, 2'bj0, 11'{0}, 6'b1110j0, 16'{0}", 
                  DATA_VA = "29'{0}, 2'bj0, 11'{0}, 6'b1111j0, 16'{0}",
attr_text {
    Name = .MyTRAPS,
    RA = "29'{0}, 2'bj0, 11'{0}, 6'b1110j0, 16'{0}",
    part_0_ctx_zero_tsb_config_3,
    part_0_ctx_nonzero_tsb_config_3,
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_Z_PAGE_SIZE_3, 
    TTE_NFO="1'br", TTE_IE="1'br", TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0,
    TTE_L=0,    TTE_CP="1'br",  TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P="1'br",        TTE_W="1'br", TTE_X="1'br"
    }
attr_data {
    Name = .MyTRAPS,  
    RA = "29'{0}, 2'bj0, 11'{0}, 6'b1111j0, 16'{0}",
    part_0_ctx_zero_tsb_config_3,
    part_0_ctx_nonzero_tsb_config_3,
    TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_Z_PAGE_SIZE_3, 
    TTE_NFO="1'br", TTE_IE="1'br", TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, 
    TTE_L=0,    TTE_CP="1'br",  TTE_CV="1'br", TTE_E=0,  TTE_P=1,  TTE_W="1'br"
    }

#ij ifndef HIGH_VAS
attr_text {
    Name = .MyTRAPS,
    hypervisor
    }
attr_data {
    Name = .MyTRAPS,
    hypervisor
    }
#ij endif
  enumerate {
    TEXT_VA
  }  

SECTION .MyDATA TEXT_VA = "32'{0}, 16'b111000000kk10100, 16'{0}",
                DATA_VA = "32'{0}, 16'b011000000kk10100, 16'{0}",
attr_text {
    Name = .MyDATA,  
    RA = "28'{0}, 16'b0001011100000kk1, 20'{0}",
    part_0_ctx_zero_tsb_config_0,
    part_0_ctx_nonzero_tsb_config_0,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size="0, 
#ij endif
    TTE_NFO="1'br",
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P="1'br",        TTE_W="1'br"
    }

attr_data {
    Name = .MyDATA,  
    RA = "28'{0}, 16'b0001011100000kk1, 20'{0}",
    part_0_ctx_zero_tsb_config_1,
    part_0_ctx_nonzero_tsb_config_1,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size=0, 
#ij endif
    TTE_NFO="1'br",
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P="1'br",        TTE_W="1'br"
    }

attr_data {
    Name = .MyDATA,  
    RA = "28'{0}, 16'b0001011100000kk1, 20'{0}",
    part_0_ctx_nonzero_tsb_config_2,
    TTE_G=1,       TTE_Context=SCONTEXT, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size=0, 
#ij endif
    TTE_NFO="1'br",
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P="1'br",        TTE_W="1'br",
    tsbonly
    }

attr_data {
    Name = .MyDATA,
    hypervisor
    }

attr_text {
    Name = .MyDATA,
    hypervisor
    }
  enumerate {
    TEXT_VA
  }  

SECTION .MyTEXT TEXT_VA = "28'{0}, 20'b00001110000kk0100000, 16'{0}"

attr_text {
    Name = .MyTEXT,  
    RA = "32'{0}, 16'b1110000kk0100000, 16'{0}",
    part_0_ctx_zero_tsb_config_1,
    part_0_ctx_nonzero_tsb_config_1,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size=0, 
#ij endif
    TTE_NFO=0,
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", TTE_EP="1'br",
    TTE_E="1'br",      TTE_P="1'br",        TTE_W="1'br"
    }

  enumerate {
    TEXT_VA
  }  


SECTION .VaHOLE TEXT_VA = "64'h00007fffffffe000"

attr_text {
    Name = .VaHOLE,  
    RA = "64'h00000000ffffe000",
    part_0_ctx_zero_tsb_config_1,
    part_0_ctx_nonzero_tsb_config_1,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size=0, 
#ij endif
    TTE_NFO=0,
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P=0,        TTE_W="1'br",
    TTE_X=1
    }

  enumerate {
    TEXT_VA
  }  

SECTION .VaHOLEL TEXT_VA = "64'h00000000ffffe000"
attr_text {
    Name = .VaHOLEL,  
    RA = "64'h00000000ffffe000",
    part_0_ctx_zero_tsb_config_0,
    part_0_ctx_nonzero_tsb_config_0,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size=0, 
#ij endif
    TTE_NFO=0,
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P=0,        TTE_W="1'br",
    TTE_X=1,
    tsbonly
    }

  enumerate {
    TEXT_VA
  }  

SECTION .ZERO TEXT_VA = "64'h0000000000000000"
attr_text {
    Name = .ZERO,
    RA = "64'h0000000000000000",
    part_0_ctx_zero_tsb_config_1,
    part_0_ctx_nonzero_tsb_config_1,
    TTE_G=1,       TTE_Context=0x44, TTE_V=1,
#ij ifndef NO_MHIT
    TTE_Size="{0,1,3,5}", 
#ij else
    TTE_Size=0, 
#ij endif
    TTE_NFO=0,
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br", 
    TTE_E="1'br",      TTE_P=0,        TTE_W=1,
    TTE_X=1
}
  enumerate {
    TEXT_VA
  }  

SECTION .VaHOLE_PA TEXT_VA = "64'h000000ffffffe000"
attr_text {
    Name = .VAHOLE_PA,
    hypervisor
}
  enumerate {
    TEXT_VA
  }  

SECTION .MASKEDHOLE TEXT_VA = "64'h0000000100000000"
attr_text {
    Name     = .MASKEDHOLE,
    RA   = "64'h0000000000000000",
    part_0_ctx_zero_tsb_config_3,
    part_0_ctx_nonzero_tsb_config_3,
    TTE_G    = 1, TTE_Context    = 0x44, TTE_V   = 1, TTE_Size   = 1, 
    TTE_NFO  = 0, TTE_IE     = 1, TTE_Soft2  = 0, TTE_Diag   = 0, 
    TTE_Soft   = 0, TTE_L    = 0, TTE_CP     = "1'br", TTE_CV     = 0, 
    TTE_E  = 0, TTE_P  = 0, TTE_W  = 0, TTE_X    = 1,
    tsbonly
}

attr_text {
    Name = .MASKEDHOLE,
        hypervisor
}
enumerate {
    TEXT_VA
}  

SECTION .MyFRZ TEXT_VA = "28'{0}, 23'b0000001111001011kk00000, 13'{0}"

attr_text {
    Name = .MyFRZ,  
    RA = "28'{0}, 23'b0000001111001011kk00000, 13'{0}",
    part_0_ctx_zero_tsb_config_1,
    part_0_ctx_nonzero_tsb_config_1,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
    TTE_Size=0, 
    TTE_NFO="1'br",
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br",  TTE_EP="1'br", 
    TTE_E="1'br",      TTE_P="1'br",        TTE_W="1'br"
    }

  enumerate {
    TEXT_VA
  }  

SECTION .MyFRZn TEXT_VA = "28'{0}, 23'b0000001111001011kk00001, 13'{0}"

attr_text {
    Name = .MyFRZn,  
    RA = "28'{0}, 23'b0000001111001011kk00001, 13'{0}",
    part_0_ctx_zero_tsb_config_2,
    part_0_ctx_nonzero_tsb_config_2,
    TTE_G=1,       TTE_Context=PCONTEXT, TTE_V=1,
    TTE_Size=0, 
    TTE_NFO=0,
    TTE_IE="1'br", 
    TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP="1'br",
    TTE_CV="1'br",TTE_EP=1, 
    TTE_E="1'br",      TTE_P=0,        TTE_W="1'br"
    }

  enumerate {
    TEXT_VA
  }  
%%

// }}}

// %%section grammar {{{
%%section grammar

#ijifdef TH_STRESS
block: inst | block inst stress2 stress  stress2
    {
        IJ_generate (th_all, $2);
        IJ_generate (th_stress, $3);
        IJ_generate (th_stress, $4);
        IJ_generate (th_stress, $5);
        if (IJ_random()&0x1) {
            IJ_generate_va (th_stress, $3,$4);
        } else {
            IJ_generate_va (th_stress, $3,$5);
        }
    };
#ijelse
block: inst | block inst  
    {
        IJ_generate (th_all, $2);
    };
#ijendif

#ijifdef WT_FILE
#ijinclude WT_FILE
#ijelse

inst:      trap_asr     %rvar wt_rnd
        |  trap_asi     %rvar wt_rnd
        |  tcc          %rvar wt_low
        | ldst_excp     %rvar wt_rnd
        | ldstasi_excp  %rvar wt_rnd
        | ldstasi_excp_z  %rvar wt_rnd
        | change_mode   %rvar wt_rnd
        | alu           %rvar wt_rnd
        | branches      %rvar wt_high
        | wrasi         %rvar wt_rnd
        | splash_fprs   %rvar wt_rnd
        | splash_pstate %rvar wt_rnd
        | splash_hpstate %rvar wt_rnd
        | splash_cwp    %rvar wt_rnd
        | splash_gl     %rvar wt_rnd
        | splash_tt     %rvar wt_rnd
        | stores        %rvar wt_high
        | sir           %rvar wt_rnd
        | splash_cmpr   %rvar wt_high
        | splash_tick   %rvar wt_low
        | splash_tba    %rvar wt_rnd
        | splash_htba   %rvar wt_rnd
        | splash_lsucnt %rvar wt_med
        | splash_decr   %rvar wt_low
        | demap         %rvar wt_rnd
        | tagged        %rvar wt_low
        | intvec        %rvar wt_high
        | intveclr      %rvar wt_high
        | xir         %rvar wt_rnd   
        | mondo       %rvar wt_high
        | dvapa       %rvar wt_high
#ijifndef NO_CMP
        | ibp         %rvar wt_high
        | iaw         %rvar wt_rnd
        | cmp         %rvar wt_high
#ijendif
        | donret      %rvar wt_high
        | pmu      %rvar wt_rnd
#ijifndef NO_SPU
        | cwq      %rvar wt_high
        | sma      %rvar wt_high
#ijendif
        | memptr   %rvar wt_high
        | pwr      %rvar wt_rnd
        | skip     %rvar wt_high
        | fpinit   %rvar wt_rnd
        | jmptr    %rvar wt_high
        | invtsb   %rvar wt_rnd
        | tglhtw   %rvar wt_low
        | unsuptte %rvar wt_rnd
        | blksts   %rvar wt_high
        | vahole   %rvar wt_high
        | brcommon %rvar wt_high
#ijifndef ERRINJ
        | cerer    %rvar wt_nul
        | ceter    %rvar wt_nul
#ijendif
        | ticken   %rvar wt_nul
        | frzjmp   %rvar wt_rnd
        | cancelint %rvar wt_high
;

#ijifdef TH_STRESS
stress : 
     uLONG %ropr Ro_ldst_ptr | uSRW %ropr Ro_save_restore | loopz | 
     uBLK14 %ropr Ro_blksts | uDBG3 %ropr Ro_ldst_ptr | tLDF_I %ropr Ro_ldst_ptr
;

stress2 : 
     tPDIST | tLDD_I %ropr Ro_ldst_ptr | tFDIVd | tFDIVs | tEDGE16N | tFMULD8SUx16 | tFNOT2S
;
#ijendif

#ijendif

cancelint:tALLCLEAN
    {
%asm<th_all>{
cancelint_@{"%y"}_$label:
    rdhpr %halt, %r@ijdefault.Ft_Rd
%}
    label++
    }
;
loopz : uLOOPB %ropr Ro_blksts
    {
%asm<th_stress>{
    nop
    nop
    mov @Rv_loopz, %g1
loopb_@{"%y"}_$label:
    ldstub [%r31+@Ro_ldst_ptr.Ft_Simm13], %r2
    brnz,a %r1, loopb_@{"%y"}_$label
    dec %r1
%}
    label++
    }
      | uLOOPZ %ropr Ro_ldst_ptr
    {
%asm<th_stress>{
    nop
    nop
    mov @Rv_loopz, %g1
loopz_@{"%y"}_$label:
    ldstub [%r31+@Ro_ldst_ptr.Ft_Simm13], %r2
    brnz,a %r1, loopz_@{"%y"}_$label
    dec %r1
%}
    label++
    }
;
frzjmp: uFRZ %ropr Ro_blksts
    {
%asm<th_all>{
frzptr_@{"%y"}_$label:
    nop
    nop
    best_set_reg(@Rv_frzptr+0x1ffc, %r20, %r27)
%}
    if (IJ_random()&0x1) {
        IJ_printf(th_rand3n, "\tsethi %%hi(0x%rx), %%r21\n", Rv_frzptr);
        IJ_printf(th_rand3n, "\tstxa %%r27, [%%r21]0x57\n");
    }
    if (IJ_random()&0x1) {
        IJ_printf(th_all, "\tldx [%%r27+0xc], %%r20\n");
    }
    if (IJ_random()&0x1) {
        IJ_printf(th_all, "\tjmpl %%r27+4, %%r27\n");
        IJ_generate_from_token(1, th_all, Ro_ldst_ptr, uLONG, tLDSTUB_I, tSTXFSR_I, tPDIST, tPOPC_I, tFDIVd);
%asm<th_all>{
    best_set_reg(@Rv_frzptr+0x1ffc, %r20, %r27)
%}
    }
    IJ_printf(th_all, "\tjmpl %%r27, %%r27\n");
    label++;
    }
;
ticken: tEDGE16LN
    {
%asm<th_mast>{
ticken_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(@Rv_rand_64, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
%}
    label++;
    }
;
splash_tick: tWRTICK_R %ropr Ro_cmpr
    {
%asm<th_mast>{
splash_tick_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(@Rv_rand_64, %r16, %r17)
%}
    label++;
    }
;

cerer: tMEMBAR
    {
%asm<th_mast>{
cerer_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(@Rv_rand_64, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
%}
    if (IJ_random()&0x1)  {
        IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    }
    label++;
    }
;
ceter: tRDTICK
    {
%asm<th_all>{
ceter_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    mov @Rv_ceter, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
%}
    if (IJ_random()&0x1)  {
        IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    }
    label++;
    }
;

brcommon: uDBG13 
    {  // {{{
%asm<th_all>{
brcommon1_@{"%y"}_$label:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-@Rv_broffset], %r12       ! Load common dest into dcache ..
    stuw %r12, [%r27-@Rv_broffset]       ! Load common dest into dcache ..
    ba,a .+12
%}        
    IJ_generate_from_token(1, th_all, Ro_ldst_ptr, tLDSTUB_I, tCASA_I, tCASA_R, tSTXFSR_I, tPDIST, tPOPC_I, tFDIVd);
%asm<th_all>{
    ba,a .+8
    jmpl %r27-@Rv_broffset, %r27
%}
        label++;
    } // }}}
    | uBLK14 %ropr Ro_blksts
    {  // {{{
%asm<th_all>{
brcommon2_@{"%y"}_$label:
    nop
    nop
    setx common_target, %r12, %r27
    ba,a .+12
%}        
    IJ_generate_from_token(1, th_A, Ro_ldst_ptr, tFDIVd, tFMULq, tFMULD8SUx16,tPREFETCH_I, tSIR,tFLUSH_R);
    IJ_generate_from_token(1, th_B, ijdefault, tFSQRTd, tLDQF_R, tFDIVd);
%asm<th_all>{
    ba,a .+8
    jmpl %r27-@Rv_broffset, %r27
%}
        label++;
    } // }}}
    | uDBG15 %ropr Ro_ldst_ptr
    {  // {{{
%asm<th_all>{
brcommon3_@{"%y"}_$label:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-@Rv_broffset], %r12       ! Load common dest into dcache ..
    stuw %r12, [%r27-@Rv_broffset]       ! Load common dest into dcache ..
    ba,a .+12
%}        
    IJ_generate_from_token(1, th_all, Ro_ldst_ptr, tSTQF_I, tSTQF_R, tCASA_I, tCASA_R, tLDSTUB_I);
%asm<th_all>{
    ba,a .+8
    jmpl %r27-@Rv_broffset, %r27
%}
        label++;
    } // }}}
    | uSTATE2 %ropr Ro_wrrhpstate
    {  // {{{
%asm<th_all>{
brcommon3_@{"%y"}_$label:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-@Rv_broffset], %r12       ! Load common dest into dcache ..
    stuw %r12, [%r27-@Rv_broffset]       ! Load common dest into dcache ..
    ba,a .+12
%}        
    IJ_generate_from_token(1, th_all, Ro_ldst_ptr, tSTQF_I, tSTQF_R, tCASA_I, tCASA_R, tLDSTUB_I);
%asm<th_all>{
    ba,a .+8
    jmpl %r27+0, %r27
%}
        label++;
    } // }}}
    | tFMOVGE 
    {  // {{{
%asm<th_all>{
brcommon3_@{"%y"}_$label:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    stuw %r12, [%r27]       ! Load common dest into dcache ..
    ba,a .+12
%}        
    IJ_generate_from_token(1, th_all, Ro_ldst_ptr, tSTQF_I, tSTQF_R, tCASA_I, tCASA_R, tLDSTUB_I);
%asm<th_all>{
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r@Rv_randreg, [%r0] ASI_LSU_CONTROL
%}
        label++;
    } // }}}
;
vahole : uDBG10 
    { // {{{
%asm<th_rand2>{
vahole1_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_NONHPRIV
%}
        IJ_printf(th_rand2, "\tsetx vahole_target%d, %%r18, %%r27\n",IJ_random()&3);
%asm<th_rand2>{
    jmpl %r27+0, %r27
%}
    label++
    } // }}}
    | uBLK11 %ropr Ro_blksts
    { // {{{
%asm<th_rand2>{
vahole2_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_NONHPRIV
%}
        IJ_printf(th_rand2, "\tsetx vahole_target%d, %%r18, %%r27\n",IJ_random()&3);
%asm<th_rand2>{
    jmpl %r27+0, %r27
%}
    label++
    } // }}}
    | uDBG12 %ropr Ro_ldst_ptr
    { // {{{
%asm<th_rand2>{
vahole3_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_NONHPRIV
%}
        IJ_printf(th_rand2, "\tsetx vahole_target%d, %%r18, %%r27\n",IJ_random()&3);
%asm<th_rand2>{
    jmpl %r27+0, %r27
%}
    label++
    } // }}}
    | uSTATE1 %ropr Ro_wrrhpstate
    { // {{{
%asm<th_rand2>{
vahole4_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_NONHPRIV
%}
        IJ_printf(th_rand2, "\tsetx vahole_target%d, %%r18, %%r27\n",IJ_random()&3);
%asm<th_rand2>{
    jmpl %r27+0, %r27
%}
    label++
    } // }}}
    | tBMASK 
    { // {{{
%asm<th_rand2>{
vahole5_@{"%y"}_$label:
    nop
    nop
%}
        IJ_printf(th_rand2, "\tsetx vahole_target%d, %%r18, %%r27\n",IJ_random()&3);
%asm<th_rand2>{
    jmpl %r27+0, %r27
%}
    switch (IJ_random()&0x3) {
        case 0: IJ_printf(th_rand2, "\tta T_CHANGE_NONHPRIV\n");break;
        case 1: IJ_printf(th_rand2, "\tta T_CHANGE_HPRIV\n");break;
        case 2: IJ_printf(th_rand2, "\tta T_CHANGE_PRIV\n");break;
        case 3: IJ_printf(th_rand2, "\tta T_CHANGE_NONPRIV\n");break;
    }
    label++
    } // }}}
    | uDBG16  %ropr Ro_ldst_ptr
    { // {{{
%asm<th_rand2>{
vahole6_@{"%y"}_$label:
    nop
    nop
    mov 1, %r27
    sllx %r27, 49, %r27
    jmpl %r27+0, %r27
%}
    switch (IJ_random()&0x1) {
        case 0: IJ_printf(th_rand2, "\tta T_CHANGE_NONHPRIV\n");break;
        case 1: IJ_printf(th_rand2, "\tta T_CHANGE_HPRIV\n");break;
    }
    label++
    } // }}}
;
tglhtw : tBSHUFFLE
    {
%asm<th_rand3>{
tglhtw_@{"%y"}_$label:
    nop
    nop
    rd %asi, %l3        ! save %asi
    ta T_CHANGE_HPRIV
    wr %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %asi
    mov 1, %l2
    sllx %l2, 63, %l2
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
    wrhpr %g0, @Rv_wrhp_nonhp, %hpstate  ! ta T_CHANGE_NONHPRIV
    wr %g0, %l3, %asi   !restore %asi
%}
    label++;
    }
;
unsuptte: uFPD1
    {
%asm<th_rand2>{
unsupttte_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
%}
    if (IJ_random()&0x1){
%asm<th_rand2>{
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
%}
   } else {
%asm<th_rand2>{
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
%}
   }
%asm<th_rand2>{
    wrhpr %g0, @Rv_wrhp_nonhp, %hpstate  ! ta T_CHANGE_NONHPRIV
%}
    label++;
    }
;
invtsb:tFBL
    {
%asm<th_rand>{
invtsb_@{"%y"}_$label:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    wrhpr %g0, @Rv_wrhp_nonhp, %hpstate  ! ta T_CHANGE_NONHPRIV 
%}
    label++;
    }
;
jmptr: tJMPL_R %ropr Ro_jmptr
    {
%asm<th_all>{
jmptr_@{"%y"}_$label:
    nop
    nop
    best_set_reg(@Rv_jmptr, %r20, %r27)
%}
    label++;
    }
;
fpinit:uFPD %ropr Ro_fpd
    {
%asm<th_all>{
fpinit_@{"%y"}_$label:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f@Ro_fpd.Ft_Rs1
    ldd [%r20+8], %f@Ro_fpd.Ft_Rs2
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
%}
    label++;
    }
;
skip: uDIFF
    { // {{{
    IJ_update_rvar(Rv_align);
    sprintf(label_suffix, "%d\0", label);
    IJ_set_ropr_fld (Ro_skip, Ft_Label_Counter, label_suffix);
    IJ_set_ropr_fld (Ro_skip, Ft_Label_Suffix, "");
    IJ_generate_from_token(1, th_rand2, Ro_skip, uBR);
    IJ_generate_from_token(1, th_rand2, Ro_skip, uBR, uDIFF);
    if (IJ_random()&0x1) {
        IJ_set_ropr_fld (Ro_skip, Ft_Label_Suffix, "-4");
    } else {
        IJ_set_ropr_fld (Ro_skip, Ft_Label_Suffix, "");
    }
    IJ_printf(th_rand2, ".align %d\nskip_%y_%d:\n", IJ_get_rvar_val32(Rv_align), label);
    label++;
    } // }}}
    | uDIFF1  %ropr Ro_nontrap_ld
    { // {{{
    IJ_update_rvar(Rv_align);
    sprintf(label_suffix, "%d\0", label);
    IJ_set_ropr_fld (Ro_skip, Ft_Label_Suffix, "");
    IJ_set_ropr_fld (Ro_skip, Ft_Label_Counter, label_suffix);
    IJ_generate_from_token(1, th_rand2, Ro_skip, uBR);
    IJ_printf(th_rand2, "\tstxa %%r%rd, [%%r0] ASI_LSU_CONTROL\n",Rv_randreg);
    IJ_generate_from_token(1, th_rand2, Ro_skip, uBR, uDIFF);
    IJ_printf(th_rand2, "\tstxa %%r%rd, [%%r0] ASI_LSU_CONTROL\n",Rv_randreg);
    IJ_printf(th_rand2, ".align %d\nskip_%y_%d:\n", IJ_get_rvar_val32(Rv_align), label);
    label++;
    } // }}}
;
pwr: tPDIST
    {
%asm<th_all>{
    set @Rv_pwrmgmt, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
%}
    }
;
memptr: tWRCCR_I
    {
    IJ_printf(th_all, "memptr_%y_%d:\n", label);
    if (label%3 == 0) { //
        IJ_printf(th_all, "\tset user_data_start, %%r31\n", Rv_memptr);
    } else {
        IJ_printf(th_all, "\tset 0x%rx, %%r31\n", Rv_memptr);
    }
    label++;
    }
;
sma: tCASA_I %ropr Ro_ldst_ptr
    {
%asm<th_all>{
    nop
    nop
    ta T_CHANGE_HPRIV
    mov 0x@{"%y"}, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
#ifndef PORTABLE_CORE
    add %o1, %r23, %r23
#endif
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_@{"%y"}_$label
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
%}
    int j;
    for(j=0; j<8; j++) {
      if (thall & (1<<j)) {
        IJ_bind_thread_group(sma_grp, 1<<j);
        IJ_update_rvar(Rv_sma);
	    IJ_printf(sma_grp, "\tset 0x%x, %%l7\n", IJ_get_rvar_val32(Rv_sma));
	    IJ_printf(sma_grp, "\tstxa	%%l7,	[%%g0 + 0x80] %%asi\n");
        IJ_printf(sma_grp, "!! RV_SMA for %d_%y is %llx\n", label,IJ_get_rvar_val32(Rv_sma));
        IJ_printf(sma_grp, "!! MA interrupt goes to TID %d\n", (IJ_get_rvar_val32(Rv_sma)>>18));
        IJ_printf(sma_grp, "ifelse(%d,mask2tid(0x%y),`wrhpr %%g0, 0x0, %%halt  ! HALT')\n" , (IJ_get_rvar_val32(Rv_sma)>>18));
      } 
    }
%asm<th_all>{  
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_@{"%y"}_$label:
    wrhpr %g0, @Rv_wrhp_nonhp, %hpstate  ! ta T_CHANGE_NONHPRIV
%}        
       label++;
    }
;
cwq: tRDPC
    {
%asm<th_all>{
    nop
    nop
    ta T_CHANGE_HPRIV
    mov 0x@{"%y"}+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
#ifndef PORTABLE_CORE
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_@{"%y"}_$label
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
%}
    IJ_printf(th_all, "\tbne cwq_%y_%d\n", label);
%asm<th_all>{
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
%}
    int j;
    for(j=0; j<8; j++) {
      if (thall & (1<<j)) {
        IJ_bind_thread_group(cwq_grp, 1<<j);
        IJ_update_rvar(Rv_cwq_32);
        IJ_printf(cwq_grp, "\tbest_set_reg(0x%x, %%l1, %%l2) !#Control Word %y \n", IJ_get_rvar_val32(Rv_cwq_32));
%asm<cwq_grp>{
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
cwq_pre_@{"%y"}_$label:
%}
    IJ_printf(cwq_grp, "!! CWQ interrupt (%08llx) goes to TID %d\n", IJ_get_rvar_val32(Rv_cwq_32), (IJ_get_rvar_val32(Rv_cwq_32)>>5)&0x7);
    IJ_printf(cwq_grp, "ifelse(%d,mask2tid(0x%y),`wrhpr %%g0, 0x0, %%halt  ! HALT')\n" , (IJ_get_rvar_val32(Rv_cwq_32)>>5)&0x7);
    IJ_printf(cwq_grp, "#if (defined SPC || defined CMP1)\n" );
    IJ_set_rvar(Rv_offset,"10'b1r1rrrr000");
    IJ_printf(cwq_grp, "ifelse(%d,mask2tid(0x%y),`!$EV trig_pc_d(1, expr(@VA(.MAIN.cwq_pre_%y_%d) , 16, 16)) -> intp(mask2tid(0x%y),0,45,*,%rd,*,*,1)')\n", (IJ_get_rvar_val32(Rv_cwq_32)>>5)&0x7, label , Rv_offset);
    IJ_printf(cwq_grp, "ifelse(%d,mask2tid(0x%y),`!$EV trig_pc_d(1, expr((@VA(.MAIN.cwq_pre_%y_%d)&0xffffffff) , 16, 16)) -> intp(mask2tid(0x%y),0,45,*,%rd,*,*,1)')\n", (IJ_get_rvar_val32(Rv_cwq_32)>>5)&0x7, label, Rv_offset);
    IJ_printf(cwq_grp, "#endif\n" );
    IJ_set_rvar(Rv_offset,"6'brrr000");
    }
    }
%asm<th_all>{  
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_@{"%y"}_$label:
    wrhpr %g0, @Rv_wrhp_nonhp, %hpstate  ! ta T_CHANGE_NONHPRIV
%}        
       label++;
    }
;

pmu: tWR_PERF_COUNTER_R %ropr Ro_pmu
    {
       IJ_printf(th_all, "pmu_%y_%d:\n\tnop\n\tnop\n", label); 
       if(IJ_random()&0x1)
            IJ_printf(th_all, "\tta T_CHANGE_PRIV\n");
       IJ_printf(th_all, "\tsetx 0x%016llrx, %%g1, %%g7\n", Rv_pic_64);
       label++
    }
;
donret: tFDIVd 
    { // {{{
        IJ_printf(th_all, "\tnop\n\tnop\n", label);
        IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_HPRIV);
        IJ_printf(th_all, "donret_%y_%d:\n", label);
        IJ_printf(th_all, "\trd %%pc, %%r12\n");
        IJ_printf(th_all, "\tmov HIGHVA_HIGHNUM, %%r10\n");
        IJ_printf(th_all, "\tsllx %%r10, 32, %%r10\n");
        IJ_printf(th_all, "\tor %%r12, %%r10, %%r12\n");
        if (IJ_random()&0x4) {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d+4), %%r12\n", label,label,Rv_offset);
            IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
        } else {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d), %%r12\n", label,label,Rv_offset);
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tadd %%r12, 0x8, %%r11 ! nonseq tnpc\n");
            } else {
                IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
            }
        }
        if (IJ_random()&0x4) {
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tandn %%r11, %%r10, %%r11 ! low VA tnpc\n");
            } else {
                IJ_printf(th_all, "\tandn %%r12, %%r10, %%r12 ! low VA tpc\n");
            }
        }
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{1..2}");
%asm<th_all>{
    wrpr %g0, 0x@Ro_tl.Ft_Simm13, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (@Rv_wrtstate | (@Ro_wrasi_i.Ft_Simm13 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, @Ro_wrrhpstate.Ft_Simm13, %htstate
%}
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  !  rand=1 (%y)\n", Rv_wrhp_nonhp);
        } else {
            IJ_printf(th_all, "\tbest_set_reg(0x%rx, %%g1, %%g2)\n\twrpr %%g0, %%g2, %%pstate  ! rand=0 (%y)\n", Rv_wrp_nonp);
        }
        if (!(IJ_random()%4)) {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
        if (label%2) {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r11+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tdone\n");
        } else {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r12+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tretry\n");
        }
        if (!(IJ_random()%3)) {
            IJ_printf(th_all, ".align %d\n", IJ_get_rvar_val32(Rv_align1));
        }
        IJ_printf(th_all, "donretarg_%y_%d:\n", label);
        label++;
    } // }}}
        | tLDSTUB_I %ropr Ro_nontrap_ld 
    { // {{{
        IJ_printf(th_all, "\tnop\n\tnop\n", label);
        IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_HPRIV);
        IJ_printf(th_all, "donret_%y_%d:\n", label);
        IJ_printf(th_all, "\trd %%pc, %%r12\n");
        IJ_printf(th_all, "\tmov HIGHVA_HIGHNUM, %%r10\n");
        IJ_printf(th_all, "\tsllx %%r10, 32, %%r10\n");
        IJ_printf(th_all, "\tor %%r12, %%r10, %%r12\n");
        if (IJ_random()&0x4) {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d+4), %%r12\n", label,label,Rv_offset);
            IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
        } else {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d), %%r12\n", label,label,Rv_offset);
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tadd %%r12, 0x8, %%r11 ! nonseq tnpc\n");
            } else {
                IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
            }
        }
        if (IJ_random()&0x4) {
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tandn %%r11, %%r10, %%r11 ! low VA tnpc\n");
            } else {
                IJ_printf(th_all, "\tandn %%r12, %%r10, %%r12 ! low VA tpc\n");
            }
        }
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{1..2}");
%asm<th_all>{
    wrpr %g0, 0x@Ro_tl.Ft_Simm13, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (@Rv_wrtstate | (@Ro_wrasi_i.Ft_Simm13 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, @Ro_wrrhpstate.Ft_Simm13, %htstate
%}
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  !  rand=1 (%y)\n", Rv_wrhp_nonhp);
        } else {
            IJ_printf(th_all, "\tbest_set_reg(0x%rx, %%g1, %%g2)\n\twrpr %%g0, %%g2, %%pstate  ! rand=0 (%y)\n", Rv_wrp_nonp);
        }
        if (!(IJ_random()%4)) {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
        if (label%2) {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r11+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tdone\n");
        } else {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r12+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tretry\n");
        }
        if (!(IJ_random()%3)) {
            IJ_printf(th_all, ".align %d\n", IJ_get_rvar_val32(Rv_align1));
        }
        IJ_printf(th_all, "donretarg_%y_%d:\n", label);
        label++;
    } // }}}
        | tSWAPA_R %ropr Ro_nontrap_ld
    { // {{{
        IJ_printf(th_all, "\tnop\n\tnop\n", label);
        IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_HPRIV);
        IJ_printf(th_all, "donret_%y_%d:\n", label);
        IJ_printf(th_all, "\trd %%pc, %%r12\n");
        IJ_printf(th_all, "\tmov HIGHVA_HIGHNUM, %%r10\n");
        IJ_printf(th_all, "\tsllx %%r10, 32, %%r10\n");
        IJ_printf(th_all, "\tor %%r12, %%r10, %%r12\n");
        if (IJ_random()&0x4) {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d+4), %%r12\n", label,label,Rv_offset);
            IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
        } else {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d), %%r12\n", label,label,Rv_offset);
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tadd %%r12, 0x8, %%r11 ! nonseq tnpc\n");
            } else {
                IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
            }
        }
        if (IJ_random()&0x4) {
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tandn %%r11, %%r10, %%r11 ! low VA tnpc\n");
            } else {
                IJ_printf(th_all, "\tandn %%r12, %%r10, %%r12 ! low VA tpc\n");
            }
        }
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{1..2}");
%asm<th_all>{
    wrpr %g0, 0x@Ro_tl.Ft_Simm13, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (@Rv_wrtstate | (@Ro_wrasi_i.Ft_Simm13 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, @Ro_wrrhpstate.Ft_Simm13, %htstate
%}
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  !  rand=1 (%y)\n", Rv_wrhp_nonhp);
        } else {
            IJ_printf(th_all, "\tbest_set_reg(0x%rx, %%g1, %%g2)\n\twrpr %%g0, %%g2, %%pstate  ! rand=0 (%y)\n", Rv_wrp_nonp);
        }
        if (!(IJ_random()%4)) {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
        if (label%2) {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r11+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tdone\n");
        } else {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r12+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tretry\n");
        }
        if (!(IJ_random()%3)) {
            IJ_printf(th_all, ".align %d\n", IJ_get_rvar_val32(Rv_align1));
        }
        IJ_printf(th_all, "donretarg_%y_%d:\n", label);
        label++;
    } // }}}
        | uBR 
    { // {{{
        IJ_printf(th_all, "\tnop\n\tnop\n", label);
        IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_HPRIV);
        IJ_printf(th_all, "donret_%y_%d:\n", label);
        IJ_printf(th_all, "\trd %%pc, %%r12\n");
        IJ_printf(th_all, "\tmov HIGHVA_HIGHNUM, %%r10\n");
        IJ_printf(th_all, "\tsllx %%r10, 32, %%r10\n");
        IJ_printf(th_all, "\tor %%r12, %%r10, %%r12\n");
        if (IJ_random()&0x4) {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d+4), %%r12\n", label,label,Rv_offset);
            IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
        } else {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d), %%r12\n", label,label,Rv_offset);
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tadd %%r12, 0x8, %%r11 ! nonseq tnpc\n");
            } else {
                IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
            }
        }
        if (IJ_random()&0x4) {
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tandn %%r11, %%r10, %%r11 ! low VA tnpc\n");
            } else {
                IJ_printf(th_all, "\tandn %%r12, %%r10, %%r12 ! low VA tpc\n");
            }
        }
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{1..2}");
%asm<th_all>{
    wrpr %g0, 0x@Ro_tl.Ft_Simm13, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (@Rv_wrtstate | (@Ro_wrasi_i.Ft_Simm13 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, @Ro_wrrhpstate.Ft_Simm13, %htstate
%}
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  !  rand=1 (%y)\n", Rv_wrhp_nonhp);
        } else {
            IJ_printf(th_all, "\tbest_set_reg(0x%rx, %%g1, %%g2)\n\twrpr %%g0, %%g2, %%pstate  ! rand=0 (%y)\n", Rv_wrp_nonp);
        }
        if (!(IJ_random()%4)) {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
        if (label%2) {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r11+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tdone\n");
        } else {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r12+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tretry\n");
        }
        if (!(IJ_random()%3)) {
            IJ_printf(th_all, ".align %d\n", IJ_get_rvar_val32(Rv_align1));
        }
        IJ_printf(th_all, "donretarg_%y_%d:\n", label);
        label++;
    } // }}}
        | uSTATE3 %ropr Ro_wrhpstate
    { // {{{
        IJ_printf(th_all, "\tnop\n\tnop\n", label);
        IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_HPRIV);
        IJ_printf(th_all, "donret_%y_%d:\n", label);
        IJ_printf(th_all, "\trd %%pc, %%r12\n");
        IJ_printf(th_all, "\tmov HIGHVA_HIGHNUM, %%r10\n");
        IJ_printf(th_all, "\tsllx %%r10, 32, %%r10\n");
        IJ_printf(th_all, "\tor %%r12, %%r10, %%r12\n");
        if (IJ_random()&0x4) {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d+4), %%r12\n", label,label,Rv_offset);
            IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
        } else {
            IJ_printf(th_all, "\tadd %%r12, (donretarg_%y_%d-donret_%y_%d), %%r12\n", label,label,Rv_offset);
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tadd %%r12, 0x8, %%r11 ! nonseq tnpc\n");
            } else {
                IJ_printf(th_all, "\tadd %%r12, 0x4, %%r11 ! seq tnpc\n");
            }
        }
        if (IJ_random()&0x4) {
            if (IJ_random()&0x1) {
                IJ_printf(th_all, "\tandn %%r11, %%r10, %%r11 ! low VA tnpc\n");
            } else {
                IJ_printf(th_all, "\tandn %%r12, %%r10, %%r12 ! low VA tpc\n");
            }
        }
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{1..2}");
%asm<th_all>{
    wrpr %g0, 0x@Ro_tl.Ft_Simm13, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (@Rv_wrtstate | (@Ro_wrasi_i.Ft_Simm13 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, @Ro_wrrhpstate.Ft_Simm13, %htstate
%}
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  !  rand=1 (%y)\n", Rv_wrhp_nonhp);
        } else {
            IJ_printf(th_all, "\tbest_set_reg(0x%rx, %%g1, %%g2)\n\twrpr %%g0, %%g2, %%pstate  ! rand=0 (%y)\n", Rv_wrp_nonp);
        }
        if (!(IJ_random()%4)) {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
        if (label%2) {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r11+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tdone\n");
        } else {
            if(IJ_random()&0x1) {
                IJ_printf(th_all, "\tldx [%%r12+%%r0], %%g1\n");
            }
            IJ_printf(th_all, "\tretry\n");
        }
        if (!(IJ_random()%3)) {
            IJ_printf(th_all, ".align %d\n", IJ_get_rvar_val32(Rv_align1));
        }
        IJ_printf(th_all, "donretarg_%y_%d:\n", label);
        label++;
    } // }}}
;
cmp: uDBG17 %ropr Ro_ldst_ptr
    {  // {{{
        IJ_printf(th_mast, "cmp_%y_%d:\n\tnop\n\tnop\n", label);
#ij ifdef MT
if (IJ_random()&0xf > 10 && (label%2==0)) {
    cmpex =1;
} else {
}
%asm<th_mast>{
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
    mov 0xff, %r9
#if (!defined PORTABLE_CORE || MAX_THREADS == 8)
%}
if(cmpex) {
    IJ_printf(th_mast, "\t!No core mask - cmpex trying to park all threads\n");

} else {
    IJ_printf(th_mast, "\txor %%r9, 0x%y, %%r9         ! My core mask\n");
}
%asm<th_mast>{
#else
    xor %r9, 0x@{"%y"}, %r9
#endif
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
%}
if(cmpex) {
    IJ_printf(th_mast, "\t!No core mask - cmpex trying to park all threads\n");

} else {
    IJ_printf(th_mast, "\txor %%r9, 0x%y, %%r9         ! My core mask\n");
}
%asm<th_mast>{
#endif
    mov 0x@{"%y"}, %r10
cmp_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_@{"%y"}_$label
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait@{"%y"}_$label:
    brnz,a %r10, cmp_wait@{"%y"}_$label
    ld [%r23], %r10
    ba cmp_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r10
continue_cmp_@{"%y"}_$label:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
#ifndef PORTABLE_CORE
    brz,a %r8, cmp_multi_core_@{"%y"}_$label
#endif
%}
if (cmpex) {
    IJ_printf(th_mast, "\tnot %%g0, %%r17\n");
}else {
    IJ_printf(th_mast, "\tmov 0x%rx, %%r17\n", Rv_cmp);
}
%asm<th_mast>{
#ifndef PORTABLE_CORE
    best_set_reg(@Rv_rand_64, %r16, %r17)
#else 
    sllx %r17, %r8, %r17
#endif
cmp_multi_core_@{"%y"}_$label:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
%}
#ij else
%asm<th_mast>{
    ta T_CHANGE_HPRIV
    clr %r14
%}

#ij endif
        if (label%2==0) {
            IJ_printf(th_mast, "\tstxa %%r14, [0x68]%%asi\n");
        } else {
            IJ_printf(th_mast, "\tstxa %%r14, [0x60]%%asi\n");
        }
        IJ_printf(th_mast, "\tst %%g0, [%%r23]\t!clear lock\n");
        IJ_printf(th_mast, "\twr %%g0, %%r12, %%asi\n");
        if (IJ_random()&0x1)
            IJ_printf(th_mast, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
        label++;
    } //}}}
    | tWRPR_PIL_R
    {  // {{{
        IJ_printf(th_mast, "cmp_%y_%d:\n\tnop\n\tnop\n", label);
#ij ifdef MT
if (IJ_random()&0xf > 10 && (label%2==0)) {
    cmpex =1;
} else {
}
%asm<th_mast>{
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
    mov 0xff, %r9
#if (!defined PORTABLE_CORE || MAX_THREADS == 8)
%}
if(cmpex) {
    IJ_printf(th_mast, "\t!No core mask - cmpex trying to park all threads\n");

} else {
    IJ_printf(th_mast, "\txor %%r9, 0x%y, %%r9         ! My core mask\n");
}
%asm<th_mast>{
#else
    xor %r9, 0x@{"%y"}, %r9
#endif
    sllx %r9, %r8, %r9              ! My core mask
    mov 0, %r8
#else
    mov 0, %r8
    mov 0xff, %r9                   
%}
if(cmpex) {
    IJ_printf(th_mast, "\t!No core mask - cmpex trying to park all threads\n");

} else {
    IJ_printf(th_mast, "\txor %%r9, 0x%y, %%r9         ! My core mask\n");
}
%asm<th_mast>{
#endif
    mov 0x@{"%y"}, %r10
cmp_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_@{"%y"}_$label
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait@{"%y"}_$label:
    brnz,a %r10, cmp_wait@{"%y"}_$label
    ld [%r23], %r10
    ba cmp_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r10
continue_cmp_@{"%y"}_$label:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_@{"%y"}_$label
%}
if (cmpex) {
    IJ_printf(th_mast, "\tnot %%g0, %%r17\n");
}else {
    IJ_printf(th_mast, "\tmov 0x%rx, %%r17\n", Rv_cmp);
}
%asm<th_mast>{
    best_set_reg(@Rv_rand_64, %r16, %r17)
cmp_multi_core_@{"%y"}_$label:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
%}
#ij else
%asm<th_mast>{
    ta T_CHANGE_HPRIV
    clr %r14
%}

#ij endif
        if (label%2==0) {
            IJ_printf(th_mast, "\tstxa %%r14, [0x68]%%asi\n");
        } else {
            IJ_printf(th_mast, "\tstxa %%r14, [0x60]%%asi\n");
        }
        IJ_printf(th_mast, "\tst %%g0, [%%r23]\t!clear lock\n");
        IJ_printf(th_mast, "\twr %%g0, %%r12, %%asi\n");
        if (IJ_random()&0x1)
            IJ_printf(th_mast, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
        label++;
    } //}}}
;
ibp : uDBG1 
    {  // {{{
        IJ_printf(th_all, "ibp_%y_%d:\n\tnop\n\tnop\n", label);
#ij ifdef MT
%asm<th_tgm1>{
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
#else
    mov 0, %r8
#endif
    mov 0x@{"%y"}, %r16
ibp_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_@{"%y"}_$label
%}
%asm<th_tgml1>{
    mov (~0x@{"%y"}&0xf), %r16
%}
%asm<th_tgmh1>{
    mov (~0x@{"%y"}&0xf0), %r16
%}
%asm<th_tgm1>{
    ld [%r23], %r16
ibp_wait@{"%y"}_$label:
    brnz %r16, ibp_wait@{"%y"}_$label
    ld [%r23], %r16
    ba ibp_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r16
continue_ibp_@{"%y"}_$label:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_@{"%y"}_$label
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_@{"%y"}_$label:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_@{"%y"}_$label
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit@{"%y"}_$label:
    best_set_reg(@Rv_instmask,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
%}
    if (IJ_random()&0x1)
        IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
#ij endif
} // }}}
    | uBLK2 %ropr Ro_blksts
    {  // {{{
        IJ_printf(th_all, "ibp_%y_%d:\n\tnop\n\tnop\n", label);
#ij ifdef MT
%asm<th_tgm1>{
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
#else
    mov 0, %r8
#endif
    mov 0x@{"%y"}, %r16
ibp_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_@{"%y"}_$label
%}
%asm<th_tgml1>{
    mov (~0x@{"%y"}&0xf), %r16
%}
%asm<th_tgmh1>{
    mov (~0x@{"%y"}&0xf0), %r16
%}
%asm<th_tgm1>{
    ld [%r23], %r16
ibp_wait@{"%y"}_$label:
    brnz %r16, ibp_wait@{"%y"}_$label
    ld [%r23], %r16
    ba ibp_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r16
continue_ibp_@{"%y"}_$label:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_@{"%y"}_$label
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_@{"%y"}_$label:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_@{"%y"}_$label
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit@{"%y"}_$label:
    best_set_reg(@Rv_instmask,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
%}
    if (IJ_random()&0x1)
        IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
#ij endif
} // }}}
    | uDBG3 %ropr Ro_ldst_ptr
    {  // {{{
        IJ_printf(th_all, "ibp_%y_%d:\n\tnop\n\tnop\n", label);
#ij ifdef MT
%asm<th_tgm1>{
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
#else
    mov 0, %r8
#endif
    mov 0x@{"%y"}, %r16
ibp_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_@{"%y"}_$label
%}
%asm<th_tgml1>{
    mov (~0x@{"%y"}&0xf), %r16
%}
%asm<th_tgmh1>{
    mov (~0x@{"%y"}&0xf0), %r16
%}
%asm<th_tgm1>{
    ld [%r23], %r16
ibp_wait@{"%y"}_$label:
    brnz %r16, ibp_wait@{"%y"}_$label
    ld [%r23], %r16
    ba ibp_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r16
continue_ibp_@{"%y"}_$label:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_@{"%y"}_$label
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_@{"%y"}_$label:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_@{"%y"}_$label
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit@{"%y"}_$label:
    best_set_reg(@Rv_instmask,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
%}
    if (IJ_random()&0x1)
        IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
#ij endif
} // }}}
;
iaw : uDBG4 
    {  // {{{
    IJ_printf(th_tgm2, "iaw_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_printf(th_tgm2, "\tta T_CHANGE_HPRIV\n");

%asm<th_tgm2>{
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
#else
    mov 0, %r8
#endif
    mov 0x@{"%y"}, %r16
iaw_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_@{"%y"}_$label
%}
%asm<th_tgml2>{
    mov (~0x@{"%y"}&0xf), %r16
%}
%asm<th_tgmh2>{
    mov (~0x@{"%y"}&0xf0), %r16
%}
%asm<th_tgm2>{
    ld [%r23], %r16
iaw_wait@{"%y"}_$label:
    brnz %r16, iaw_wait@{"%y"}_$label
    ld [%r23], %r16
    ba iaw_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r16
continue_iaw_@{"%y"}_$label:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_@{"%y"}_$label
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_@{"%y"}_$label:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_@{"%y"}_$label
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit@{"%y"}_$label:
%}
    IJ_printf(th_tgm2, "\tmov 0x38, %%r18\n");
    switch (label&0x7) {
    case 0:
        IJ_printf(th_tgm2, "iaw0_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\trd %%pc, %%r19\n");
        IJ_set_rvar(Rv_offset,"{1:3,5,9}");
        IJ_printf(th_tgm2, "\tadd %%r19, (16+%rd), %%r19\n", Rv_offset);
        IJ_set_rvar(Rv_offset,"6'brrr000");
        break;
    case 1:
    case 2:
    case 3:
        IJ_printf(th_tgm2, "iaw1_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tbest_set_reg(0x%016llrx, %%r20, %%r19)\n",Rv_jmptr);
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    case 4:
        IJ_printf(th_tgm2, "iaw2_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\trdpr %%tba, %%r19\n");
        IJ_printf(th_tgm2, "\tmov 0x%rx,  %%r20\n", Rv_tt);
        IJ_printf(th_tgm2, "\tsllx %%r20, 5, %%r20\n");
        IJ_printf(th_tgm2, "\tadd %%r20, %%r19, %%r19\n");
        break;
    case 5:
        IJ_printf(th_tgm2, "iaw3_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tsetx vahole_target%d, %%r20, %%r19\n",IJ_random()&0x1);
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    case 6:
    case 7:
        IJ_printf(th_tgm2, "iaw4_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tsetx common_target, %%r20, %%r19\n");
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    }
    IJ_printf(th_tgm2, "\tstxa %%r19, [%%r18]0x50\n");

%asm<th_tgm2>{
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
%}
    IJ_printf(th_tgm2, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
} // }}}
    | uBLK5 %ropr Ro_blksts
    {  // {{{
    IJ_printf(th_tgm2, "iaw_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_printf(th_tgm2, "\tta T_CHANGE_HPRIV\n");

%asm<th_tgm2>{
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
#else
    mov 0, %r8
#endif
    mov 0x@{"%y"}, %r16
iaw_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_@{"%y"}_$label
%}
%asm<th_tgml2>{
    mov (~0x@{"%y"}&0xf), %r16
%}
%asm<th_tgmh2>{
    mov (~0x@{"%y"}&0xf0), %r16
%}
%asm<th_tgm2>{
    ld [%r23], %r16
iaw_wait@{"%y"}_$label:
    brnz %r16, iaw_wait@{"%y"}_$label
    ld [%r23], %r16
    ba iaw_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r16
continue_iaw_@{"%y"}_$label:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_@{"%y"}_$label
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_@{"%y"}_$label:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_@{"%y"}_$label
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit@{"%y"}_$label:
%}
    IJ_printf(th_tgm2, "\tmov 0x38, %%r18\n");
    switch (label&0x7) {
    case 0:
        IJ_printf(th_tgm2, "iaw0_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\trd %%pc, %%r19\n");
        IJ_set_rvar(Rv_offset,"{1:3,5,9}");
        IJ_printf(th_tgm2, "\tadd %%r19, (16+%rd), %%r19\n", Rv_offset);
        IJ_set_rvar(Rv_offset,"6'brrr000");
        break;
    case 1:
    case 2:
    case 3:
        IJ_printf(th_tgm2, "iaw1_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tbest_set_reg(0x%016llrx, %%r20, %%r19)\n",Rv_jmptr);
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    case 4:
        IJ_printf(th_tgm2, "iaw2_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\trdpr %%tba, %%r19\n");
        IJ_printf(th_tgm2, "\tmov 0x%rx,  %%r20\n", Rv_tt);
        IJ_printf(th_tgm2, "\tsllx %%r20, 5, %%r20\n");
        IJ_printf(th_tgm2, "\tadd %%r20, %%r19, %%r19\n");
        break;
    case 5:
        IJ_printf(th_tgm2, "iaw3_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tsetx vahole_target%d, %%r20, %%r19\n",IJ_random()&0x1);
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    case 6:
    case 7:
        IJ_printf(th_tgm2, "iaw4_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tsetx common_target, %%r20, %%r19\n");
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    }
    IJ_printf(th_tgm2, "\tstxa %%r19, [%%r18]0x50\n");

%asm<th_tgm2>{
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
%}
    IJ_printf(th_tgm2, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
} // }}}
    | uDBG6 %ropr Ro_ldst_ptr
    {  // {{{
    IJ_printf(th_tgm2, "iaw_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_printf(th_tgm2, "\tta T_CHANGE_HPRIV\n");

%asm<th_tgm2>{
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
#ifndef PORTABLE_CORE
    add %r8, %r23, %r23
#endif
#else
    mov 0, %r8
#endif
    mov 0x@{"%y"}, %r16
iaw_startwait@{"%y"}_$label:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_@{"%y"}_$label
%}
%asm<th_tgml2>{
    mov (~0x@{"%y"}&0xf), %r16
%}
%asm<th_tgmh2>{
    mov (~0x@{"%y"}&0xf0), %r16
%}
%asm<th_tgm2>{
    ld [%r23], %r16
iaw_wait@{"%y"}_$label:
    brnz %r16, iaw_wait@{"%y"}_$label
    ld [%r23], %r16
    ba iaw_startwait@{"%y"}_$label
    mov 0x@{"%y"}, %r16
continue_iaw_@{"%y"}_$label:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_@{"%y"}_$label:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_@{"%y"}_$label
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_@{"%y"}_$label:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_@{"%y"}_$label
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit@{"%y"}_$label:
%}
    IJ_printf(th_tgm2, "\tmov 0x38, %%r18\n");
    switch (label&0x7) {
    case 0:
        IJ_printf(th_tgm2, "iaw0_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\trd %%pc, %%r19\n");
        IJ_set_rvar(Rv_offset,"{1:3,5,9}");
        IJ_printf(th_tgm2, "\tadd %%r19, (16+%rd), %%r19\n", Rv_offset);
        IJ_set_rvar(Rv_offset,"6'brrr000");
        break;
    case 1:
    case 2:
    case 3:
        IJ_printf(th_tgm2, "iaw1_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tbest_set_reg(0x%016llrx, %%r20, %%r19)\n",Rv_jmptr);
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    case 4:
        IJ_printf(th_tgm2, "iaw2_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\trdpr %%tba, %%r19\n");
        IJ_printf(th_tgm2, "\tmov 0x%rx,  %%r20\n", Rv_tt);
        IJ_printf(th_tgm2, "\tsllx %%r20, 5, %%r20\n");
        IJ_printf(th_tgm2, "\tadd %%r20, %%r19, %%r19\n");
        break;
    case 5:
        IJ_printf(th_tgm2, "iaw3_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tsetx vahole_target%d, %%r20, %%r19\n",IJ_random()&0x1);
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    case 6:
    case 7:
        IJ_printf(th_tgm2, "iaw4_%y_%d:\n", label);
        IJ_printf(th_tgm2, "\tsetx common_target, %%r20, %%r19\n");
        IJ_printf(th_tgm2, "\tor %%r19, 0x1, %%r19\n");
        break;
    }
    IJ_printf(th_tgm2, "\tstxa %%r19, [%%r18]0x50\n");

%asm<th_tgm2>{
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
%}
    IJ_printf(th_tgm2, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
} // }}}

;
dvapa : uDBG7 
    { // {{{
    IJ_printf(th_all, "dvapa_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n");
    IJ_printf(th_all, "\tmov 0x%rx, %%r20\n", Rv_dvaw_lsucntl);
    IJ_printf(th_all, "\tmov 0x%rx, %%r19\n", Rv_intdest);
    IJ_printf(th_all, "\tsllx %%r20, 23, %%r20\n");
    IJ_printf(th_all, "\tor %%r19, %%r20, %%r19\n");
    IJ_printf(th_all, "\tstxa %%r19, [%%g0] ASI_LSU_CONTROL\n");
    IJ_printf(th_all, "\tmov 0x38, %%r18\n");
    IJ_printf(th_all, "\tstxa %%r31, [%%r18]0x58\n");
    IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
    } // }}}
    | uBLK8 %ropr Ro_blksts
    { // {{{
    IJ_printf(th_all, "dvapa_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n");
    IJ_printf(th_all, "\tmov 0x%rx, %%r20\n", Rv_dvaw_lsucntl);
    IJ_printf(th_all, "\tmov 0x%rx, %%r19\n", Rv_intdest);
    IJ_printf(th_all, "\tsllx %%r20, 23, %%r20\n");
    IJ_printf(th_all, "\tor %%r19, %%r20, %%r19\n");
    IJ_printf(th_all, "\tstxa %%r19, [%%g0] ASI_LSU_CONTROL\n");
    IJ_printf(th_all, "\tmov 0x38, %%r18\n");
    IJ_printf(th_all, "\tstxa %%r31, [%%r18]0x58\n");
    IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
    } // }}}
    | uDBG9 %ropr Ro_ldst_ptr
    { // {{{
    IJ_printf(th_all, "dvapa_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n");
    IJ_printf(th_all, "\tmov 0x%rx, %%r20\n", Rv_dvaw_lsucntl);
    IJ_printf(th_all, "\tmov 0x%rx, %%r19\n", Rv_intdest);
    IJ_printf(th_all, "\tsllx %%r20, 23, %%r20\n");
    IJ_printf(th_all, "\tor %%r19, %%r20, %%r19\n");
    IJ_printf(th_all, "\tstxa %%r19, [%%g0] ASI_LSU_CONTROL\n");
    IJ_printf(th_all, "\tmov 0x38, %%r18\n");
    IJ_printf(th_all, "\tstxa %%r31, [%%r18]0x58\n");
    IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
    label++;
    } // }}}
;
mondo: tWRPR_WSTATE_R
    {
    IJ_printf(th_all, "mondo_%y_%d:\n\tnop\n\tnop\n", label);
    IJ_generate_from_token(1, th_all, Ro_q_asi, tWRASI_I);
    if(IJ_random()&0x1)
        IJ_printf(th_all, "\tta T_CHANGE_PRIV\n");
%asm<th_all>{
    stxa %r@ijdefault.Ft_Rs1, [%r0+@Ro_q_va.Ft_Simm13] %asi
%}
%asm<th_rand3>{
    stxa %r@ijdefault.Ft_Rs1, [%r0+@Ro_q_va.Ft_Simm13] %asi
%}
    IJ_generate_from_token(1, th_rand2, Ro_wrasi_i, tWRASI_I);
    IJ_generate_from_token(1, th_rand2n, Ro_wrasi_i, tWRASI_I);
    label++;
    }
;

intvec: uDIFFD
    {
    int have_ue = 0;

    int j;
    for(j=0; j<8; j++) {
      if (thall & (1<<j)) {
        IJ_bind_thread_group(ivt_grp, 1<<j);
        IJ_update_rvar(Rv_intdisvec);
        IJ_set_rvar(Rv_offset,"10'b1r1rrrr000");
        IJ_set_rvar(Rv_mask,"8'hrr");
        IJ_update_rvar(Rv_mask);
        int targ_mask = IJ_get_rvar_val32(Rv_mask) | (thall & (1<<j));
        if (label%2) {
         int my_thid=0;
            IJ_printf(ivt_grp, "\tnop\n\tnop\n\tset 0x%x, %%r28", IJ_get_rvar_val32(Rv_intdisvec));
            IJ_printf(ivt_grp,"\t!TTID : %d (mask2tid(0x%y))\n", (IJ_get_rvar_val32(Rv_intdisvec)&0x700)>>8);
            IJ_printf(ivt_grp, "#if (defined PORTABLE_CORE || MAX_THREADS == 8)\n");
            IJ_printf(ivt_grp, "\tsethi %%hi(0x3800), %%r27\n\tandn %%r28, %%r27, %%r28\n");
            IJ_printf(ivt_grp, "#ifdef PORTABLE_CORE\n\t! Add CID to vector\n");
            IJ_printf(ivt_grp, "\tta T_CHANGE_HPRIV\n");
            IJ_printf(ivt_grp, "\tldxa [%%g0]0x63, %%r27\n\tsllx %%r27, 8, %%r27\n");
            IJ_printf(ivt_grp, "\tor %%r27, %%r28, %%r28 \n#endif\n");
            if(IJ_random()&0x1)
            IJ_printf(ivt_grp, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
            IJ_printf(ivt_grp, "#endif\n");
            IJ_printf(ivt_grp, "\tsethi %%hi(0x30000), %%r27\n");
            IJ_printf(ivt_grp, "\tandn %%r28, %%r27, %%r28\n");
            if(label&0x1) {
                IJ_printf(ivt_grp, "\tta T_CHANGE_HPRIV\n");
            }
            IJ_printf(ivt_grp, "ifelse(%d,mask2tid(0x%y),`.align 16')\n" , (IJ_get_rvar_val32(Rv_intdisvec)&0x700)>>8);
            IJ_printf(ivt_grp, "\tstxa %%r28, [%%g0] 0x73\n");
        } else {
            have_ue = 1;
            IJ_printf(ivt_grp, "#if (defined SPC || defined CMP1)\n" );
            IJ_printf(ivt_grp, "!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_%y_%d) , 16, 16)) -> intp(%rd,0,%rd,*,%rd,*,%x,1)\n", label, Rv_tid, Rv_intdest,Rv_offset, targ_mask);
            IJ_printf(ivt_grp, "!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_%y_%d)&0xffffffff) , 16, 16)) -> intp(%rd,0,%rd,*,%rd,*,%x,1)\n", label, Rv_tid, Rv_intdest, Rv_offset, targ_mask);
            IJ_printf(ivt_grp, "#else\n" );
            IJ_printf(ivt_grp, "\tnop\n\tnop\n\tset 0x%x, %%r28", IJ_get_rvar_val32(Rv_intdisvec));
            IJ_printf(ivt_grp,"\t!TTID : %d (mask2tid(0x%y))\n", (IJ_get_rvar_val32(Rv_intdisvec)&0x700)>>8);
            IJ_printf(ivt_grp, "#if (defined PORTABLE_CORE || MAX_THREADS == 8)\n");
            IJ_printf(ivt_grp, "\tsethi %%hi(0x3800), %%r27\n\tandn %%r28, %%r27, %%r28\n");
            IJ_printf(ivt_grp, "#ifdef PORTABLE_CORE\n\t! Add CID to vector\n");
            IJ_printf(ivt_grp, "\tta T_CHANGE_HPRIV\n");
            IJ_printf(ivt_grp, "\tldxa [%%g0]0x63, %%r27\n\tsllx %%r27, 8, %%r27\n");
            IJ_printf(ivt_grp, "\tor %%r27, %%r28, %%r28 \n#endif\n");
            if(IJ_random()&0x1)
            IJ_printf(ivt_grp, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
            IJ_printf(ivt_grp, "#endif\n");

            IJ_printf(ivt_grp, "\tstxa %%r28, [%%g0] 0x73\n");
            IJ_printf(ivt_grp, "#endif\n" );
        }
        if(IJ_random()&0x1) {
            IJ_generate_from_token(1, ivt_grp, ijdefault, uDIFFD);
        }
        IJ_printf(ivt_grp, "intvec_%y_%d:\n", label);
        if (IJ_random()&0x1) {
            if (have_ue) {
                IJ_printf(ivt_grp, "#if (defined SPC || defined CMP1)\n" );
                    IJ_printf(ivt_grp, "\twrhpr %%g0, 0x0, %%halt  ! HALT\n");
                IJ_printf(ivt_grp, "#else\n" );
                    IJ_printf(ivt_grp, "ifelse(%d,mask2tid(0x%y),`wrhpr %%g0, 0x0, %%halt  ! HALT')\n" , (IJ_get_rvar_val32(Rv_intdisvec)&0x700)>>8);
                IJ_printf(ivt_grp, "#endif\n" );
            }
        } 
        if(!have_ue) {
            //IJ_printf(th_all, "ifelse(%d,mask2tid(0x%y),`wrhpr %%g0, 0x0, %%halt  ! HALT')\n" , (IJ_get_rvar_val32(Rv_intdisvec)&0x700)>>8);
        }
      }
    }
        IJ_set_rvar(Rv_offset,"6'brrr000");
        label++;
    }
;

intveclr: tFBPLG
    {
        IJ_printf(th_all, "intveclr_%y_%d:\n\tnop\n\tnop\n", label);
        IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n");
        IJ_printf(th_all, "\tsetx 0x%016llrx, %%r1, %%r28\n", Rv_rand_64);
        IJ_printf(th_all, "\tstxa %%r28, [%%g0] 0x72\n");
        if(IJ_random()&0x1)
            IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
        label++;
    }
;

xir: tWR_CLEAR_SOFTINT_I
    {
        IJ_set_rvar(Rv_offset,"10'b1r1rrrr000");
        IJ_printf(th_all, "#if (defined SPC || defined CMP)\n" );
        IJ_printf(th_all, "!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_%y_%d), 16, 16)) -> intp(mask2tid(0x%y),1,3,*,%rd,*,*,1)\n", label, Rv_offset);
        IJ_printf(th_all, "!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_%y_%d)&0xffffffff), 16, 16)) -> intp(mask2tid(0x%y),1,3,*,%rd,*,*,1)\n", label, Rv_offset);
        IJ_printf(th_all, "xir_%y_%d:\n", label);
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\twrhpr %%g0, 0x0, %%halt  ! HALT\n");
        }
        IJ_printf(th_all, "#else\n#if (defined FC)\n" );
        IJ_printf(th_all, "!! Generate XIR via RESET_GEN register\n");
        IJ_printf(th_all, "\tnop\n\tnop\n\tta T_CHANGE_HPRIV\n");
        IJ_printf(th_all, "\trdpr %%pstate, %%r18\n");
        IJ_printf(th_all, "\tandn %%r18, 0x208, %%r18 ! Reset pstate.am,cle\n");
        IJ_printf(th_all, "\twrpr %%r18, %%pstate\n");
        IJ_printf(th_all, "#ifndef XIR_RND_CORES\n");
        IJ_printf(th_all, "\tldxa [%%g0] 0x63, %%o1\n");
        IJ_printf(th_all, "\tmov 1, %%r18\n");
        IJ_printf(th_all, "\tsllx %%r18, %%o1, %%r18\n");
        IJ_printf(th_all, "#endif\n");
        IJ_printf(th_all, "\tmov 0x30, %%r19\n");
        IJ_printf(th_all, "\tsetx 0x8900000808, %%r16, %%r17\n");
        IJ_printf(th_all, "\tmov 0x2, %%r16\n");
        IJ_printf(th_all, "!! Poll RESET gen to see if no XIRs pending\n");
        IJ_printf(th_all, "\tldx [%%r17], %%r20\n");
        IJ_printf(th_all, "xirwait_%y_%d:\n", label);
        IJ_printf(th_all, "\tand %%r20, 2, %%r20\n");
        IJ_printf(th_all, "\tbrnz,a %%r20, xirwait_%y_%d\n",label);
        IJ_printf(th_all, "\tldx [%%r17], %%r20\n");
        IJ_printf(th_all, "xir_%y_%d:\n", label);
        IJ_printf(th_all, "\tstxa %%r18, [%%r19] 0x41\n");
        IJ_printf(th_all, "\tstx %%r16, [%%r17]\n");
        IJ_printf(th_all, "#endif\n#endif\n" );
        label++;
        IJ_set_rvar(Rv_offset,"6'brrr000");
    }
;


sir : tSIR  {
        IJ_generate_from_token(1, th_rand, Ro_ldst_ptr, uDIFF1, uDBG1, uDBG9);
}
;
demap :   uLDD_I %ropr Ro_nontrap_ld
    {
        IJ_printf(th_all, "demap_%y_%d:\n", label);
        IJ_set_rvar(Rv_demap, "{0x57, 0x5f}");
        IJ_printf(th_all, "\tnop\n\tmov 0x80, %%g3\n");
        IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n", Rv_lsucntl);
        if (IJ_random()&0x1) {
            IJ_printf(th_rand2, "\tstxa %%r%rd, [%%r0] ASI_LSU_CONTROL\n",Rv_randreg);
        } else {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
#ijifdef TH_STRESS
        int dloop = IJ_random()&0x7;
        int i;
        for (i= 0; i <=dloop; i++) {
            IJ_printf(th_all, "\tstxa %%g3, [%%g3] 0x%rx\n", Rv_demap);
            int num = IJ_random()&0x3;
            IJ_generate_from_token(num, th_rand3, Ro_save_restore, uSRW);
            IJ_generate_from_token(num, th_rand3n, Ro_blksts, uBLK5);
        }
#ijelse
        IJ_printf(th_all, "\tstxa %%g3, [%%g3] 0x%rx\n", Rv_demap);
        int num = IJ_random()&0x3;
        IJ_generate_from_token(num, th_rand3, Ro_save_restore, uSRW);
#ijendif
        IJ_printf(th_all, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
        label++;
    }
;

tagged: tLDUW_I %ropr Ro_nontrap_ld
    {
        IJ_printf(th_all, "tagged_%y_%d:\n", label);
        IJ_set_rvar(Rv_tof_r, "{0..13,16..20}");
        IJ_set_rvar(Rv_tof_i, "13'b1rrrrrrrrrrrr");
        if (label%2) {
            IJ_printf(th_all, "\ttaddcctv %%r%rd, 0x%rx, %%r%rd\n", 
                                Rv_tof_r, Rv_tof_i, Rv_tof_r);
        } else {
            IJ_printf(th_all, "\ttsubcctv %%r%rd, 0x%rx, %%r%rd\n", 
                                Rv_tof_r, Rv_tof_i, Rv_tof_r);
        }
        label++;
    }
;

change_mode :   
    reduce_priv_level %rvar wt_high
    | change_to_randtl %rvar wt_med
;



reduce_priv_level: tCHANGE_NONPRIV 
    {
        
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{0:2,1}");
        IJ_generate_from_token(1, th_all, Ro_tl, tWRPR_TL_I);
        IJ_printf(th_all, "reduce_priv_lvl_%y_%d:\n", label);
        label++;
    }
    | tCHANGE_NONHPRIV
    {
        
        IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{0:2,1}");
        IJ_generate_from_token(1, th_all, Ro_tl, tWRPR_TL_I);
        IJ_printf(th_all, "reduce_priv_lvl_%y_%d:\n", label);
        label++;
    }
;   

change_to_randtl: tWRPR_TL_I %ropr Ro_tl
    {
        IJ_printf(th_all, "change_to_randtl_%y_%d:\n", label);
        if (IJ_random()&0x1) {
#ijifndef LOWTL
            IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{0:3,1..2}");
#ijelse
            IJ_set_ropr_fld(Ro_tl, Ft_Simm13, "{0,1}");
#ijendif
            IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_HPRIV);
        } else {
            IJ_generate_from_token(1, th_all, ijdefault, tCHANGE_PRIV);
        }
        IJ_printf(th_all, "done_change_to_randtl_%y_%d:\n", label);
        label++;
    }
;   

trap_asr :
      tRDPR_TPC 
    | tRDPR_TSTATE 
    | tRDPR_TT
    //| tRDPR_TBA
    //| tRDPR_TL
    | tRDPR_GL
    //| tRDHPR_HTBA
    | tRDHPR_HPSTATE
    | tRD_TICK_CMPR_REG
    | tRD_STICK_CMPR_REG
    | tRD_STICK_REG         %ropr  Ro_rd0
    | tRDPR_TICK         %ropr  Ro_rd0
    | tRDPR_PIL    
    | tWRPR_PIL_I  
    | tRD_CLEAR_SOFTINT
    | tRD_SET_SOFTINT
    | tWR_CLEAR_SOFTINT_R
    //| tWR_CLEAR_SOFTINT_I
    //| tWRHPR_HINTP_R
    //| tWRHPR_HINTP_I
    | tRDHPR_HINTP
    //| tWR_SET_SOFTINT_R
    //| tWR_SOFTINT_REG_I
    | tWR_STICK_REG_R
;

splash_lsucnt: tFBPULE
    {
        IJ_printf(th_all, "splash_lsu_%y_%d:\n\tnop\n\tnop\n", label);
        IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n", Rv_lsucntl);
        IJ_printf(th_all, "\tset 0x%08llrx, %%r2\n", Rv_lsucntl);
        IJ_printf(th_all, "\tmov 0x%rx, %%r1\n", Rv_lsucntl2);
        IJ_printf(th_all, "\tsllx %%r1, 32, %%r1\n");
        IJ_printf(th_all, "\tor %%r1, %%r2, %%r2\n");
        if (IJ_random()&0x1)
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        IJ_printf(th_all, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
        if (IJ_random()&0x1)
            IJ_printf(th_all, "\tta T_CHANGE_NONHPRIV\n", Rv_lsucntl);
        label++;
    }
;

splash_decr: tWR_GRAPHICS_STATUS_REG_R
    {
%asm<th_rand>{
splash_decr_@{"%y"}_$label:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r@Rv_randreg, [%r1] 0x45
%}
        label++;
    }
;

splash_tba: tWRPR_TBA_R %ropr Ro_tba
    {
        IJ_printf(th_all, "splash_tba_%y_%d:\n\tnop\n", label);
        IJ_printf(th_all, "\tta T_CHANGE_PRIV\n");
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\tsetx 0x%016llrx, %%r11, %%r12\n", Rv_tba);
        } else {
            IJ_printf(th_all, "\tset 0x120000, %%r12\n");
        }
        label++;
    }
;
splash_htba: tWRHPR_HTBA_R %ropr Ro_tba
    {
        IJ_printf(th_all, "splash_htba_%y_%d:\n\tnop\n", label);
        IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n");
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\tsetx 0x%016llrx, %%r11, %%r12\n", Rv_htba);
        } else {
            IJ_printf(th_all, "\tbest_set_reg(HV_TRAP_BASE_PA, %%r11,%%r12)\n");
        }
        label++;
    }
;

splash_cmpr: tSIAM
    {
    IJ_printf(th_all, "\tnop\n\tnop\n");
    int hpriv = IJ_random()&0x1; 
    if (hpriv == 1) {
        IJ_printf(th_all, "\tta T_CHANGE_HPRIV\n");
    }
    int j;
    for(j=0; j<8; j++) {
      if (thall & (1<<j)) {
        IJ_bind_thread_group(cmpr_grp, 1<<j);
        IJ_update_rvar(Rv_nintdis);
        IJ_set_rvar(Rv_mask,"8'hrr");
        IJ_update_rvar(Rv_mask);
        int targ_mask = IJ_get_rvar_val32(Rv_mask) | (thall & (1<<j));
        IJ_printf(cmpr_grp, "\tmov 0x%x, %%r11\n", IJ_get_rvar_val32(Rv_nintdis));
%asm<cmpr_grp>{
splash_cmpr_@{"%y"}_$label:
    sllx %r11, 63, %r11
    not %r11, %r11
    rd %tick, %r10 
#if (defined SPC || defined CMP1)
    add %r10, @Rv_cmpr, %r10
#else 
    add %r10, @Rv_fcmpr, %r10
#endif
    and %r10, %r11, %r10
%}
      if (hpriv == 1) {
          IJ_printf(cmpr_grp, "\twrhpr %%r10, %%g0, %%hsys_tick_cmpr\n");
          if (IJ_get_rvar_val32(Rv_nintdis)) {
              IJ_printf(cmpr_grp, "\twrhpr %%g0, 0x0, %%halt  ! HALT\n");
          }
      }
      if (!(IJ_random()%3)) {
          IJ_printf(cmpr_grp, "\tta T_CHANGE_PRIV\n");
      }
      IJ_printf(cmpr_grp, "\trd %%tick, %%r10\n"); 
      IJ_printf(cmpr_grp, "#if (defined SPC || defined CMP1)\n" );
      IJ_printf(cmpr_grp, "\tadd %%r10, 0x%rx, %%r10\n", Rv_cmpr);
      IJ_printf(cmpr_grp, "#else\n");
      IJ_printf(cmpr_grp, "\tadd %%r10, 0x%rx, %%r10\n", Rv_fcmpr);
      IJ_printf(cmpr_grp, "#endif\n");
      IJ_printf(cmpr_grp, "\tand %%r10, %%r11, %%r10\n");
      IJ_generate_from_token(1, cmpr_grp, Ro_cmpr, uCMPR);
      if (IJ_get_rvar_val32(Rv_nintdis) == 1) {
        IJ_set_rvar(Rv_offset,"10'b1r1rrrr000");
        IJ_printf(cmpr_grp, "#if (defined SPC || defined CMP1)\n" );
        IJ_printf(cmpr_grp, "!$EV trig_pc_d(1, expr(@VA(.MAIN.splash_cmpr_%y_%d)+8 , 16, 16)) -> intp(%rd,0,%rd,*,%rd,*,%x,1)\n", label, Rv_tid, Rv_intdest,Rv_offset, targ_mask);
        IJ_printf(cmpr_grp, "!$EV trig_pc_d(1, expr((@VA(.MAIN.splash_cmpr_%y_%d)&0xffffffff)+8 , 16, 16)) -> intp(%rd,0,%rd,*,%rd,*,%x,1)\n", label, Rv_tid, Rv_intdest,Rv_offset, targ_mask);
        IJ_printf(cmpr_grp, "#endif\n" );
        IJ_set_rvar(Rv_offset,"6'brrr000");
        IJ_printf(cmpr_grp, "\twrhpr %%g0, 0x0, %%halt  ! HALT\n");
      }
      if (hpriv == 1) {
          IJ_generate_from_token(1, cmpr_grp, Ro_wrhpstate , tWRHPR_HPSTATE_I);
      }
     }
    }
    label++;

}
;   

splash_gl :
    tWRPR_GL_I %ropr Ro_wrgl
;
splash_tt :
    tWRPR_TT_I %ropr Ro_wrtt
;
splash_fprs :
    tWRFPRS_I %ropr Ro_wrfprs
;

splash_cwp : tWRPR_CWP_I %ropr Ro_wrcwp 
    {
%asm<th_all>{
cwp_@{"%y"}_$label:
    set user_data_start, %o7
%}
    label++;
    }
;

splash_pstate : tWRPR_PSTATE_I %ropr Ro_wrpstate
    {
     if (IJ_random()&0x1) {
        IJ_generate_from_token(1, th_all, ijdefault, uBR);
     }
     label++;
    }
;

splash_hpstate : tWRHPR_HPSTATE_I %ropr Ro_wrhpstate
    {
     IJ_printf(th_all, "splash_hpstate_%y_%d:\n", label);
     if(IJ_random()&0x1)
        IJ_printf(th_all, "\tta T_CHANGE_NONHPRIV\n");
     if (IJ_random()&0x1) {
        IJ_generate_from_token(1, th_all, ijdefault, uBR);
     }
     label++;
    }
;

trap_asi : uASI_LDX_R %ropr Ro_traps_asi
    {
    IJ_printf (th_all, "trapasi_%y_%d:\n\tnop\n", label); label++;
    IJ_update_rvar(Rv_traps_asi);
    char str1 [8]; int tmp = IJ_get_rvar_val32(Rv_traps_asi);
    sprintf(str1, "{0x%x}\0",tmp); 
    IJ_printf (th_all, "\tmov 0x%vx, %%r1 ", tl_asi, Rv_traps_asi , 0);
    IJ_printf (th_all, "\t! (VA for ASI 0x%x) \n", tmp);
    IJ_set_ropr_fld (Ro_traps_asi, Ft_Imm_Asi, str1);
    }
;

wrasi : tWRASI_I %ropr Ro_wrasi_i
;
reg_tcc : tTcc_R %ropr Ro_traps_r
     { 
     if (label%2) {
        IJ_generate_from_token(2, th_all, Ro_ldst_ptr, uDIFF1, uDBG1, uDBG9);
        IJ_printf(th_all, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
     } else {
        IJ_generate_from_token(2, th_all, Ro_ldst_ptr, uDIFF1, uDBG1, uDBG9);
        IJ_printf(th_all, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
     }
     }
;

tcc :
     tTcc_I %ropr Ro_traps_i  
     | reg_tcc

;

ldst_excp : 
        ldds %ropr Ro_nontrap_ldasi  |
        load_r %ropr Ro_nontrap_ldasi  |
        load_i %ropr Ro_nontrap_ldasi 

;

ldstasi_excp : 
        asi_load_i %ropr Ro_nontrap_ldasi
;
ldstasi_excp_z : 
         tLDUWA_R %ropr Ro_nontrap_ldasi_z
;



ldds: tLDD_R %ropr Ro_ldst_ptr | tLDD_I %ropr Ro_ldst_ptr | tLDDA_R  %ropr Ro_ldst_ptr | tLDDA_I   %ropr Ro_ldst_ptr 
;

stores:
    stds %ropr Ro_nontrap_ld |
    stfs %ropr Ro_nontrap_ld |
    stqfs %ropr Ro_nontrap_ld |
    sts %ropr Ro_nontrap_ld 
;
stds:  tSTDA_R | tSTDA_I | tSTD_R | tSTD_I | tSTDF_R | tSTDF_I 
;
stfs: tSTF_R | tSTF_I | tSTXFSR_R
;
stqfs: tSTQF_R | tSTQF_I
;
sts:    tSTB_I |  tSTH_I | tSTW_I | tSTX_R | tSTX_I
;
blksts: tLDDFA_R %ropr Ro_blksts | tLDDFA_I %ropr Ro_blksts | tSTDFA_I %ropr Ro_blksts | tSTDFA_R %ropr Ro_blksts
;

load_r: tLDXFSR_R | tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDDF_R | tLDUW_R | tLDQF_R 
;

load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDDF_I | tLDX_I 
        | tLDQFA_R 
;

asi_load_i: tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDXA_R
;




alu :
     tADDcc_R | tADDCcc_I | tANDNcc_R |
     tMULX_R | tUMULcc_R | tSDIVcc_R |
     tSMULcc_R | tSDIVX_R  | tFLUSHW | tFLUSH_R |
     tUDIVX_I | tFDIVs | tSWAP_I %ropr Ro_ldst_ptr |
     tSWAPA_I %ropr Ro_ldst_ptr | tCASA_R %ropr Ro_ldst_ptr | tPOPC_I |
     tFSQRTd | tFsMULd | tFNEGd | tFONES | tRDPR_CWP |
     tWR_GRAPHICS_STATUS_REG_I | tRDPR_FQ | tFCMPs | tFCMPEQ16 | 
     tPREFETCH_I %ropr Ro_ldst_ptr | tFCMPEd | tFCMPGT32 
     
;

br :     tBA | tBLE | tBGE | tBL | tBGU  | tBLEU | tBN | tBNE | tBE | tBG |
         tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBPA | tBPN | tBPNE |
         tBPE | tBPG | tBPLE | tBPGE | tBPL | tBPGU | tBPLEU | tBPCC | tBPCS |
         tBPPOS | tBPNEG | tBPVC | tBPVS  
;

branches : br | br_badelay | br_longdelay;

br_badelay : tRD_SOFTINT_REG 
    {
        IJ_printf(th_all, "br_badelay1_%y_%d:\n", label); label++;
        if (IJ_random()&0x1) {
            IJ_generate_from_token(1, th_all, Ro_ldst_ptr, uLONG);
            IJ_generate_from_token(1, th_all, ijdefault, tSTQF_I, tSTQF_R, uBR);
        } else {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
            IJ_generate_from_token(1, th_all, Ro_ldst_ptr, tSTQF_I, tSTQF_R, uLONG);
        }
        if (IJ_random()&0x1) {
            IJ_generate_from_token(1, th_all, Ro_ldst_ptr, uLONG);
        } else {
            IJ_generate_from_token(1, th_all, ijdefault, uBR);
        }
        IJ_printf(th_all, "\tnormalw\n");
    } 
    | tALIGNADDRESS
    {
        IJ_printf(th_all, "br_badelay2_%y_%d:\n", label); label++;
        IJ_generate_from_token(1, th_all, ijdefault, tBN, tBNE, tBE, tBG, tFDIVd);
        if ( label%3==0) {
            IJ_generate_from_token(1, th_all, ijdefault,tFDIVd, tPOPC_I);
        } else if (label%3 == 1) {
            IJ_printf(th_all, "\tallclean\n");
        } else {
            IJ_printf(th_all, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
        }
    } 
    | tFADDs
    {
        IJ_printf(th_all, "br_badelay3_%y_%d:\n", label); label++;
        IJ_generate_from_token(1, th_all, ijdefault, tBN, tBNE, tBE, tBG, tFDIVd);
        if (label%2) {
            IJ_printf(th_all, "\t.word 0x%rx\t! Random illegal ?\n", Rv_illtrap);
            //IJ_printf(th_all, "\t.xword 0x0\t! illegal\n");
        } else {
            IJ_generate_from_token(1, th_all, ijdefault, tBN, tBNE, tBE, tBG, tFDIVd);
        }
        IJ_generate_from_token(1, th_all, ijdefault, tFSQRTd, tLDQF_R, tFDIVd);
    } 

;

br_longdelay : uSRW %ropr Ro_save_restore 
    {
        IJ_printf(th_all, "br_longdelay1_%y_%d:\n", label); label++;
        IJ_generate_from_token(1, th_all, ijdefault, uBR);
    } 
    | uLONG %ropr Ro_ldst_ptr
    {
        IJ_printf(th_all, "br_longdelay2_%y_%d:\n", label); label++;
        IJ_generate_from_token(1, th_all, ijdefault, uBR);
    } 
    | uSTATE %ropr Ro_wrhpstate
    {
        IJ_printf(th_all, "br_longdelay3_%y_%d:\n", label); label++;
        IJ_printf(th_all, "\tnop\n\tnot %%g0, %%r27\n");
#ij ifndef NOVAHOLE
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\tandn %%r27, 0xf, %%r27\n");
        }
#ij endif
        IJ_printf(th_all, "\tjmpl %%r27+0, %%r27\n");
    }
    | tWRPR_WSTATE_I %ropr Ro_winops
    {
        IJ_printf(th_all, "br_longdelay4_%y_%d:\n", label); label++;
        IJ_printf(th_all, "\tnop\n\tnot %%g0, %%r27\n");
#ij ifndef NOVAHOLE
        if (IJ_random()&0x1) {
            IJ_printf(th_all, "\tandn %%r27, 0xf, %%r27\n");
        }
#ij endif
        IJ_printf(th_all, "\tjmpl %%r27+0, %%r27\n");
    }
    | uLONGH %ropr Ro_ldst_ptr
    {
        IJ_generate_from_token(1, th_all, ijdefault, uBR);
        IJ_printf(th_all, "br_longdelay5_%y_%d:\n", label); 
        IJ_set_rvar(Rv_offset,"10'b1r1rrrr000");
        IJ_printf(th_all, "#if (defined SPC || defined CMP1)\n" );
        IJ_printf(th_all, "!$EV trig_pc_d(1, expr((@VA(.MAIN.br_longdelay5_%y_%d)&0xffffffff) , 16, 16)) -> intp(mask2tid(0x%y),0,0,*,%rd,*,ffffffffffffffff,1)\n", label , Rv_offset);
        IJ_printf(th_all, "!$EV trig_pc_d(1, expr((@VA(.MAIN.br_longdelay5_%y_%d)) , 16, 16)) -> intp(mask2tid(0x%y),0,0,*,%rd,*,ffffffffffffffff,1)\n", label, Rv_offset);
        IJ_printf(th_all, "\twrhpr %%g0, 0x0, %%halt  ! HALT\n");
        IJ_printf(th_all, "#endif\n" );
        IJ_set_rvar(Rv_offset,"6'brrr000");
        label++ ;
    } 
;


%%
// }}}

%%section cbfunc

%%

#ijifdef TEMPLATE1
    TEMPLATE1 t1 (th_tt1);
#ijendif
#ijifdef TEMPLATE2
    TEMPLATE2 t2 (th_tt2);
#ijendif
endtemplate
