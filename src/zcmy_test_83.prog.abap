*&---------------------------------------------------------------------*
*& Report ZCM_TEST_83
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_83.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS : p_text1 TYPE c LENGTH 40 LOWER CASE,
               p_text2 TYPE c LENGTH 40 LOWER CASE,
               p_ucase AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK a1.

DATA : gv_text TYPE c LENGTH 80.

CALL FUNCTION 'ZCM_FM_02'
  EXPORTING
    iv_text_01   = p_text1
    iv_text_02   = p_text2
    iv_uppercase = p_ucase
  IMPORTING
    ev_text      = gv_text.

WRITE : gv_text.
