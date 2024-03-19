*&---------------------------------------------------------------------*
*& Report ZCM_TEST_33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_33.

"Internal Tablolar

TYPES : BEGIN OF gty_structure ,
          id      TYPE n LENGTH 8,
          name    TYPE c LENGTH 40,
          surname TYPE c LENGTH 40,
          job     TYPE c LENGTH 20,
          salary  TYPE i,
          curr    TYPE c LENGTH 3,
          gsm     TYPE string,
          e_mail  TYPE string,
        END OF gty_structure.

DATA : gs_structure TYPE gty_structure,
       gt_table     TYPE TABLE OF gty_structure,
       gv_id_start  TYPE n LENGTH 8 VALUE '20240001'.

CONSTANTS : gc_satır TYPE c LENGTH 6 VALUE 'Satir :'.

START-OF-SELECTION.

  DO 10 TIMES.

    IF sy-index > 1.
      gv_id_start = gv_id_start + 1.
    ENDIF.

    gs_structure-id      = gv_id_start.
    gs_structure-name    = 'Ali'.
    gs_structure-surname = 'Öztürk'.
    gs_structure-job     = 'Doctor'.
    gs_structure-salary  = 4000.
    gs_structure-curr    = 'EURO'.
    gs_structure-gsm     = '+4916634543254'.
    gs_structure-e_mail  = 'ozturkali@gmail.com'.

    APPEND gs_structure TO gt_table.
    CLEAR: gs_structure.

  ENDDO.

*  LOOP AT gt_table INTO gs_structure FROM 5 TO 8 WHERE id BETWEEN '20240006' AND '20240008'.
  LOOP AT gt_table INTO gs_structure .

*    IF gs_structure-id = '20240001' OR gs_structure-id = '20240003' OR
*       gs_structure-id = '20240005' OR gs_structure-id = '20240007' OR
*       gs_structure-id = '20240009'.
*      CONTINUE.
*    ENDIF.

*    IF sy-tabix > 3.
*      EXIT.
*    ENDIF.

*    CHECK gs_structure-id > '20240008'.

    WRITE : / gs_structure-id     ,
            / gs_structure-name   ,
            / gs_structure-surname,
            / gs_structure-job    ,
            / gs_structure-salary ,
            / gs_structure-curr   ,
            / gs_structure-gsm    ,
            / gs_structure-e_mail .
    ULINE.
    SKIP.
  ENDLOOP.


  BREAK user1.
**********************************************************************
**  DO 10 TIMES.
**
**    IF sy-index > 1.
**      gv_id_start = gv_id_start + 1.
**    ENDIF.
**
**    gs_structure-id      = gv_id_start.  "20220001.
**    gs_structure-name    = 'Mehmet'.
**    gs_structure-surname = 'Yilmaz'.
**    gs_structure-job     = 'Teacher'.
**    gs_structure-salary  = 3000.
**    gs_structure-curr    = 'EURO'.
**    gs_structure-gsm     = '+4916634543298'.
**    gs_structure-e_mail  = 'mehmetyilmaz@gmail.com'.
**
**    APPEND gs_structure TO gt_table.
**    CLEAR: gs_structure.
**
**  ENDDO.
**
**  LOOP AT gt_table INTO gs_structure FROM 5 TO 8.
**
**    WRITE : / gs_structure-id     ,
**            / gs_structure-name   ,
**            / gs_structure-surname,
**            / gs_structure-job    ,
**            / gs_structure-salary ,
**            / gs_structure-curr   ,
**            / gs_structure-gsm    ,
**            / gs_structure-e_mail .
**    ULINE.
**    SKIP.
**  ENDLOOP.



**********************************************************************

*  gs_structure-id      = gv_id_start."20220001.
*  gs_structure-name    = 'Mehmet'.
*  gs_structure-surname = 'Yilmaz'.
*  gs_structure-job     = 'Teacher'.
*  gs_structure-salary  = 3000.
*  gs_structure-curr    = 'EURO'.
*  gs_structure-gsm     = '+4916634543298'.
*  gs_structure-e_mail  = 'mehmetyilmaz@gmail.com'.
*
*  APPEND gs_structure TO gt_table.
*  CLEAR: gs_structure.
*
*  gs_structure-id      = 20220002.
*  gs_structure-name    = 'Ferdi'.
*  gs_structure-surname = 'Tayfur'.
*  gs_structure-job     = 'Artist'.
*  gs_structure-salary  = 5000.
*  gs_structure-curr    = 'EURO'.
*  gs_structure-gsm     = '+4916634543247'.
*  gs_structure-e_mail  = 'ferditayfur@gmail.com'.
*
*  APPEND gs_structure TO gt_table.
*  CLEAR: gs_structure.
*
*  gs_structure-id      = 20220003.
*  gs_structure-name    = 'Ali'.
*  gs_structure-surname = 'Öztürk'.
*  gs_structure-job     = 'Doctor'.
*  gs_structure-salary  = 4000.
*  gs_structure-curr    = 'EURO'.
*  gs_structure-gsm     = '+4916634543254'.
*  gs_structure-e_mail  = 'ozturkali@gmail.com'.
*
*  APPEND gs_structure TO gt_table.
*  CLEAR: gs_structure.

*  LOOP AT gt_table INTO gs_structure WHERE id >= 20220002.
*
*    WRITE : / gs_structure-id     ,
*            / gs_structure-name   ,
*            / gs_structure-surname,
*            / gs_structure-job    ,
*            / gs_structure-salary ,
*            / gs_structure-curr   ,
*            / gs_structure-gsm    ,
*            / gs_structure-e_mail .
*
*    SKIP.
*    ULINE.
*  ENDLOOP.
