*&---------------------------------------------------------------------*
*& Report ZCM_TEST_82
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_82.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS : p_num_1 TYPE i,
               p_num_2 TYPE i.
SELECTION-SCREEN END OF BLOCK a1.

DATA : gv_result TYPE i.

START-OF-SELECTION.


  CALL FUNCTION 'ZCM_FM_01'
    EXPORTING
      iv_number_01 = p_num_1
      iv_number_02 = p_num_2
    IMPORTING
      ev_result    = gv_result.

  WRITE : gv_result.
