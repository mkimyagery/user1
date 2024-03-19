*&---------------------------------------------------------------------*
*& Report ZCM_TEST_321
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_321.

"7.40 öncesi
DATA : gv_text TYPE string.

CONCATENATE 'Text 001' 'Text 002' INTO gv_text SEPARATED BY space.

"7.40 sonrasında

*DATA(gv_text_new) = |Text 001| & | | & |Text 002|.

DATA(text1) = 'Text 001'.
DATA(text2) = 'Text 002'.

DATA(gv_text_new) = |{ text1 }| & |-| & |{ text2 }|.
*DATA(gv_text_new) = |{ text1 }| & |{ text2 }|.


DATA(result) = |Hello { sy-uname }!|.

DATA(result1) = |Hello World!|.

DATA(result2) = |Hello| & | | & |World| & |!|.



BREAK-POINT.
