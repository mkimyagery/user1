*&---------------------------------------------------------------------*
*& Report ZCM_TEST_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_12.

"Condense

DATA: gv_text_01 TYPE c LENGTH 50 ."VALUE '     Eurotech    Study    Eğitim   Merkezi.'.

gv_text_01 = '      Eurotech    Study    Eğitim   Merkezi.'.

WRITE: 'Condense komutu kullanmadan:' , gv_text_01.

SKIP 2.

CONDENSE gv_text_01.
WRITE: / 'Condense komutu kullanıldıktan sonra:' , gv_text_01.

SKIP 2.

CONDENSE gv_text_01 NO-GAPS.
WRITE: / 'Condense NO-GAPS komutu kullandıktan sonra:' , gv_text_01.
