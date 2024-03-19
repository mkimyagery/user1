*&---------------------------------------------------------------------*
*& Report ZCM_TEST_73
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_73.
"Select-Options

DATA : gs_scarr   TYPE scarr,
       gt_table   TYPE TABLE OF scarr,
       gv_carr_id TYPE s_carr_id.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS : so_carr FOR gv_carr_id.
*  SELECT-OPTIONS : so_carr FOR gs_scarr-carrid.
*  PARAMETERS     : p_carr TYPE s_carr_id.

SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  SELECT * FROM scarr INTO TABLE gt_table WHERE carrid IN so_carr.
*  SELECT * FROM scarr INTO TABLE gt_table WHERE carrid EQ p_carr.

  SORT gt_table BY carrid ."DESCENDING.

  LOOP AT gt_table INTO gs_scarr.

    WRITE : gs_scarr-carrid,gs_scarr-carrname,gs_scarr-currcode,gs_scarr-url .
    CLEAR : gs_scarr.
    ULINE.
    SKIP.

  ENDLOOP.
