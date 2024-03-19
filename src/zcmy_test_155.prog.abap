*&---------------------------------------------------------------------*
*& Report ZCM_TEST_155
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_155.

DATA : go_alvgrid   TYPE REF TO cl_gui_alv_grid,
       go_container TYPE REF TO cl_gui_custom_container,
       gt_fieldcat  TYPE lvc_t_fcat,
       gs_fieldcat  TYPE lvc_s_fcat , "LIKE LINE OF gt_fieldcat, "Alternatif
       gs_layout    TYPE lvc_s_layo,
       gv_flag      TYPE flag.

TYPES : BEGIN OF gty_list. " ( sflight alanları) row color || cell color  -> tek satırlık bi tip
          INCLUDE STRUCTURE sflight.
TYPES :   row_color TYPE c LENGTH 4.
TYPES :   cell_color TYPE lvc_t_scol.
*TYPES:    traffic_light TYPE c LENGTH 1.
TYPES:    traffic_light TYPE icon-id.
TYPES : END OF gty_list.

DATA : gt_list TYPE TABLE OF gty_list."internal table

START-OF-SELECTION.

  CALL SCREEN 0100. "Bu numara 1000 olmamali.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT. "PBO

  SET PF-STATUS 'PF_STATUS_155'.
  SET TITLEBAR 'TITLE_155'.

  PERFORM select_data.
  PERFORM open_traffic_lights.
  PERFORM fcat.
  PERFORM layout.
  PERFORM show_alv.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT. "PAI

  DATA : lt_selected_rows  TYPE lvc_t_roid, "TYPE LVC_T_ROID
         ls_selected_rows  TYPE lvc_s_roid,
         lt_list           TYPE TABLE OF gty_list,
         ls_list           TYPE gty_list,
         lt_index_columns  TYPE lvc_t_col,
         ls_index_columns  TYPE lvc_s_col,
         lv_color          TYPE lvc_emphsz,
         lv_answer         TYPE c LENGTH 1,
         lt_selected_cells TYPE lvc_t_cell,
         ls_selected_cells TYPE lvc_s_cell,
         ls_sell_color     TYPE lvc_s_scol,
         lv_color_number   TYPE char1,
         lv_intensified    TYPE char1,
         lv_inverse        TYPE char1,
         lt_filter         TYPE lvc_t_filt,
         ls_filter         TYPE lvc_s_filt,
         lt_sort           TYPE lvc_t_sort,
         ls_sort           TYPE lvc_s_sort.


  CASE sy-ucomm.

    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'. "test
      LEAVE PROGRAM.

    WHEN 'SIL'.

      go_alvgrid->get_selected_rows(
        IMPORTING
          et_row_no     = lt_selected_rows ).

      IF lt_selected_rows IS NOT INITIAL.

        lt_list = gt_list.

        LOOP AT lt_selected_rows INTO ls_selected_rows.
          READ TABLE lt_list INTO ls_list INDEX ls_selected_rows-row_id.
          IF sy-subrc EQ 0.
            DELETE gt_list WHERE carrid = ls_list-carrid
                             AND connid = ls_list-connid
                             AND fldate = ls_list-fldate.
            gv_flag = abap_true.
          ENDIF.
        ENDLOOP.
      ELSE.
        MESSAGE TEXT-001 TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'RESET'.

      CLEAR : gt_list.
      SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_list.

    WHEN 'K_RENK'.

      go_alvgrid->get_selected_columns(
        IMPORTING
          et_index_columns = lt_index_columns ).

      IF lt_index_columns IS NOT INITIAL.

        CALL FUNCTION 'ZCM_COLOR_SELECTION'
          IMPORTING
            ev_color  = lv_color
            ev_answer = lv_answer.

        IF lv_answer IS INITIAL AND lv_color IS NOT INITIAL.
