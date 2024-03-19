*&---------------------------------------------------------------------*
*& Report ZCM_TEST_16
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_16.
"Strlen

DATA : gv_text_01 TYPE string,
       gv_int     TYPE i.

gv_text_01 = 'Bugün alisveris yapmam gerekiyor.'.

gv_int = strlen( gv_text_01 ).

WRITE : 'Text icerisinde ', gv_int, 'tane harf bulunuyor.'.
