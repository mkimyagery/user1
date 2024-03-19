*&---------------------------------------------------------------------*
*& Report ZABAP_CM_007
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_007.

DATA : gv_answer TYPE c.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS : p_title TYPE char100,
               p_quest TYPE char100,
               p_but1  TYPE char30,
               p_but2  TYPE char30.
SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  PERFORM popup_confirm
    USING p_title p_quest p_but1 p_but2
 CHANGING gv_answer.

  PERFORM write USING gv_answer.


*&---------------------------------------------------------------------*
*& Form popup_confirm
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_TITLE
*&      --> P_QUEST
*&      --> P_BUT1
*&      --> P_BUT2
*&      <-- GV_ANSWER
*&---------------------------------------------------------------------*
FORM popup_confirm  USING    p_p_title
                             p_p_quest
                             p_p_but1
                             p_p_but2
                    CHANGING p_gv_answer.

  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      titlebar              = p_p_title
      text_question         = p_p_quest
      text_button_1         = p_p_but1
      icon_button_1         = 'ICON_OKAY'
      text_button_2         = p_p_but2
      icon_button_2         = 'ICON_CANCEL'
      default_button        = '2'
      display_cancel_button = ' '
      start_column          = 25
      start_row             = 6
    IMPORTING
      answer                = p_gv_answer
    EXCEPTIONS
      text_not_found        = 1
      OTHERS                = 2.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form write
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GV_ANSWER
*&---------------------------------------------------------------------*
FORM write  USING    p_gv_answer.

  CHECK p_gv_answer IS NOT INITIAL.

  IF p_gv_answer EQ '1'.
    WRITE : 'İlk butona tıkladınız'.
  ELSEIF p_gv_answer EQ '2'.
    WRITE : 'İkinci butona tıkladınız'.
  ENDIF.

ENDFORM.
