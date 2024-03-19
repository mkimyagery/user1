*&---------------------------------------------------------------------*
*& Report ZCM_TEST_30
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_30.
"Debug Ekranı

PARAMETERS : p_num_1 TYPE i,
             p_num_2 TYPE i,
             p_trnsc TYPE c LENGTH 1.

DATA : gv_result        TYPE p DECIMALS 2,
       gv_result_string TYPE string,
       gv_msg           TYPE string.

*BREAK-POINT.
IF p_trnsc = '+'.
  gv_result = p_num_1 + p_num_2.
ELSEIF p_trnsc = '*'.
  gv_result = p_num_1 * p_num_2.
ELSEIF  p_trnsc = '/'.
  gv_result = p_num_1 / p_num_2.
ELSEIF p_trnsc = '-'.
  gv_result = p_num_1 - p_num_2.
ELSE.
  MESSAGE TEXT-001 TYPE 'S' DISPLAY LIKE 'E'.
  EXIT.
ENDIF.

*BREAK user1."Program içerisinde çalıştırılınca sadece user1 debuga düşer.
*BREAK-POINT."Bu programı çalıştıran herkes debuga düşer.

gv_result_string = gv_result.

CONCATENATE TEXT-002 gv_result_string INTO gv_msg SEPARATED BY space.
MESSAGE gv_msg TYPE 'S'.
