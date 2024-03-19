*&---------------------------------------------------------------------*
*& Report ZCM_TEST_345
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_345.

"Alıştırma – 11: Yeni bir rapor oluşturun ve içerisinde 3 kolonlu yeni bir internal tablo tanımlayın.
"Tablonun kolonları DERS_ADI, DERS_NOTU ve BASARI_DURUMU olsun. Internal tabloya 3 adet yeni
"satir ekleyin. Tabloda loop edin ve BASARI_DURUMU hücresini CON WHEN THEN ELSE komutu
"kullanarak doldurun.

TYPES: BEGIN OF gty_table,
         ders_adi      TYPE c LENGTH 15,
         ders_notu     TYPE i,
         basari_durumu TYPE c LENGTH 20,
       END OF gty_table.

DATA: gt_table TYPE TABLE OF gty_table.

START-OF-SELECTION.

  APPEND INITIAL LINE TO gt_table ASSIGNING FIELD-SYMBOL(<fs_str>).
  <fs_str>-ders_adi            = 'MATEMATIK'.
  <fs_str>-ders_notu           = 90.
*<fs_str>-basari_durumu       = .

  APPEND INITIAL LINE TO gt_table ASSIGNING <fs_str>.
  <fs_str>-ders_adi            = 'FEN BILGISI'.
  <fs_str>-ders_notu           = 85.
*<fs_str>-basari_durumu       = .

  APPEND INITIAL LINE TO gt_table ASSIGNING <fs_str>.
  <fs_str>-ders_adi            = 'TURKCE'.
  <fs_str>-ders_notu           = 75.
*<fs_str>-basari_durumu       = .

  LOOP AT gt_table ASSIGNING FIELD-SYMBOL(<fs_table>).
*   <fs_table>-basari_durumu = cond #( when <fs_str>-ders_notu >= 85 THEn 'Başarılı'
*                                      when <fs_str>-ders_notu >= 85 THEn 'Başarılı'
*                             ).
  ENDLOOP.
