*&---------------------------------------------------------------------*
*& Report ZCM_TEST_319
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_319.

"Corresponding

TYPES : BEGIN OF gty_table,
          id       TYPE zcm_de_id,
          yil      TYPE c LENGTH 4,
          kul_izin TYPE int1,
        END OF gty_table.

DATA : gs_izin      TYPE gty_table,
       gs_izin_yeni TYPE gty_table,
       gt_izin      TYPE TABLE OF gty_table,
       gt_izin_yeni TYPE TABLE OF gty_table,
       gs_tablo_2   TYPE zcm_tablo_2,
       gt_tablo_2   TYPE TABLE OF zcm_tablo_2.

START-OF-SELECTION.

  SELECT * FROM zcm_tablo_2 INTO TABLE gt_tablo_2.

  "Structuredan structure atama
  "7.40 öncesinde
  LOOP AT gt_tablo_2 INTO gs_tablo_2.
    MOVE-CORRESPONDING gs_tablo_2 TO gs_izin.
    APPEND gs_izin TO gt_izin.
    CLEAR: gs_izin.
  ENDLOOP.

  "7.40 sonrasında
  LOOP AT gt_tablo_2 INTO gs_tablo_2.
    gs_izin_yeni = CORRESPONDING #( gs_tablo_2 ).
  ENDLOOP.

  "Tablodan tabloya atama
  "7.40 öncesinde
  MOVE-CORRESPONDING gt_tablo_2 TO gt_izin.

  "7.40 sonrasında
  gt_izin_yeni = CORRESPONDING #( gt_tablo_2 ).

  BREAK user1.
