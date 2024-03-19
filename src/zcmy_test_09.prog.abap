*&---------------------------------------------------------------------*
*& Report ZCM_TEST_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_09.

"Saat Kavramı
"HHMMSS

DATA: gv_time01 TYPE uzeit,
      gv_time02 TYPE uzeit,
      gv_time03 TYPE uzeit,
      gv_time04 TYPE uzeit,
      gv_time05 TYPE uzeit.

gv_time01 = '142200'.

gv_time02 = gv_time01 - 15 . "15 Saniye çıkarıyoruz.
gv_time03 = gv_time01 + 15 . "15 saniye ekliyoruz.

gv_time04 = '092300'.
gv_time05 = gv_time04 - gv_time01.

WRITE: 'gv_time01:' ,  gv_time01.
WRITE: /'gv_time02:' , gv_time02.
WRITE: /'gv_time03:' , gv_time03.
WRITE: /'gv_time04:' , gv_time04.
WRITE: /'gv_time05:' , gv_time05.

*write: 'gv_time01:' ,  gv_time01,
*      /'gv_time02:' , gv_time02.
