*&---------------------------------------------------------------------*
*& Report ZCM_TEST_132
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_132.


SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS : p_num_01 TYPE i,
               p_num_02 TYPE i,
               p_sembol TYPE c LENGTH 1.
SELECTION-SCREEN END OF BLOCK a1.

DATA : go_calculator TYPE REF TO zcalculator_cm3,
       gv_sonuc      TYPE i.

CREATE OBJECT go_calculator.

go_calculator->hesapla(
  EXPORTING
    iv_sembol           = p_sembol
    iv_num_01           = p_num_01
    iv_num_02           = p_num_02
  IMPORTING
    ev_sonuc            = gv_sonuc
  EXCEPTIONS
    gecersiz_islem_kodu = 1
    OTHERS              = 2 ).

IF sy-subrc = 1.
  MESSAGE TEXT-002 TYPE 'S' DISPLAY LIKE 'E'.
  EXIT.
ENDIF.

WRITE : gv_sonuc.
