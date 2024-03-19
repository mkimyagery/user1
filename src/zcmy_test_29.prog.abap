*&---------------------------------------------------------------------*
*& Report ZCM_TEST_29
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_29.

*PARAMETERS : p_msg TYPE string.

*MESSAGE p_msg TYPE 'S'.
*MESSAGE p_msg TYPE 'I'.
*MESSAGE p_msg TYPE 'E'.


**********************************************************************
"sayfa 50 alıştırma 4-5-6-7
**********************************************************************
"Alıştırma 4

*PARAMETERS : p_value1 TYPE i, "Büyük sayıya karşılık gelen değişken 100
*             p_value2 TYPE i. "Küçük sayıya karşılık gelen değişken 7
*
*DATA : gv_count TYPE i.

**IF p_value1 > p_value2.
*DO.
*
*  p_value2 = p_value2 + 1.
*  gv_count = gv_count + 1.
*
*  IF p_value1 = p_value2.
*    EXIT.
*  ENDIF.
*ENDDO.

**ELSE.
**  DO.
**
**    p_value1 = p_value1 + 1.
**    gv_count = gv_count + 1.
**
**    IF p_value1 = p_value2.
**      EXIT.
**    ENDIF.
**  ENDDO.
**
**ENDIF.
*WRITE : 'Girilen iki sayı arasında', gv_count, 'kadar fark bulunmaktadır.'.

**********************************************************************
"Alıştırma 5
*PARAMETERS : p_value1 TYPE i,
*             p_value2 TYPE i.
*
*DATA : gv_count TYPE i.
*
*WHILE p_value1 NE p_value2.
*  p_value2 = p_value2 + 1.
*  gv_count = gv_count + 1.
*ENDWHILE.
*
*WRITE : 'Girilen iki sayı arasında', gv_count, 'fark bulunmaktadır.'.

**********************************************************************
"Alıştırma 6

*PARAMETERS : p_color TYPE string.
*DATA : gv_color TYPE c LENGTH 10,
*       gv_msg   TYPE string.
*
*CASE p_color.
*  WHEN 'KIRMIZI'.
*    gv_color = 'RED'.
*  WHEN 'BEYAZ'.
*    gv_color = 'WHITE'.
*  WHEN 'SIYAH'.
*    gv_color = 'BLACK'.
*  WHEN 'SARI'.
*    gv_color = 'YELLOW'.
*  WHEN OTHERS.
*    MESSAGE 'Ekrandan girilen rengin karşılığı bulunamamıştır.' TYPE 'S' DISPLAY LIKE 'E'.
*ENDCASE.
*
*IF gv_color IS NOT INITIAL.
*
*  CONCATENATE TEXT-001 gv_color INTO gv_msg SEPARATED BY space.
*  MESSAGE gv_msg TYPE 'I'.
*
*ENDIF.

**********************************************************************
"Alıştırma 7
*
*PARAMETERS : p_dgr1  TYPE i,
*             p_dgr2  TYPE i,
*             p_islem TYPE c LENGTH 1.
*
*DATA : gv_sonuc        TYPE i,
*       gv_sonuc_string TYPE string,
*       gv_msg          TYPE string.
*
*CASE p_islem.
*  WHEN '*'.
*    gv_sonuc = p_dgr1 * p_dgr2.
*  WHEN '/'.
*    gv_sonuc = p_dgr1 / p_dgr2.
*  WHEN '+'.
*    gv_sonuc = p_dgr1 + p_dgr2.
*  WHEN '-'.
*    gv_sonuc = p_dgr1 - p_dgr2.
*  WHEN OTHERS.
*    MESSAGE 'Girilen islem tipi gecersizdir.' TYPE 'I'.
*ENDCASE.
*
*IF gv_sonuc IS NOT INITIAL.
*  gv_sonuc_string = gv_sonuc.
*  CONCATENATE TEXT-002 gv_sonuc_string INTO gv_msg SEPARATED BY space.
*  MESSAGE gv_msg TYPE 'S'.
*ENDIF.
