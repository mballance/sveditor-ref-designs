
// My custom weight file template.
// Weights available are : wt_hig, wt_med, wt_low, wt_nul
//
inst:      trap_asr     %rvar wt_low
        |  trap_asi     %rvar wt_low
        |  tcc          %rvar wt_low
        | ldst_excp     %rvar wt_med
        | ldstasi_excp  %rvar wt_med
        | ldstasi_excp_z  %rvar wt_med
        | change_mode   %rvar wt_low
        | alu           %rvar wt_low
        | branches      %rvar wt_high
        | wrasi         %rvar wt_low
        | splash_fprs   %rvar wt_low
        | splash_pstate %rvar wt_med
        | splash_hpstate %rvar wt_med
        | splash_cwp    %rvar wt_nul
        | splash_gl     %rvar wt_low
        | splash_tt     %rvar wt_nul
        | stores        %rvar wt_high
        | sir           %rvar wt_low
        | splash_tick   %rvar wt_med
        | splash_cmpr   %rvar wt_med
        | splash_tba    %rvar wt_med
        | splash_htba   %rvar wt_low
        | splash_lsucnt %rvar wt_high
        //| splash_decr   %rvar wt_nul
        | demap         %rvar wt_high
        | tagged        %rvar wt_nul
        | intvec        %rvar wt_high
        | intveclr      %rvar wt_med
        | xir         %rvar wt_low   
        | mondo       %rvar wt_low
        | ibp         %rvar wt_low
        | iaw         %rvar wt_low
        | dvapa       %rvar wt_low
        | cmp         %rvar wt_high
        | donret      %rvar wt_med
        | pmu      %rvar wt_low
#ijifndef NO_SPU
        | cwq      %rvar wt_med
        | sma      %rvar wt_low 
#ijendif
        | memptr   %rvar wt_high
        | pwr      %rvar wt_nul
        | skip     %rvar wt_high
        | fpinit   %rvar wt_low
        | jmptr    %rvar wt_high
        //| invtsb   %rvar wt_low
        //| tglhtw   %rvar wt_nul
        | unsuptte %rvar wt_nul
        | blksts   %rvar wt_high
        //| vahole   %rvar wt_nul
        | brcommon %rvar wt_high
        //| cerer    %rvar wt_nul
        //| ceter    %rvar wt_nul
        | ticken   %rvar wt_nul
        | frzjmp   %rvar wt_med
        | cancelint %rvar wt_med
;

#ijifdef TH_STRESS
stress :  uLONG %ropr Ro_ldst_ptr | uBLK14 %ropr Ro_blksts | memptr_st
;

stress2 : intvec_st | uDBG3 %ropr Ro_ldst_ptr | uBLK14 %ropr Ro_blksts | loopz
;

memptr_st: tWRCCR_I
    {
    IJ_printf(th_stress, "memptr_%y_%d:\n", label);
    if (label%3 == 0) { //
        IJ_printf(th_stress, "\tset user_data_start, %%r31\n", Rv_memptr);
    } else {
        IJ_printf(th_stress, "\tset 0x%rx, %%r31\n", Rv_memptr);
    }
    label++;
    }
;
intvec_st: uDIFFD
    {
        if (label%2) {
            IJ_printf(th_stress, "\tnop\n\tnop\n\trd %%tick, %%r28\n");
            IJ_printf(th_stress, "#if (defined PORTABLE_CORE || MAX_THREADS == 8)\n");
            IJ_printf(th_stress, "\tsethi %%hi(0x3800), %%r27\n\tandn %%r28, %%r27, %%r28\n");
            IJ_printf(th_stress, "#ifdef PORTABLE_CORE\n\t! Add CID to vector\n");
            IJ_printf(th_stress, "\tta T_CHANGE_HPRIV\n");
            IJ_printf(th_stress, "\tldxa [%%g0]0x63, %%r27\n\tsllx %%r27, 8, %%r27\n");
            IJ_printf(th_stress, "\tor %%r27, %%r28, %%r28 \n#endif\n");
            if(IJ_random()&0x1)
            IJ_printf(th_stress, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
            IJ_printf(th_stress, "#endif\n");
            IJ_printf(th_stress, "\tsethi %%hi(0x30000), %%r27\n");
            IJ_printf(th_stress, "\tandn %%r28, %%r27, %%r28\n");
            if(label&0x1) {
                IJ_printf(th_stress, "\tta T_CHANGE_HPRIV\n");
            }
            IJ_printf(th_stress, "\tstxa %%r28, [%%g0] 0x73\n");
        } else {
            IJ_printf(th_stress, "\tnop\n\tnop\n\tset 0x%x, %%r28\n", IJ_get_rvar_val32(Rv_intdisvec));
            IJ_printf(th_stress, "#if (defined PORTABLE_CORE || MAX_THREADS == 8)\n");
            IJ_printf(th_stress, "\tsethi %%hi(0x3800), %%r27\n\tandn %%r28, %%r27, %%r28\n");
            IJ_printf(th_stress, "#ifdef PORTABLE_CORE\n\t! Add CID to vector\n");
            IJ_printf(th_stress, "\tta T_CHANGE_HPRIV\n");
            IJ_printf(th_stress, "\tldxa [%%g0]0x63, %%r27\n\tsllx %%r27, 8, %%r27\n");
            IJ_printf(th_stress, "\tor %%r27, %%r28, %%r28 \n#endif\n");
            if(IJ_random()&0x1)
            IJ_printf(th_stress, "\twrhpr %%g0, 0x%rx, %%hpstate  ! ta T_CHANGE_NONHPRIV\n",Rv_wrhp_nonhp);
            IJ_printf(th_stress, "#endif\n" );

            IJ_printf(th_stress, "\tstxa %%r28, [%%g0] 0x73\n");
        }
        if(random()&0x1) {
            IJ_generate_from_token(1, th_stress, ijdefault, uDIFFD);
        }
        IJ_printf(th_stress, "intvec_st_%y_%d:\n", label);
        label++;
    }
;
#ijendif
