*&---------------------------------------------------------------------*
*& Report ZCM_TEST_25
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_25.

PARAMETERS : p_number TYPE n LENGTH 3.
*DATA: gv_text TYPE string.
IF p_number < 100.
  MESSAGE TEXT-001 TYPE 'I'.
ELSEIF p_number = 100.
  MESSAGE TEXT-002 TYPE 'I'.
ELSEIF p_number > 100.
  MESSAGE TEXT-003 TYPE 'I'.
ENDIF.

*gv_text = TEXT-001.
