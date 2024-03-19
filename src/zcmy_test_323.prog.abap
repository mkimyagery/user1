*&---------------------------------------------------------------------*
*& Report ZCM_TEST_323
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_323.
"New

*PARAMETERS : p_i_bas TYPE sy-datum  OBLIGATORY,
*             p_i_bit TYPE sy-datum  OBLIGATORY,
*             p_id    TYPE zcm_de_id OBLIGATORY.

DATA : go_yillik_izin TYPE REF TO zcmtest_yillik_izin_class_tst.
*       gv_calisan_mevcut type c LENGT

START-OF-SELECTION.

  CREATE OBJECT go_yillik_izin.

  "7.40 ile birlikte
  DATA(go_yillik_izin2) = NEW zcmtest_yillik_izin_class_tst( ).

  BREAK-POINT.
