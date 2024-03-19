*&---------------------------------------------------------------------*
*& Report ZABAP_CM_006
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_006.

DATA : gs_scarr  TYPE scarr,
       gt_scarr  TYPE TABLE OF scarr,
       gv_carrid TYPE s_carr_id.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

*  SELECT-OPTIONS : so_carr FOR gs_scarr-carrid.
  SELECT-OPTIONS : so_carr FOR gv_carrid.

SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  SELECT * FROM scarr INTO TABLE gt_scarr WHERE carrid IN so_carr.

  LOOP AT gt_scarr INTO gs_scarr.

    WRITE : gs_scarr-carrid  , gs_scarr-carrname,
            gs_scarr-currcode, gs_scarr-url.

    CLEAR: gs_scarr.
    SKIP.

  ENDLOOP.
