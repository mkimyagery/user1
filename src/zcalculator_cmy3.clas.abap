class ZCALCULATOR_CMY3 definition
  public
  final
  create public .

public section.

  methods HESAPLA
    importing
      !IV_SEMBOL type FLAG
      !IV_NUM_01 type INT4
      !IV_NUM_02 type INT4
    exporting
      !EV_SONUC type INT4
    exceptions
      GECERSIZ_ISLEM_KODU .
protected section.

  methods TOPLA
    importing
      !IV_NUM_TOPLA_01 type INT4
      !IV_NUM_TOPLA_02 type INT4
    exporting
      !EV_SONUC_TOPLAM type INT4 .
  methods CIKAR
    importing
      !IV_NUM_CIKAR_01 type INT4
      !IV_NUM_CIKAR_02 type INT4
    exporting
      !EV_SONUC_CIKARMA type INT4 .
  methods CARP
    importing
      !IV_NUM_CARP_01 type INT4
      !IV_NUM_CARP_02 type INT4
    exporting
      !EV_SONUC_CARPIM type INT4 .
  methods BOL
    importing
      !IV_NUM_BOL_01 type INT4
      !IV_NUM_BOL_02 type INT4
    exporting
      !EV_SONUC_BOLUM type INT4 .
private section.
ENDCLASS.



CLASS ZCALCULATOR_CMY3 IMPLEMENTATION.


  METHOD BOL.
    ev_sonuc_bolum = iv_num_bol_01 / iv_num_bol_02.
  ENDMETHOD.


  METHOD CARP.
    ev_sonuc_carpim = iv_num_carp_01 * iv_num_carp_02.
  ENDMETHOD.


  METHOD CIKAR.
    ev_sonuc_cikarma = iv_num_cikar_01 - iv_num_cikar_02.
  ENDMETHOD.


  METHOD HESAPLA.

    IF iv_sembol = '+'.

      topla(
        EXPORTING
          iv_num_topla_01 = iv_num_01
          iv_num_topla_02 = iv_num_02
        IMPORTING
          ev_sonuc_toplam = ev_sonuc ).

    ELSEIF iv_sembol = '-'.

      cikar(
        EXPORTING
          iv_num_cikar_01  = iv_num_01
          iv_num_cikar_02  = iv_num_02
        IMPORTING
          ev_sonuc_cikarma = ev_sonuc ).

    ELSEIF iv_sembol = '*'.

      carp(
        EXPORTING
          iv_num_carp_01  = iv_num_01
          iv_num_carp_02  = iv_num_02
        IMPORTING
          ev_sonuc_carpim = ev_sonuc ).

    ELSEIF iv_sembol = '/'.

      bol(
        EXPORTING
          iv_num_bol_01  = iv_num_01
          iv_num_bol_02  = iv_num_02
        IMPORTING
          ev_sonuc_bolum = ev_sonuc ).
    ELSE.
      RAISE gecersiz_islem_kodu.
    ENDIF.
  ENDMETHOD.


  METHOD TOPLA.
    ev_sonuc_toplam = iv_num_topla_01 + iv_num_topla_02.
  ENDMETHOD.
ENDCLASS.
