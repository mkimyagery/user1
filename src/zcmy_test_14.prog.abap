*&---------------------------------------------------------------------*
*& Report ZCM_TEST_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_14.

"Search komutu.

DATA : gv_text TYPE c LENGTH 50.

gv_text = 'Istanbul Izmir Antalya'.

SEARCH gv_text FOR 'ant'.

WRITE: sy-subrc , 'Sonuc olumlu'.

SEARCH gv_text FOR 'itl'.

WRITE: / sy-subrc , 'Sonuc Olumsuz'.

SEARCH gv_text FOR 'itl' ABBREVIATED.

WRITE: / sy-subrc, 'Sonuc Olumlu'.

SEARCH gv_text FOR 'izm' STARTING AT 9.

WRITE: / sy-subrc, 'Sonuc olumlu'.

SEARCH gv_text FOR 'mir' ENDING AT 3.

WRITE: / sy-subrc , 'Sonuc Olumsuz'.

SEARCH gv_text FOR 'ist' AND MARK.
WRITE: / sy-subrc, 'Sonuc olumlu'.

SKIP.

WRITE: / gv_text.