*          lv_color = 'C711'.
          LOOP AT lt_index_columns INTO ls_index_columns.
            READ TABLE gt_fieldcat INTO gs_fieldcat WITH KEY fieldname = ls_index_columns-fieldname.
            IF sy-subrc EQ 0.
              gs_fieldcat-emphasize = lv_color.
              MODIFY gt_fieldcat FROM gs_fieldcat
              TRANSPORTING emphasize
                     WHERE fieldname = gs_fieldcat-fieldname.
            ENDIF.
          ENDLOOP.

        ENDIF.


      ELSE.
        MESSAGE 'En az bir adet kolon seciniz' TYPE 'I'.
      ENDIF.

    WHEN 'S_RENK'.

      go_alvgrid->get_selected_rows(
        IMPORTING
          et_row_no     = lt_selected_rows ).

      IF lt_selected_rows IS NOT INITIAL.

        CALL FUNCTION 'ZCM_COLOR_SELECTION'
          IMPORTING
            ev_color  = lv_color
            ev_answer = lv_answer.

        IF lv_answer IS INITIAL AND lv_color IS NOT INITIAL.

          LOOP AT lt_selected_rows INTO ls_selected_rows.
            READ TABLE gt_list INTO ls_list INDEX ls_selected_rows-row_id.
            IF sy-subrc EQ 0.

              ls_list-row_color = lv_color.
              MODIFY gt_list FROM ls_list TRANSPORTING row_color WHERE carrid = ls_list-carrid
                                                                   AND connid = ls_list-connid
                                                                   AND fldate = ls_list-fldate.
            ENDIF.
          ENDLOOP.

        ENDIF.

      ELSE.
        MESSAGE TEXT-001 TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'H_RENK'.

      go_alvgrid->get_selected_cells(
        IMPORTING
          et_cell = lt_selected_cells ).

      IF lt_selected_cells IS NOT INITIAL.

        CALL FUNCTION 'ZCM_COLOR_SELECTION_CELL'
          IMPORTING
            ev_color_number = lv_color_number
            ev_intensified  = lv_intensified
            ev_inverse      = lv_inverse
            ev_answer       = lv_answer.

        LOOP AT lt_selected_cells INTO ls_selected_cells.

          ls_sell_color-fname     = ls_selected_cells-col_id.
          ls_sell_color-color-col = lv_color_number.
          ls_sell_color-color-int = lv_intensified.
          ls_sell_color-color-inv = lv_inverse.

          READ TABLE gt_list INTO ls_list INDEX ls_selected_cells-row_id.
          IF sy-subrc EQ 0.
            APPEND ls_sell_color TO ls_list-cell_color.
            MODIFY gt_list FROM ls_list TRANSPORTING cell_color WHERE carrid = ls_list-carrid
                                                                  AND connid = ls_list-connid
                                                                  AND fldate = ls_list-fldate.
          ENDIF.


        ENDLOOP.

      ELSE.
        MESSAGE 'En az bir adet hücre seciniz!' TYPE 'I'.
      ENDIF.

    WHEN 'F_UCAK'.

      DATA: lv_number TYPE i.

      go_alvgrid->get_selected_cells(
        IMPORTING
          et_cell = lt_selected_cells ).

      DESCRIBE TABLE lt_selected_cells LINES lv_number.

