*&---------------------------------------------------------------------*
*& Report ZCM_TEST_255
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_255." MESSAGE-ID zcm_msg_class_2.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS : p_basari RADIOBUTTON GROUP abc,
               p_hata   RADIOBUTTON GROUP abc,
               p_uyari  RADIOBUTTON GROUP abc,
               p_bilgi  RADIOBUTTON GROUP abc.

SELECTION-SCREEN END OF BLOCK a1.

"&1 &2 &3 &4

DATA : go_msg_types_cm TYPE REF TO zmessage_types_cm2.

START-OF-SELECTION.

**********************************************************************3.

*  CALL FUNCTION 'ZCM_FUNCTION_MSG2'
*    EXPORTING
*      iv_success     = p_basari
*      iv_error       = p_hata
*      iv_warning     = p_uyari
*      iv_information = p_bilgi.


**********************************************************************2.

**  CREATE OBJECT go_msg_types_cm.
**
**  go_msg_types_cm->show_message(
**    EXPORTING
**      iv_succes      = p_basari
**      iv_error       = p_hata
**      iv_warning     = p_uyari
**      iv_information = p_bilgi  ).

**********************************************************************1.

**  IF p_basari = abap_true.
**
***    MESSAGE s011(zcm_msg_class_1) WITH '1' 'SUCCESS'.
**    MESSAGE s011 WITH '1' 'SUCCESS' .
**
**  ELSEIF p_hata = abap_true.
**
    MESSAGE s011(zcm_msg_class_2) WITH '2' 'ERROR' DISPLAY LIKE 'E'.
**    MESSAGE e011 WITH '2' 'ERROR'.
**
**  ELSEIF p_uyari = abap_true.
**
***    MESSAGE w011(zcm_msg_class_2) WITH '3' 'WARNING'.
**    MESSAGE w011 WITH '3' 'WARNING'.
**
**  ELSEIF p_bilgi = abap_true.
**
***    MESSAGE i011(zcm_msg_class_2) WITH '4' 'INFORMATION'.
**    MESSAGE i011 WITH '4' 'INFORMATION'.
**
**  ENDIF.
