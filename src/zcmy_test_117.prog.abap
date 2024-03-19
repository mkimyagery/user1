*&---------------------------------------------------------------------*
*& Report ZCM_TEST_117
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_117.

TYPES : BEGIN OF gty_table ,
          box.
          INCLUDE STRUCTURE zmc_table_001.
TYPES : END OF gty_table.

DATA : gt_table    TYPE TABLE OF gty_table,
       gt_selected TYPE TABLE OF gty_table,
       gs_selected TYPE gty_table,
       gt_fieldcat TYPE slis_t_fieldcat_alv, "TT
       gs_fieldcat TYPE slis_fieldcat_alv,   "Structure
       gt_fcat_sel TYPE slis_t_fieldcat_alv,
       gs_fcat_sel TYPE slis_fieldcat_alv,
       gs_layout   TYPE slis_layout_alv,
       gv_answer   TYPE c LENGTH 1,
       gv_e_mail   TYPE c LENGTH 80.

START-OF-SELECTION.

  PERFORM select_data.
  PERFORM fcat.
  PERFORM layout.
  PERFORM show_alv.

FORM form_117_status USING lt_extab TYPE slis_t_extab.
  SET PF-STATUS 'PF_STATUS_117'.
ENDFORM.

FORM uc_117 USING lv_ucomm    TYPE sy-ucomm
                  ls_selfield TYPE slis_selfield.

  CASE lv_ucomm.
    WHEN 'LEAVE'.
      LEAVE PROGRAM.
    WHEN 'SORT_BY_NAME'.

      SORT gt_table BY name." ASCENDING.
      PERFORM show_alv.
    WHEN '&IC1'.
      IF ls_selfield-fieldname = 'ID'.
        SELECT * FROM zmc_table_001 INTO CORRESPONDING FIELDS OF TABLE gt_selected WHERE id = ls_selfield-value.

        IF gt_fcat_sel IS INITIAL.
          LOOP AT gt_fieldcat INTO gs_fieldcat.
            IF gs_fieldcat-key IS INITIAL AND gs_fieldcat-fieldname NE 'SALARY'.
              gs_fieldcat-edit  = abap_true.
              gs_fieldcat-input = abap_true.
            ENDIF.

            APPEND gs_fieldcat TO gt_fcat_sel.
            CLEAR: gs_fieldcat.
          ENDLOOP.
        ENDIF.

        CALL FUNCTION 'REUSE_ALV_POPUP_TO_SELECT'
          EXPORTING
            i_title               = TEXT-001
            i_screen_start_column = 5
            i_screen_start_line   = 5
            i_screen_end_column   = 80
            i_screen_end_line     = 12
            i_tabname             = 'GT_SELECTED'
            it_fieldcat           = gt_fcat_sel
            i_callback_program    = sy-repid
          IMPORTING
            e_exit                = gv_answer
          TABLES
            t_outtab              = gt_selected
          EXCEPTIONS
            program_error         = 1
            OTHERS                = 2.

        IF gv_answer IS INITIAL.
          READ TABLE gt_selected INTO gs_selected INDEX 1.
          IF sy-subrc IS INITIAL.
            UPDATE zmc_table_001 SET name    = gs_selected-name
                                     surname = gs_selected-surname
                                     job     = gs_selected-job
                                     curr    = gs_selected-curr
                                     gsm     = gs_selected-gsm
                                     e_mail  = gs_selected-e_mail
                                 WHERE id = gs_selected-id.

            PERFORM select_data.
            PERFORM show_alv.
          ENDIF.
        ENDIF.

      ELSEIF ls_selfield-fieldname = 'E_MAIL'.

        CALL FUNCTION 'ZCM_POPUP_GET_E_MAIL'
          IMPORTING
            ev_e_mail = gv_e_mail
            ev_answer = gv_answer.

        IF gv_e_mail IS NOT INITIAL AND gv_answer IS INITIAL.
          UPDATE zmc_table_001 SET   e_mail = gv_e_mail
                               WHERE e_mail = ls_selfield-value.

          PERFORM select_data.
          SORT gt_table BY id.
          PERFORM show_alv.
        ENDIF.

      ENDIF.
*  	WHEN OTHERS.
  ENDCASE.
ENDFORM.

FORM select_data .
  SELECT * FROM zmc_table_001 INTO CORRESPONDING FIELDS OF TABLE gt_table.
ENDFORM.

FORM fcat .
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMC_TABLE_001'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc IS NOT INITIAL.
    EXIT.
  ENDIF.

  LOOP AT gt_fieldcat INTO gs_fieldcat.
    CASE gs_fieldcat-fieldname.
      WHEN 'E_MAIL'.
        gs_fieldcat-hotspot = abap_true.
        MODIFY gt_fieldcat FROM gs_fieldcat TRANSPORTING hotspot WHERE fieldname = 'E_MAIL'.
*    	WHEN .
*    	WHEN OTHERS.
    ENDCASE.

  ENDLOOP.
ENDFORM.

FORM layout.
  gs_layout-zebra              = abap_true.
  gs_layout-colwidth_optimize  = abap_true.
  gs_layout-box_fieldname      = 'BOX'.
ENDFORM.

FORM show_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = sy-repid
      is_layout                = gs_layout
      it_fieldcat              = gt_fieldcat
      i_callback_pf_status_set = 'FORM_117_STATUS'
      i_callback_user_command  = 'UC_117'
    TABLES
      t_outtab                 = gt_table
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
ENDFORM.