*      IF lines( lt_selected_cells ). "Alternatif
      IF lv_number = 1.
        READ TABLE lt_selected_cells INTO ls_selected_cells INDEX 1.

        IF sy-subrc IS INITIAL.
          IF ls_selected_cells-col_id = 'PLANETYPE'.

            READ TABLE gt_list INTO ls_list INDEX ls_selected_cells-row_id.
            IF sy-subrc IS INITIAL.
              ls_filter-fieldname = 'PLANETYPE'.
              ls_filter-sign      = 'I'.
              ls_filter-option    = 'EQ'.
              ls_filter-low       = ls_list-planetype.

              APPEND ls_filter TO lt_filter.

            ENDIF.
          ELSE.
            MESSAGE 'Lütfen PLANETYPE kolonundan bir hücre seciniz.' TYPE 'S' DISPLAY LIKE 'E'.
          ENDIF.
        ENDIF.
      ELSE.

        MESSAGE 'Filtreleme butonu sadece 1 hücre secerek kullanilabilir' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'A_Z'.

      CLEAR: lt_sort.

      go_alvgrid->get_selected_cells(
      IMPORTING
        et_cell = lt_selected_cells ).

      IF lines( lt_selected_cells ) = 1.

        READ TABLE lt_selected_cells INTO ls_selected_cells INDEX 1.
        IF sy-subrc IS INITIAL.
          ls_sort-spos      = sy-tabix.
          ls_sort-fieldname = ls_selected_cells-col_id.
          ls_sort-up        = abap_true.
          ls_sort-down      = ' '.

          APPEND ls_sort TO lt_sort.
          CLEAR: ls_sort.
        ENDIF.
      ELSE.
        MESSAGE 'Siralama butonu sadece 1 hücre secerek kullanilabilir' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'Z_A'.
      CLEAR: lt_sort.

      go_alvgrid->get_selected_cells(
      IMPORTING
        et_cell = lt_selected_cells ).

      IF lines( lt_selected_cells ) = 1.

        READ TABLE lt_selected_cells INTO ls_selected_cells INDEX 1.
        IF sy-subrc IS INITIAL.
          ls_sort-spos      = sy-tabix.
          ls_sort-fieldname = ls_selected_cells-col_id.
          ls_sort-up        = ' '.
          ls_sort-down      = abap_true.

          APPEND ls_sort TO lt_sort.
          CLEAR: ls_sort.
        ENDIF.
      ELSE.
        MESSAGE 'Siralama butonu sadece 1 hücre secerek kullanilabilir' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
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
  IF gt_list IS INITIAL AND gv_flag IS INITIAL.
    SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_list.
  ENDIF.
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

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    gs_fieldcat-fieldname = 'TRAFFIC_LIGHT'.
    gs_fieldcat-col_pos   = 8.
    gs_fieldcat-scrtext_m = 'Bilet Durumu'.
    APPEND gs_fieldcat TO gt_fieldcat.
    CLEAR: gs_fieldcat.

  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM layout.
  gs_layout-zebra      = abap_true.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-sel_mode   = 'A'.
  gs_layout-info_fname = 'ROW_COLOR'.
  gs_layout-ctab_fname = 'CELL_COLOR'.
*  gs_layout-excp_fname = 'TRAFFIC_LIGHT'.
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
        container_name              = 'CC_ALV'
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

    go_alvgrid->set_filter_criteria(
      EXPORTING
        it_filter                 = lt_filter
      EXCEPTIONS
        no_fieldcatalog_available = 1
        OTHERS                    = 2 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->set_sort_criteria(
      EXPORTING
        it_sort                   = lt_sort
      EXCEPTIONS
        no_fieldcatalog_available = 1
        OTHERS                    = 2 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

  ENDIF.
ENDFORM.

FORM open_traffic_lights.

  DATA: ls_list    TYPE gty_list,
        lv_decimal TYPE p DECIMALS 1.

  LOOP AT gt_list INTO ls_list.

    lv_decimal = ls_list-seatsocc / ls_list-seatsmax.

    IF lv_decimal >= ( 80 / 100 ).
*      ls_list-traffic_light = 1. "Kirmizi
      ls_list-traffic_light = '@0A@'. "Kirmizi
    ELSEIF lv_decimal < ( 80 / 100 ) AND lv_decimal >= ( 40 / 100 ).
*      ls_list-traffic_light = 2. "Sari
      ls_list-traffic_light = '@09@'. "Sari
    ELSEIF lv_decimal < ( 40 / 100 ).
*      ls_list-traffic_light = 3. "Yesil
      ls_list-traffic_light = '@08@'. "Yesil
    ENDIF.

    MODIFY gt_list FROM ls_list TRANSPORTING traffic_light WHERE carrid = ls_list-carrid AND
                                                                 connid = ls_list-connid AND
                                                                 fldate = ls_list-fldate.

  ENDLOOP.

ENDFORM.
