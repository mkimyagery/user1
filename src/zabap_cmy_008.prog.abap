*&---------------------------------------------------------------------*
*& Report ZABAP_CM_008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_008.

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
*  PARAMETERS : p_text_1 TYPE text40, "c LENGTH 40,
*               p_text_2 TYPE text40, "c LENGTH 40,
*               p_lowr   RADIOBUTTON GROUP xyz,
*               p_uppr   RADIOBUTTON GROUP xyz.
*SELECTION-SCREEN END OF BLOCK a1.
*
*DATA : gv_text TYPE c LENGTH 80.
*
*START-OF-SELECTION.
*
*  IF p_lowr EQ abap_true.
*
**    CALL FUNCTION 'ZCM_FUNCTION_GROUP_NEW2_01'
**      EXPORTING
**        iv_text_01   = p_text_1
**        iv_text_02   = p_text_2
**        iv_lowercase = p_lowr
**      IMPORTING
**        ev_text      = gv_text.
*
*    CONCATENATE p_text_1 p_text_2 INTO gv_text SEPARATED BY space.
*
*    IF p_lowr IS NOT INITIAL.
*      TRANSLATE gv_text TO LOWER CASE.
*    ENDIF.
*
*
*  ELSEIF p_uppr EQ abap_true.
*
*    CALL FUNCTION 'ZCM_FM_02'
*      EXPORTING
*        iv_text_01   = p_text_1
*        iv_text_02   = p_text_2
*        iv_uppercase = p_uppr
*      IMPORTING
*        ev_text      = gv_text.
*
*  ENDIF.
*
*
*  WRITE : gv_text.


DATA : gv_sayi TYPE n LENGTH 5.

gv_sayi = 00045.


CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
  EXPORTING
    input  = gv_sayi
  IMPORTING
    output = gv_sayi.

BREAK user1.

CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
  EXPORTING
    input  = gv_sayi
  IMPORTING
    output = gv_sayi.

BREAK user1.
