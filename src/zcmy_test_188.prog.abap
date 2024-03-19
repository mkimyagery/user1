*&---------------------------------------------------------------------*
*& Report ZCM_TEST_188
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_188.

DATA : go_alvgrid   TYPE REF TO cl_gui_alv_grid,
       go_container TYPE REF TO cl_gui_custom_container,
       gt_fieldcat  TYPE lvc_t_fcat,
       gs_fieldcat  TYPE lvc_s_fcat,
       gs_layout    TYPE lvc_s_layo.
*       gv_flag      TYPE flag.

TYPES : BEGIN OF gty_list.
          INCLUDE STRUCTURE sflight.
TYPES:    traffic_light TYPE icon-id.
TYPES : END OF gty_list.

DATA : gt_list TYPE TABLE OF gty_list,
       gs_list TYPE gty_list.

*DATA : gv_price    TYPE sflight-price,
*       gv_seatsmax TYPE sflight-seatsmax.

START-OF-SELECTION.

  CALL SCREEN 0300.
*&---------------------------------------------------------------------*
*& Module STATUS_0300 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0300 OUTPUT.
  SET PF-STATUS 'PF_STATUS_188'.
  SET TITLEBAR 'TITLE_188'.

  PERFORM select_data.
  PERFORM traffic_lights.
  PERFORM fcat.
  PERFORM layout.
  PERFORM show_alv.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0300 INPUT.

  CASE sy-ucomm.
    WHEN 'BACK' OR 'EXIT' OR '&F12'.
      LEAVE PROGRAM.

    WHEN 'PRICE'.

      PERFORM select_data.
      PERFORM traffic_lights.
      PERFORM fcat.
      PERFORM layout.
      PERFORM show_alv.
      CLEAR : gt_fieldcat.


    WHEN 'SMAX'.

      PERFORM select_data.
      PERFORM traffic_lights.
      PERFORM fcat.
      PERFORM layout.
      PERFORM show_alv.
      CLEAR : gt_fieldcat.


  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form select_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM select_data .

  SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_list.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fcat .

  IF gt_fieldcat IS INITIAL.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'SFLIGHT'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = gt_fieldcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.



  ENDIF.

*  IF gv_flag IS NOT INITIAL.
  CASE sy-ucomm.
    WHEN 'PRICE'.

      gs_fieldcat-fieldname = 'TRAFFIC_LIGHT'.
      gs_fieldcat-col_pos   = 4.
      gs_fieldcat-scrtext_m = 'Fiyat Durumu'.
      APPEND gs_fieldcat TO gt_fieldcat.
      CLEAR: gs_fieldcat.

    WHEN 'SMAX'.

      gs_fieldcat-fieldname = 'TRAFFIC_LIGHT'.
      gs_fieldcat-col_pos   = 7.
      gs_fieldcat-scrtext_m = 'Koltuk Durumu'.
      APPEND gs_fieldcat TO gt_fieldcat.
      CLEAR: gs_fieldcat.

  ENDCASE.
*  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM layout .

  gs_layout-zebra      = abap_true.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-sel_mode   = 'A'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_alv .

  IF go_alvgrid IS INITIAL.

    CREATE OBJECT go_container
      EXPORTING
        container_name              = 'CON'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 6.

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    CREATE OBJECT go_alvgrid
      EXPORTING
        i_parent          = go_container
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->set_table_for_first_display(
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_list
        it_fieldcatalog               = gt_fieldcat
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.

    go_alvgrid->set_frontend_fieldcatalog( it_fieldcatalog = gt_fieldcat ).

    go_alvgrid->set_frontend_layout( is_layout = gs_layout ).

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form traffic_lights
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM traffic_lights .

  DATA : lv_dec TYPE p DECIMALS 1.

  CASE sy-ucomm.
    WHEN 'PRICE'.

      LOOP AT gt_list INTO gs_list.

        IF gs_list-price < 350.
          gs_list-traffic_light = '@08@'.
        ELSEIF gs_list-price >= 350 AND gs_list-price < 750.
          gs_list-traffic_light = '@09@'.
        ELSEIF gs_list-price >= 750.
          gs_list-traffic_light = '@0A@'.
        ENDIF.

        MODIFY gt_list FROM gs_list TRANSPORTING traffic_light
                                    WHERE carrid = gs_list-carrid
                                      AND connid = gs_list-connid
                                      AND fldate = gs_list-fldate.

      ENDLOOP.

    WHEN 'SMAX'.

      LOOP AT gt_list INTO gs_list.

        lv_dec = gs_list-seatsocc / gs_list-seatsmax.

        IF lv_dec >= ( 80 / 100 ).
          gs_list-traffic_light = '@0A@'.
        ELSEIF lv_dec < ( 80 / 100 ) AND lv_dec >= ( 40 / 100 ).
          gs_list-traffic_light = '@09@'.
        ELSEIF lv_dec <  ( 40 / 100 ).
          gs_list-traffic_light = '@08@'.
        ENDIF.

        MODIFY gt_list FROM gs_list TRANSPORTING traffic_light
                                    WHERE carrid = gs_list-carrid
                                      AND connid = gs_list-connid
                                      AND fldate = gs_list-fldate.

      ENDLOOP.


  ENDCASE.

ENDFORM.
