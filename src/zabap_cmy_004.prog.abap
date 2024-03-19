*&---------------------------------------------------------------------*
*& Report ZABAP_CM_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_004.

DATA: gv_num1 TYPE n LENGTH 2,
      gv_num2 TYPE n LENGTH 2.

gv_num1 = 50.

IF gv_num1 > 50.
  gv_num2 = gv_num1 + 10.

  WRITE: 'gv_num2' , gv_num2.
  MESSAGE: TEXT-002 TYPE 'I'.

ELSE.

  MESSAGE: TEXT-001 TYPE 'I'.

ENDIF.
