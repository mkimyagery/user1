*&---------------------------------------------------------------------*
*& Report ZCM_TEST_76
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_76.
"Perform

SELECTION-SCREEN BEGIN OF BLOCK alp WITH FRAME TITLE TEXT-001.
  PARAMETERS : p_num_01 TYPE i,
               p_num_02 TYPE i.
SELECTION-SCREEN END OF BLOCK alp.

DATA : gv_result TYPE i.

START-OF-SELECTION.

  PERFORM sum.
  ULINE.
  WRITE : gv_result.
  ULINE.
*&---------------------------------------------------------------------*
*& Form sum
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM sum .
  DATA : lv_result TYPE i.
*  gv_result = p_num_01 + p_num_02.
  lv_result = p_num_01 + p_num_02.
  WRITE : lv_result.
ENDFORM.
