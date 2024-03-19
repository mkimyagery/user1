*&---------------------------------------------------------------------*
*& Report ZCM_TEST_328
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_328.
"Dinamik ALV

TYPES : BEGIN OF gty_static,
          tcno  TYPE c LENGTH 11,
          ad    TYPE c LENGTH 25,
          soyad TYPE c LENGTH 25,
        END OF gty_static.

TYPES : BEGIN OF gty_sirket,
          sirket TYPE c LENGTH 25,
        END OF gty_sirket.

TYPES : BEGIN OF gty_banka,
          banka TYPE c LENGTH 25,
        END OF gty_banka.

DATA : dt_1 TYPE REF TO data.

DATA : gt_static   TYPE TABLE OF gty_static,
       gt_sirket   TYPE TABLE OF gty_sirket,
       gt_banka    TYPE TABLE OF gty_banka,
       gt_fieldcat TYPE lvc_t_fcat,
       gs_layout   TYPE lvc_s_layo.


FIELD-SYMBOLS : <fs_tab> TYPE STANDARD TABLE.

START-OF-SELECTION.

"Tablonun bütün satırlarını oku
SELECT * FROM zcm_finans_genel INTO TABLE @DATA(gt_table).

gt_static = VALUE #( FOR gs_line IN gt_table ( tcno  = gs_line-tcno
                                               ad    = gs_line-ad
                                               soyad = gs_line-soyad ) ).
SORT gt_static BY tcno.
DELETE ADJACENT DUPLICATES FROM gt_static COMPARING tcno.

gt_sirket = VALUE #( FOR gs_line IN gt_table ( sirket = gs_line-sirket ) ) .
SORT gt_sirket BY sirket.
DELETE ADJACENT DUPLICATES FROM gt_sirket COMPARING sirket.

gt_banka = VALUE #( FOR gs_line IN gt_table ( banka = gs_line-banka ) ).
SORT gt_banka BY banka.
DELETE ADJACENT DUPLICATES FROM gt_banka COMPARING banka.

"Fieldcat tablosunu hazırla
gt_fieldcat = VALUE #( ( fieldname = 'TCNO'  scrtext_s = 'TCNO'  outputlen = '12' )
                       ( fieldname = 'AD'    scrtext_s = 'AD'    outputlen = '15' )
                       ( fieldname = 'SOYAD' scrtext_s = 'SOYAD' outputlen = '15' ) ).

gt_fieldcat = VALUE #( BASE gt_fieldcat FOR gs_srkt IN gt_sirket ( fieldname = gs_srkt-sirket
                                                                   scrtext_s = gs_srkt-sirket
                                                                   outputlen = '30' ) ).

gt_fieldcat = VALUE #( BASE gt_fieldcat FOR gs_bnka IN gt_banka ( fieldname = gs_bnka-banka
                                                                  scrtext_s = gs_bnka-banka
                                                                  outputlen = '30' ) ).

cl_alv_table_create=>create_dynamic_table(
  EXPORTING
    it_fieldcatalog           = gt_fieldcat
  IMPORTING
    ep_table                  = dt_1
  EXCEPTIONS
    generate_subpool_dir_full = 1
    OTHERS                    = 2 ).

IF sy-subrc <> 0.
  LEAVE PROGRAM.
ELSE.
  ASSIGN dt_1->* TO <fs_tab>.
ENDIF.

LOOP AT gt_static INTO DATA(gs_statik).

  APPEND INITIAL LINE TO <fs_tab> ASSIGNING FIELD-SYMBOL(<fs_str>).

  ASSIGN COMPONENT 'AD' OF STRUCTURE <fs_str> TO FIELD-SYMBOL(<fs_field>).
  <fs_field> = gs_statik-ad.

  ASSIGN COMPONENT 'SOYAD' OF STRUCTURE <fs_str> TO <fs_field>.
  <fs_field> = gs_statik-soyad.

  ASSIGN COMPONENT 'TCNO' OF STRUCTURE <fs_str> TO <fs_field>.
  <fs_field> = gs_statik-tcno.

  LOOP AT gt_table INTO DATA(gs_table) WHERE tcno = gs_statik-tcno.
    ASSIGN COMPONENT gs_table-banka OF STRUCTURE <fs_str> TO <fs_field>.
    <fs_field> = abap_true.

    ASSIGN COMPONENT gs_table-sirket OF STRUCTURE <fs_str> TO <fs_field>.
    <fs_field> = abap_true.

  ENDLOOP.

ENDLOOP.

gs_layout-zebra      = abap_true.
gs_layout-cwidth_opt = abap_true.
gs_layout-sel_mode   = 'A'.

"ALV'yi ekranda göster.
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
  EXPORTING
    i_callback_program = sy-repid
    is_layout_lvc      = gs_layout
    it_fieldcat_lvc    = gt_fieldcat
  TABLES
    t_outtab           = <fs_tab>
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.

IF sy-subrc IS NOT INITIAL.
  LEAVE PROGRAM.
ENDIF.
