*&---------------------------------------------------------------------*
*& Report ZCM_TEST_58
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_58.
"Delete

DATA : gs_structure TYPE zcm_table_001,
       gt_table     TYPE TABLE OF zcm_table_001.

START-OF-SELECTION.

  DELETE FROM zcm_table_001 WHERE id = '20240005'.

  SELECT SINGLE * FROM zcm_table_001 INTO gs_structure WHERE id = '20240005'.
  WRITE : sy-subrc.
