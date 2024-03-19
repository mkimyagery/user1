*&---------------------------------------------------------------------*
*& Report ZCM_TEST_85
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_85.

DATA : gv_num_01 TYPE i VALUE 10,
       gv_num_02 TYPE i VALUE 2, "0
       gv_result TYPE i.

START-OF-SELECTION.

  CALL FUNCTION 'ZCM_FM_04'
    EXPORTING
      iv_number_01  = gv_num_01
      iv_number_02  = gv_num_02
    IMPORTING
      ev_result     = gv_result
    EXCEPTIONS
      zero_division = 1  "sy-subrc
      OTHERS        = 2. "sy-subrc

  IF sy-subrc = 1.
    MESSAGE TEXT-001 TYPE 'S' DISPLAY LIKE 'E'.
  ELSE.
    WRITE : gv_result.
  ENDIF.
