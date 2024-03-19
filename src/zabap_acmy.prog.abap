*&---------------------------------------------------------------------*
*& Report ZABAP_AC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_acmy.


TYPES : BEGIN OF ty_sflight2 ,
          seatsmax_b TYPE sflight-seatsmax_b,
          seatsocc_b TYPE sflight-seatsocc_b,
          seatsmax_f TYPE sflight-seatsmax_f,
          seatsocc_f TYPE sflight-seatsocc_f,
        END OF ty_sflight2.


TYPES: BEGIN OF ty_join ,
         carrid   TYPE sflight-carrid,
         price    TYPE sflight-price,
         currency TYPE sflight-currency,
         carrname TYPE scarr-carrname,
         url      TYPE scarr-url,
       END OF ty_join.


TYPES: BEGIN OF ty_sf_for ,
         carrid   TYPE sflight-carrid,
         price    TYPE sflight-price,
         currency TYPE sflight-currency,
       END OF   ty_sf_for.

TYPES: BEGIN OF ty_sc_for ,
         carrid   TYPE sflight-carrid,
         carrname TYPE scarr-carrname,
         url      TYPE scarr-url,
       END OF ty_sc_for.

DATA : lt_sflight2 TYPE TABLE OF ty_sflight2,
       lt_join     TYPE TABLE OF ty_join,
       lt_sf_for   TYPE TABLE OF ty_sf_for,
       lt_sc_for   TYPE TABLE OF ty_sc_for.

TYPES: BEGIN OF ty_mara ,
         matnr  TYPE mara-matnr,
         miktar TYPE i,
       END OF ty_mara.

TYPES: BEGIN OF ty_mara2 ,
         matnr  TYPE mara-matnr,
         miktar TYPE i,
       END OF ty_mara2.

DATA : lt_mara TYPE TABLE OF ty_mara,
       ls_mara TYPE ty_mara.

DATA : lt_mara2 TYPE TABLE OF ty_mara,
       ls_mara2 TYPE ty_mara.

TYPES : BEGIN OF ty_user,
          adi    TYPE char20,
          soyadi TYPE char20,
          sinif  TYPE i,
        END OF ty_user.

DATA : lt_user  TYPE TABLE OF ty_user,
       ls_user  TYPE ty_user,
       lv_deger TYPE i.
