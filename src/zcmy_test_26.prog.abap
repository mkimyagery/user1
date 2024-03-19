*&---------------------------------------------------------------------*
*& Report ZCM_TEST_26
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_26.
"Do-Enddo

*DATA : gv_integer TYPE i.
*
*DO 20 TIMES.
*  gv_integer = gv_integer + 1.
*ENDDO.
*
**DO.
**  gv_integer = gv_integer + 2.
**  IF gv_integer = 20.
**    EXIT.
**  ENDIF.
**ENDDO.
*
*WRITE : gv_integer.

PARAMETERS : p_date1 TYPE datum,
             p_date2 TYPE datum.

DATA : gv_counter TYPE n LENGTH 3.

IF p_date1 >= p_date2.
  MESSAGE 'İlk girilen tarih ikinci girilen tarihten kucuk olmalıdır' TYPE 'S' DISPLAY LIKE 'E'.
  EXIT.
ENDIF.

DO.
  p_date1 = p_date1 + 1.

  gv_counter = gv_counter + 1.

  IF p_date1 = p_date2.
    EXIT.
  ENDIF.
ENDDO.

WRITE: 'Girilen iki tarih arasında', gv_counter,'gün bulunmaktadır.'.
