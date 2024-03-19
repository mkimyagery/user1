*&---------------------------------------------------------------------*
*& Report ZCM_TEST_77
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_77.

SELECTION-SCREEN BEGIN OF BLOCK alp WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS : p_num_01 TYPE i,
               p_num_02 TYPE i,
               p_topla  RADIOBUTTON GROUP xyz,
               p_cikar  RADIOBUTTON GROUP xyz,
               p_carp   RADIOBUTTON GROUP xyz,
               p_bol    RADIOBUTTON GROUP xyz.
SELECTION-SCREEN END OF BLOCK alp.

DATA : gv_kontrol_ok TYPE c LENGTH 1,
       gv_sonuc      TYPE p DECIMALS 2.

START-OF-SELECTION.

  PERFORM kontrol.

  IF p_topla = abap_true.
    PERFORM toplama.
  ELSEIF p_cikar = abap_true.
    PERFORM cikarma.
  ELSEIF p_carp = abap_true.
    PERFORM carpma.
  ELSEIF p_bol  = abap_true.

    IF gv_kontrol_ok = abap_true.
      PERFORM bolme.
    ELSE.
      MESSAGE TEXT-002 TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.

  ENDIF.

  WRITE : gv_sonuc.

*&---------------------------------------------------------------------*
*& Form kontrol
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM kontrol .
  IF p_bol IS NOT INITIAL.
    IF p_num_02 EQ 0.
      gv_kontrol_ok = abap_false.
    ELSE.
      gv_kontrol_ok = abap_true.
    ENDIF.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form toplama
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM toplama .
  gv_sonuc = p_num_01 + p_num_02.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form cikarma
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM cikarma .
  gv_sonuc = p_num_01 - p_num_02.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form carpma
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM carpma .
  gv_sonuc = p_num_01 * p_num_02.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form bolme
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM bolme .
  gv_sonuc = p_num_01 / p_num_02.
ENDFORM.
