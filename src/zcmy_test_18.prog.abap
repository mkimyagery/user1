*&---------------------------------------------------------------------*
*& Report ZCM_TEST_18
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_18.

"Translate

DATA : gv_text_01 TYPE string,
       gv_text_02 TYPE string,
       gv_text_03 TYPE string,
       gv_text_04 TYPE string.

gv_text_01 = 'sap yazilim dili abap ögreniyorum'.
gv_text_02 = 'SAP YAZILIM DILI ABAP OGRENIYORUM'.
gv_text_03 = 'SAP YAZILIM diLI abap ögreniyorum'.
gv_text_04 = 'sap yazilim DIli ABAP OGRENIYORUM'.

TRANSLATE gv_text_01 TO UPPER CASE. "Büyük harfe çeviricez
WRITE: gv_text_01.
SKIP.

TRANSLATE gv_text_02 TO LOWER CASE. "küçük harfe çeviricez
WRITE: gv_text_02.
SKIP.

TRANSLATE gv_text_03 TO UPPER CASE.
WRITE: gv_text_03.
SKIP.

TRANSLATE gv_text_04 TO LOWER CASE.
WRITE: gv_text_04.
SKIP.
