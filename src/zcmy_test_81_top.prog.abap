*&---------------------------------------------------------------------*
*& Include          ZCM_TEST_81_TOP
*&---------------------------------------------------------------------*

TYPES : BEGIN OF gty_str_carrid,
          sign   TYPE c LENGTH 1,
          option TYPE c LENGTH 2,
          low    TYPE s_carr_id,
          high   TYPE s_carr_id,
        END OF gty_str_carrid.

TYPES : BEGIN OF gty_str_connid,
          sign   TYPE c LENGTH 1,
          option TYPE c LENGTH 2,
          low    TYPE s_conn_id,
          high   TYPE s_conn_id,
        END OF gty_str_connid.

DATA : gs_selopt_carrid TYPE gty_str_carrid,
       gs_selopt_connid TYPE gty_str_connid,
       gt_selopt_carrid TYPE RANGE OF s_carr_id,
       gt_selopt_connid TYPE RANGE OF s_conn_id,
       gt_sflight       TYPE TABLE OF sflight,
       gs_sflight       TYPE sflight,
       gv_no_lines      TYPE i.
