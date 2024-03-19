*&---------------------------------------------------------------------*
*& Report ZCM_TEST_27
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_27.
"While-Endwhile

PARAMETERS : p_num TYPE i.

DATA : gv_counter TYPE n LENGTH 3,
       gv_msg     TYPE string.

IF p_num >= 500.
  MESSAGE TEXT-001 TYPE 'S' DISPLAY LIKE 'E'.
  EXIT.
ENDIF.

WHILE p_num < 500.
  p_num = p_num + 10.
  gv_counter = gv_counter + 1.
ENDWHILE.

CONCATENATE TEXT-002 gv_counter TEXT-003 INTO gv_msg SEPARATED BY space.

MESSAGE gv_msg TYPE 'I'.
