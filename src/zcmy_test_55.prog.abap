*&---------------------------------------------------------------------*
*& Report ZCM_TEST_55
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_55.
"Select Komutu

*DATA : gs_structure TYPE zcm_table_001,
*       gt_table     TYPE TABLE OF zcm_table_001.
*
*SELECT * FROM zcm_table_001 INTO TABLE gt_table WHERE id > 20240002.
*
*LOOP AT gt_table INTO gs_structure.
*  WRITE : gs_structure-id , gs_structure-name  , gs_structure-surname,
*          gs_structure-job, gs_structure-salary, gs_structure-curr,
*          gs_structure-gsm, gs_structure-e_mail.
*  SKIP.
*  ULINE.
*  CLEAR: gs_structure.
*ENDLOOP.
**********************************************************************
*DATA : gs_structure TYPE scarr,
*       gt_table     TYPE TABLE OF scarr.
*
*SELECT * FROM scarr INTO TABLE gt_table UP TO 5 ROWS.
*
*LOOP AT gt_table INTO gs_structure.
*  WRITE : gs_structure-carrid,
*          gs_structure-carrname,
*          gs_structure-currcode,
*          gs_structure-url.
*  SKIP.
*  ULINE.
*  CLEAR: gs_structure.
*ENDLOOP.
**********************************************************************

*DATA : gs_structure TYPE scarr.
*
*SELECT SINGLE * FROM scarr INTO gs_structure WHERE carrid = 'LH'.
*
*WRITE : gs_structure-carrid,
*        gs_structure-carrname,
*        gs_structure-currcode,
*        gs_structure-url.
**********************************************************************

*TYPES: BEGIN OF gty_structure,
*         firma TYPE c LENGTH 3,
*         web   TYPE c LENGTH 255,
*       END OF gty_structure.
*
*DATA : gs_structure TYPE gty_structure,
*       gt_table     TYPE TABLE OF gty_structure.
*
*START-OF-SELECTION.
*
*  SELECT carrid url FROM scarr INTO TABLE gt_table UP TO 5 ROWS.
*
*  LOOP AT gt_table INTO gs_structure.
*    WRITE : gs_structure-firma,
*            gs_structure-web.
*    SKIP.
*    ULINE.
*    CLEAR: gs_structure.
*  ENDLOOP.

**********************************************************************

*TYPES : BEGIN OF gty_structure,
*          adres  TYPE c LENGTH 30,
*          carrid TYPE c LENGTH 3,
*          tel    TYPE c LENGTH 12,
*          url    TYPE c LENGTH 255,
*        END OF gty_structure.
*
*DATA : gs_structure TYPE gty_structure,
*       gt_table     TYPE TABLE OF gty_structure.
*
*START-OF-SELECTION.
*
*  SELECT carrid url FROM scarr
**    INTO TABLE gt_table UP TO 10 ROWS.
*    INTO CORRESPONDING FIELDS OF TABLE gt_table UP TO 10 ROWS.
*
*  LOOP AT gt_table INTO gs_structure.
*    WRITE : gs_structure-carrid, gs_structure-url.
*    SKIP.
*  ENDLOOP.
