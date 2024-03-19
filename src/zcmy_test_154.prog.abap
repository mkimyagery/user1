*&---------------------------------------------------------------------*
*& Report ZCM_TEST_154
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_154.

DATA : go_alvgrid   TYPE REF TO cl_gui_alv_grid,
       go_container TYPE REF TO cl_gui_custom_container,
       gt_fieldcat  TYPE lvc_t_fcat,
       gs_layout    TYPE lvc_s_layo.

TYPES : BEGIN OF gty_list.
          INCLUDE STRUCTURE sflight.
TYPES : END OF gty_list.

DATA : gt_list TYPE TABLE OF gty_list.

START-OF-SELECTION.

  CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'PF_STATUS_150'.
  SET TITLEBAR 'TITLE_150'.

*  PERFORM select_data.
*  PERFORM fcat.
*  PERFORM layout.
*  PERFORM show_alv.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'GERI'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE.
