*&---------------------------------------------------------------------*
*& Report ZCM_TEST_15
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_15.
"Shift

DATA : gv_text_01 TYPE c LENGTH 10,
       gv_text_02 TYPE c LENGTH 10,
       gv_text_03 TYPE c LENGTH 12,
       gv_text_04 TYPE c LENGTH 12.

gv_text_01 = '0123456789'.
gv_text_02 = '0123456789'.
gv_text_03 = '123456000000'.
gv_text_04 = '000000123456'.

SHIFT gv_text_01 RIGHT UP TO '34'.
WRITE: gv_text_01.
SKIP.

SHIFT gv_text_02 LEFT UP TO '45'.
WRITE: gv_text_02.
SKIP.

SHIFT gv_text_03 RIGHT DELETING TRAILING '0'.
WRITE: gv_text_03.
SKIP.

SHIFT gv_text_04 LEFT DELETING LEADING '0'.
WRITE: gv_text_04.
SKIP.
