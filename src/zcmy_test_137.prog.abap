*&---------------------------------------------------------------------*
*& Report ZCM_TEST_137
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_137.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS: p_ag_num TYPE s_agncynum,
              p_name   TYPE s_agncynam,
              p_street TYPE s_street,
              p_pbox   TYPE s_postbox,
              p_pcode  TYPE postcode,
              p_city   TYPE city,
              p_cntry  TYPE s_country,
              p_region TYPE s_region,
              p_tel    TYPE s_phoneno,
              p_curr   TYPE s_curr_ag.

SELECTION-SCREEN END OF BLOCK a1.

DATA: go_stravelag_new_entry_alv TYPE REF TO zstravelag_new_entry_alv_6.
*      gt_fcat                    TYPE slis_t_fieldcat_alv,
*      gs_layout                  TYPE slis_layout_alv,
*      gt_stravelag               TYPE zcm_tt_stravelag.

START-OF-SELECTION.

  CREATE OBJECT go_stravelag_new_entry_alv.

  go_stravelag_new_entry_alv->new_entry(
    EXPORTING
      iv_agencynum = p_ag_num  " Seyahat acentası numarası
      iv_name      = p_name    " Seyahat acentası adı
      iv_street    = p_street  " Sokak
      iv_postbox   = p_pbox    " Posta kutusu
      iv_postcode  = p_pcode   " Posta kodu
      iv_city      = p_city    " Kent
      iv_country   = p_cntry   " Ülke göstergesi
      iv_region    = p_region  " Bölge
      iv_telephone = p_tel     " Uçak yolcusunun telefon numarası
      iv_currency  = p_curr    " Seyahat acentasının ulusal para birimi
  ).

  go_stravelag_new_entry_alv->prep_fcat(
    EXCEPTIONS
      no_fcat = 1
      OTHERS  = 2
  ).

  IF sy-subrc = 1.
*   Fieldcatalog Oluşturulamadı!
  ENDIF.

  go_stravelag_new_entry_alv->prep_layout(
    EXPORTING
      iv_zebra             = abap_true   " Tek basamaklı gösterge
      iv_colwidth_optimize = abap_true   " Tek basamaklı gösterge
  ).

  go_stravelag_new_entry_alv->prep_data( ).

*  go_stravelag_new_entry_alv->show_data( ).

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      is_layout          = go_stravelag_new_entry_alv->gs_layout
      it_fieldcat        = go_stravelag_new_entry_alv->gt_fcat
    TABLES
      t_outtab           = go_stravelag_new_entry_alv->gt_zcm_stravelag
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
