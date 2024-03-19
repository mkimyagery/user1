*&---------------------------------------------------------------------*
*& Report ZCM_TEST_84
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_84.


SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS : p_carrid TYPE spfli-carrid,
               p_connid TYPE spfli-connid,
               p_dtime  TYPE spfli-deptime,
               p_atime  TYPE spfli-arrtime.
SELECTION-SCREEN END OF BLOCK a1.

DATA : gs_spfli          TYPE spfli,
       gv_fltime         TYPE i,
       gv_fltime_changed TYPE boolean.

START-OF-SELECTION.

  SELECT SINGLE * FROM spfli INTO gs_spfli WHERE carrid = p_carrid AND connid = p_connid.

  IF gs_spfli IS NOT INITIAL.

    WRITE : gs_spfli-carrid  , gs_spfli-connid  , gs_spfli-countryfr,
            gs_spfli-cityfrom, gs_spfli-airpfrom, gs_spfli-countryto,
            gs_spfli-cityto  , gs_spfli-airpto  , gs_spfli-fltime,
            gs_spfli-deptime , gs_spfli-arrtime , gs_spfli-distance,
            gs_spfli-distid  , gs_spfli-fltype  , gs_spfli-period.

    CALL FUNCTION 'ZCM_FM_03'
      EXPORTING
        iv_dep_time       = p_dtime
        iv_arr_time       = p_atime
      IMPORTING
        ev_fltime         = gv_fltime
        ev_fltime_changed = gv_fltime_changed
      CHANGING
        cs_spfli          = gs_spfli.

    IF gv_fltime_changed IS NOT INITIAL.

      SKIP.
      WRITE : / TEXT-002, TEXT-003 , gv_fltime.
      SKIP.

      WRITE : gs_spfli-carrid  , gs_spfli-connid  , gs_spfli-countryfr,
              gs_spfli-cityfrom, gs_spfli-airpfrom, gs_spfli-countryto,
              gs_spfli-cityto  , gs_spfli-airpto  , gs_spfli-fltime,
              gs_spfli-deptime , gs_spfli-arrtime , gs_spfli-distance,
              gs_spfli-distid  , gs_spfli-fltype  , gs_spfli-period.

    ENDIF.
  ENDIF.
