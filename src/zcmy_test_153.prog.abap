*&---------------------------------------------------------------------*
*& Report ZCM_TEST_153
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_153.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS : p_carrid TYPE s_carr_id.
SELECTION-SCREEN END OF BLOCK a1.

DATA : gs_structure TYPE zcm_s_deepstr_04.

START-OF-SELECTION.


  SELECT SINGLE * FROM scarr
    INTO CORRESPONDING FIELDS OF gs_structure
   WHERE carrid = p_carrid.

  SELECT * FROM spfli
    INTO TABLE gs_structure-table_spfli
    WHERE carrid = p_carrid.

  BREAK-POINT.
