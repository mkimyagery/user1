*&---------------------------------------------------------------------*
*& Report ZCM_TEST_320
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_320.


PARAMETERS : p_id_1 TYPE zcm_de_id,
             p_id_2 TYPE zcm_de_id.

TYPES : BEGIN OF gty_table,
          id       TYPE zcm_de_id,
          yil      TYPE c LENGTH 4,
          kul_izin TYPE int1,
        END OF gty_table.

DATA : gt_izin      TYPE TABLE OF gty_table,
       gt_izin_yeni TYPE TABLE OF gty_table,
       gt_tablo_2   TYPE TABLE OF zcm_tablo_2.

START-OF-SELECTION.

  SELECT * FROM zcm_tablo_2 INTO TABLE gt_tablo_2 WHERE id = p_id_1.

  "7.40 öncesinde
  MOVE-CORRESPONDING gt_tablo_2 TO gt_izin.

  "7.40 sonrasında
  gt_izin_yeni = CORRESPONDING #( gt_tablo_2 ).


  SELECT * FROM zcm_tablo_2 INTO TABLE gt_tablo_2 WHERE id = p_id_2.

  "7.40 öncesinde
  MOVE-CORRESPONDING gt_tablo_2 TO gt_izin KEEPING TARGET LINES.

  "7.40 sonrasında
  gt_izin_yeni = CORRESPONDING #( BASE ( gt_izin_yeni ) gt_tablo_2 ) .

  BREAK-POINT.
