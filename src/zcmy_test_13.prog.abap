*&---------------------------------------------------------------------*
*& Report ZCM_TEST_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_13.
"Replace

DATA : gv_text_01 TYPE c LENGTH 50 VALUE '11112222333344445555'.

WRITE : gv_text_01.

REPLACE ALL OCCURRENCES OF '3' IN gv_text_01 WITH 'W'.
SKIP 2.
WRITE : / gv_text_01.

REPLACE FIRST OCCURRENCE OF 'WW' IN gv_text_01 WITH 'ZZ'.
SKIP 2.
WRITE : / gv_text_01.

REPLACE ALL OCCURRENCES OF 'w' IN gv_text_01 WITH 'R' RESPECTING CASE."Büyük küçük hassasiyetinden kaynaklı
SKIP 2.
WRITE : / gv_text_01.

REPLACE ALL OCCURRENCES OF 'w' IN gv_text_01 WITH 'R' IGNORING CASE.
SKIP 2.
WRITE : / gv_text_01.
