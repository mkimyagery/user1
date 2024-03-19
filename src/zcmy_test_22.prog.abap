*&---------------------------------------------------------------------*
*& Report ZCM_TEST_22
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_22.

"If endif komutu

*IF sy-subrc = 0. "Koşulu sağlıyorsa
*
*ENDIF.

*DATA : gv_integer TYPE i.
*
*gv_integer = 110.
*
*IF gv_integer < 100.
*  WRITE : 'Girilen sayi 100''den kücüktür.'.
*
*ELSEIF  gv_integer = 100.
*  WRITE : 'Girilen sayi 100''e eşittir.'.
*
*ELSEIF  gv_integer > 100.
*
*  WRITE : 'Girilen sayi 100''den büyüktür.'.
*
*ENDIF.

DATA : gv_number_01 TYPE n LENGTH 3,
       gv_number_02 TYPE n LENGTH 3.

gv_number_01 = 20.
gv_number_02 = 30.

*IF gv_number_01 = gv_number_02 .
*
*  WRITE : 'gv_number_01 sayisi gv_number_02 sayisina eşittir.'.
*
*ELSE.
*  WRITE : 'gv_number_01 sayisi gv_number_02 sayisina eşit değildir.'.
*
*ENDIF.

IF gv_number_01 = gv_number_02 .

  WRITE : 'gv_number_01 sayisi gv_number_02 sayisina eşittir.'.

ELSEIF gv_number_01 > gv_number_02.

  WRITE : 'gv_number_01 sayisi gv_number_02 sayisindan büyüktür.'.

ELSE.
  WRITE: 'gv_number_01 sayisi gv_number_02 sayisindan kücüktür.'.
ENDIF.
