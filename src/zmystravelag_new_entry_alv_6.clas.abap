class ZMYSTRAVELAG_NEW_ENTRY_ALV_6 definition
  public
  final
  create public .

public section.

  data GS_ZCM_STRAVELAG type ZCM_STRAVELAG .
  data GT_ZCM_STRAVELAG type ZCM_TT_STRAVELAG .
  data GT_FCAT type SLIS_T_FIELDCAT_ALV .
  data GS_LAYOUT type SLIS_LAYOUT_ALV .

  methods NEW_ENTRY
    importing
      !IV_AGENCYNUM type S_AGNCYNUM
      !IV_NAME type S_AGNCYNAM
      !IV_STREET type S_STREET
      !IV_POSTBOX type S_POSTBOX
      !IV_POSTCODE type POSTCODE
      !IV_CITY type CITY
      !IV_COUNTRY type S_COUNTRY
      !IV_REGION type S_REGION
      !IV_TELEPHONE type S_PHONENO
      !IV_CURRENCY type S_CURR_AG .
  methods PREP_FCAT
    exceptions
      NO_FCAT .
  methods PREP_LAYOUT
    importing
      !IV_ZEBRA type CHAR1 optional
      !IV_COLWIDTH_OPTIMIZE type CHAR1 optional .
  methods PREP_DATA .
  methods SHOW_DATA .
protected section.

  methods MAKE_URL
    importing
      !IV_NAME type S_AGNCYNAM
    returning
      value(RV_URL) type S_URL .
private section.
ENDCLASS.



CLASS ZMYSTRAVELAG_NEW_ENTRY_ALV_6 IMPLEMENTATION.


  METHOD MAKE_URL.

    DATA : lv_name   TYPE s_agncynam,
           lv_name_2 TYPE s_agncynam,
           lc_http   TYPE c LENGTH 11 VALUE 'http://www.',
           lc_com    TYPE c LENGTH 4  VALUE '.com'.

    lv_name = iv_name. "Cünkü iv_name bir import parametresidir,
    "ve import parametrelerinde degisiklik yapilamaz

    TRANSLATE lv_name TO LOWER CASE.

    DO.
      SPLIT lv_name AT space INTO lv_name lv_name_2.

      IF lv_name_2 IS INITIAL.
        EXIT.
      ENDIF.

      CONCATENATE lv_name lv_name_2 INTO lv_name SEPARATED BY '-'.
    ENDDO.

    CONCATENATE lc_http lv_name lc_com INTO rv_url.

  ENDMETHOD.


  METHOD NEW_ENTRY.

    DATA: ls_stravelag TYPE zcm_stravelag.

    ls_stravelag-agencynum = iv_agencynum.
    ls_stravelag-name      = iv_name.
    ls_stravelag-street    = iv_street.
    ls_stravelag-postbox   = iv_postbox.
    ls_stravelag-postcode  = iv_postcode.
    ls_stravelag-city      = iv_city.
    ls_stravelag-country   = iv_country.
    ls_stravelag-region    = iv_region.
    ls_stravelag-telephone = iv_telephone.
    ls_stravelag-currency  = iv_currency.

*    make_url(
*    EXPORTING iv_name = iv_name "new entry de ki import parametresi de iv_name make url methodunda ki import parametresi de iv_name
*    RECEIVING rv_url  = ls_stravelag-url  ).

    CALL METHOD me->make_url
      EXPORTING
        iv_name = iv_name
      RECEIVING
        rv_url  = ls_stravelag-url.

*    ls_stravelag-url = make_url( iv_name = iv_name ).

    ls_stravelag-langu    = sy-langu.
    ls_stravelag-currency = iv_currency.

    INSERT zcm_stravelag FROM ls_stravelag.

  ENDMETHOD.


  METHOD PREP_DATA.
    SELECT * FROM zcm_stravelag INTO CORRESPONDING FIELDS OF TABLE gt_zcm_stravelag.
  ENDMETHOD.


  METHOD PREP_FCAT.

    CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZCM_STRAVELAG'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.

    IF sy-subrc IS NOT INITIAL.
      RAISE no_fcat.
    ENDIF.

    DATA : gs_fcat LIKE LINE OF gt_fcat.

  ENDMETHOD.


  METHOD PREP_LAYOUT.

    gs_layout-zebra             = iv_zebra.
    gs_layout-colwidth_optimize = iv_colwidth_optimize.
    gs_layout-box_fieldname     = 'BOX'.

  ENDMETHOD.


  METHOD SHOW_DATA.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid "'ZCM_TEST_133'
        is_layout          = gs_layout
        it_fieldcat        = gt_fcat
      TABLES
        t_outtab           = gt_zcm_stravelag
      EXCEPTIONS
        program_error      = 1
        OTHERS             = 2.

    IF sy-subrc IS NOT INITIAL.
      MESSAGE TEXT-003 TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.


  ENDMETHOD.
ENDCLASS.
