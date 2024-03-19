*&---------------------------------------------------------------------*
*& Report ZCM_TEST_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_08.

"Tarih tipinde veri tutuyor.

"yyyymmdd

DATA : gv_date_01 TYPE datum.
DATA : gv_date_02 TYPE datum.
DATA : gv_date_03 TYPE sy-datum.
*DATA : gv_date_04 TYPE sy-datum.

gv_date_01 = '20220210'.

gv_date_02 = gv_date_01 - 20.
gv_date_03 = gv_date_01 + 20.

WRITE :  'gv_date_01:' , gv_date_01.
WRITE : /'gv_date_02:' , gv_Date_02.
WRITE : /'gv_date_03:' , gv_Date_03.
