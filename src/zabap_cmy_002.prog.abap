*&---------------------------------------------------------------------*
*& Report ZABAP_CM_002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_002.


*PARAMETERS : p_text   TYPE c LENGTH 20,
*             p_numc   TYPE n LENGTH 6,
*             p_intgr  TYPE i,
*             p_dec    TYPE p DECIMALS 4,
*             p_string TYPE string,
*             p_date   TYPE d,
*             p_time   TYPE t.
*
*
*WRITE :  p_text   ,
*       / p_numc   ,
*       / p_intgr  ,
*       / p_dec    ,
*       / p_string ,
*       / p_date   ,
*       / p_time   .

*
*PARAMETERS : p_rdb_01 RADIOBUTTON GROUP abc,
*             p_rdb_02 RADIOBUTTON GROUP abc,
*             p_rdb_03 RADIOBUTTON GROUP abc,
*             p_rdb_04 RADIOBUTTON GROUP xyz,
*             p_rdb_05 RADIOBUTTON GROUP xyz,
*             p_rdb_06 RADIOBUTTON GROUP xyz,
*             p_cbx_01 AS CHECKBOX,
*             p_cbx_02 AS CHECKBOX,
*             p_cbx_03 AS CHECKBOX.

*DATA: lt_sflight TYPE TABLE OF sflight,
*      ls_sflight TYPE sflight.

*TYPES: BEGIN OF ty_table,
*         carrid   TYPE sflight-carrid,
*         price    TYPE sflight-price,
*         currency TYPE sflight-currency,
*         carrname TYPE scarr-carrname,
*         url      TYPE scarr-url,
*       END OF ty_table.
*
*DATA : ls_table TYPE ty_table,
*       gs_table TYPE ty_table,
*       lt_table TYPE TABLE OF ty_table,
*       gt_table TYPE TABLE OF ty_table.
*
*DATA : lt_sflight TYPE TABLE OF sflight,
*       ls_sflight TYPE sflight.
*
*DATA : lv_fldate   TYPE s_date, "sflight-fldate,
*       lv_price    TYPE sflight-price,
*       lv_currency TYPE sflight-currency.
*
*SELECT SINGLE * FROM sflight INTO ls_sflight
*        WHERE carrid EQ 'AA'
*          AND connid EQ '64'
*          AND fldate EQ '20190308'.                         "20190308
*
**WRITE : / 'Kapasite doluluk oranı:' , ls_sflight-seatsocc,
**        / 'Uçuş Tarihi:' ,  ls_sflight-fldate.
*
*SELECT SINGLE fldate price currency FROM sflight
*         INTO ( lv_fldate,lv_price,lv_currency )
*        WHERE carrid EQ 'AA'
*          AND connid EQ '64'
*          AND fldate EQ '20190308'.

*TYPES : BEGIN OF ty_sf_for,
*          carrid   TYPE sflight-carrid,
*          price    TYPE sflight-price,
*          currency TYPE sflight-currency,
*        END OF ty_sf_for.
*
*TYPES : BEGIN OF ty_sc_for,
*          carrid   TYPE sflight-carrid,
*          carrname TYPE scarr-carrname,
*          url      TYPE scarr-url,
*        END OF ty_sc_for.
*
*
*DATA : lt_sf_for TYPE TABLE OF ty_sf_for,
*       lt_sc_for TYPE TABLE OF ty_sc_for.
*
*
*SELECT carrid price currency FROM sflight
*  INTO CORRESPONDING FIELDS OF TABLE lt_sf_for
* WHERE carrid IN ( 'AA','AZ' ).
** WHERE carrid EQ 'AA' OR carrid EQ 'AZ'.
*
*IF lt_sf_for IS NOT INITIAL.
*
*  SELECT carrid carrname url FROM scarr
*    INTO CORRESPONDING FIELDS OF TABLE lt_sc_for
*    FOR ALL ENTRIES IN lt_sf_for
*    WHERE carrid EQ lt_sf_for-carrid.
*
*ENDIF.
*
*BREAK-POINT.
