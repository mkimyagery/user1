*&---------------------------------------------------------------------*
*& Report ZCM_TEST_17
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_17.
"Split

DATA : gv_text_01 TYPE string,
       gv_word_01 TYPE string,
       gv_word_02 TYPE string,
       gv_word_03 TYPE string,
       gv_word_04 TYPE string,
       gv_word_05 TYPE string.

DATA : gv_name    TYPE string,
       gv_part_01 TYPE string,
       gv_part_02 TYPE string,
       gv_part_03 TYPE string.

gv_text_01 = 'Bugün hava ne kadar günesli.'.
gv_name    = 'Baris Manco'.

SPLIT gv_text_01 AT space INTO gv_word_01
                               gv_word_02
                               gv_word_03
                               gv_word_04
                               gv_word_05.

WRITE :   gv_word_01,
        / gv_word_02,
        / gv_word_03,
        / gv_word_04,
        / gv_word_05.

SKIP.
ULINE.

SPLIT gv_name AT 'a' INTO gv_part_01 gv_part_02 gv_part_03.

WRITE: / gv_part_01,
       / gv_part_02,
       / gv_part_03.
