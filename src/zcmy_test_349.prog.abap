*&---------------------------------------------------------------------*
*& Report ZCM_TEST_349
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_349.

TABLES : sscrfields.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS : p_kay_no TYPE int1,
               p_ogr_id TYPE numc5,
               p_ogr_ad TYPE char30,
               p_ogr_sd TYPE char30,
               p_ders   TYPE char30,
               p_sonuc  TYPE zcmd_de_snc_2.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.
  SELECTION-SCREEN PUSHBUTTON 5(15) but1 USER-COMMAND oku.
SELECTION-SCREEN END OF BLOCK a2.

DATA : gs_ders_notu_yeni TYPE zcm_ders_notlari,
       gt_ders_notu_yeni TYPE TABLE OF zzcm_ders_notlari,
       gt_ders_notu      TYPE TABLE OF zzcm_ders_notlari,
       gt_cdpos          TYPE cdpos_tab,
       gv_islem.

INITIALIZATION.

  CALL FUNCTION 'ICON_CREATE'
    EXPORTING
      name                  = icon_toggle_display
      text                  = 'OKU'
      info                  = 'OKU'
    IMPORTING
      result                = but1
    EXCEPTIONS
      icon_not_found        = 1
      outputfield_too_short = 2
      OTHERS                = 3.

AT SELECTION-SCREEN.

  CASE sscrfields-ucomm.
    WHEN 'OKU'.

      IF p_kay_no IS NOT INITIAL.

        SELECT SINGLE * FROM zcm_ders_notları
          INTO @DATA(gs_structure)
         WHERE kayit_no = @p_kay_no.

        IF sy-subrc = 0.
          p_ogr_id = gs_structure-ogr_id.
          p_ogr_ad = gs_structure-ogr_ad.
          p_ogr_sd = gs_structure-ogr_soyad.
          p_ders   = gs_structure-ders.
          p_sonuc  = gs_structure-sonuc.
        ELSE.
          MESSAGE 'Kayıt Bulunamadı!' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.

      ELSE.
        MESSAGE 'Kayıt No Girilmedi!' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

  ENDCASE.

START-OF-SELECTION.

  SELECT SINGLE * FROM zcm_ders_notları
         INTO @DATA(gs_ders_notu)
         WHERE kayit_no = @p_kay_no.

  IF p_kay_no IS NOT INITIAL.

    UPDATE zcm_ders_notlari SET sonuc    = p_sonuc
                          WHERE kayit_no = p_kay_no.

    IF sy-subrc <> 0.
      MESSAGE 'Güncelleme Başarız!' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.

    gs_ders_notu_yeni-ogr_id    = p_ogr_id.
    gs_ders_notu_yeni-ogr_ad    = p_ogr_ad.
    gs_ders_notu_yeni-ogr_soyad = p_ogr_sd.
    gs_ders_notu_yeni-ders      = p_ders.
    gs_ders_notu_yeni-sonuc     = p_sonuc.
    gv_islem = 'U'.

    APPEND gs_ders_notu_yeni TO gt_ders_notu_yeni.
*    CLEAR: gs_ders_notu_yeni.

  ELSE.

    MESSAGE 'Güncelleme başarısız.Kayıt no bulunamadı!' TYPE 'S' DISPLAY LIKE 'E'.

  ENDIF.

  IF gs_ders_notu IS NOT INITIAL.
    gs_ders_notu-mandt = sy-mandt.
    APPEND gs_ders_notu TO gt_ders_notu.
  ENDIF.

  IF gs_ders_notu_yeni IS NOT INITIAL.
    gs_ders_notu_yeni-mandt = sy-mandt.
    APPEND gs_ders_notu_yeni TO gt_ders_notu_yeni.
  ENDIF.

  CALL FUNCTION 'ZCM_CDO_03_WRITE_DOCUMENT'
    EXPORTING
      objectid             = 'ZCM_CDO_03'
      tcode                = sy-tcode
      utime                = sy-uzeit
      udate                = sy-datum
      username             = sy-uname
      upd_zcm_ders_notlari = gv_islem
    TABLES
      xzcm_ders_notlari    = gt_ders_notu_yeni
      yzcm_ders_notlari    = gt_ders_notu.

  CALL FUNCTION 'CHANGEDOCUMENT_READ_ALL'
    EXPORTING
      i_objectclass              = 'ZCM_CDO_03'
      i_tablename                = 'ZCM_DERS_NOTLARI'
    IMPORTING
      et_cdpos                   = gt_cdpos
    EXCEPTIONS
      missing_input_objectclass  = 1
      missing_input_header       = 2
      no_position_found          = 3
      wrong_access_to_archive    = 4
      time_zone_conversion_error = 5
      read_too_many_entries      = 6
      OTHERS                     = 7.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.
