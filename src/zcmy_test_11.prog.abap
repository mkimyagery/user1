*&---------------------------------------------------------------------*
*& Report ZCM_TEST_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_11.
"Concatenate

DATA : gv_mahalle TYPE string,
       gv_cadde   TYPE string,
       gv_no      TYPE string,
       gv_pk      TYPE string,
       gv_ilce    TYPE string,
       gv_il      TYPE string,
       gv_adres   TYPE string.

gv_mahalle = 'Mimar Sinan Paşa Mahallesi'.
gv_cadde   = 'Cumhuriyet Caddesi'.
gv_no      = '17/1'.
gv_pk      = '34078'.
gv_ilce    = 'Üsküdar'.
gv_il      = 'İstanbul'.

CONCATENATE gv_mahalle ',' gv_cadde ',' gv_no ',' gv_pk ',' gv_ilce ',' gv_il '.'
       INTO gv_adres RESPECTING BLANKS.

*CONCATENATE gv_mahalle ',' gv_cadde ',' gv_no ',' gv_pk ',' gv_ilce ',' gv_il '.'
*       INTO gv_adres.

WRITE: 'Adres:' , gv_adres.
