*&---------------------------------------------------------------------*
*& Include          ZCM_TEST_81_FORMS
*&---------------------------------------------------------------------*

START-OF-SELECTION.

  PERFORM check_parameters.
  PERFORM selopt_carrid.
  PERFORM selopt_connid.
  PERFORM select_data.
  PERFORM write_data.
*&---------------------------------------------------------------------*
*& Form check_parameters
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM check_parameters .
  IF p_carrid IS INITIAL AND p_connid IS INITIAL.
    MESSAGE TEXT-003 TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form selopt_carrid
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM selopt_carrid .

  IF p_carrid IS NOT INITIAL.
    IF p_inc1 IS NOT INITIAL.
      gs_selopt_carrid-sign = 'I'.
    ELSE.
      gs_selopt_carrid-sign = 'E'.
    ENDIF.

    gs_selopt_carrid-option = 'EQ'.
    gs_selopt_carrid-low    = p_carrid.
    APPEND gs_selopt_carrid TO gt_selopt_carrid.
    CLEAR: gs_selopt_carrid.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form selopt_connid
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM selopt_connid .

  IF p_connid IS NOT INITIAL.
    IF p_inc2 IS NOT INITIAL.
      gs_selopt_connid-sign = 'I'.
    ELSE.
      gs_selopt_connid-sign = 'E'.
    ENDIF.

    gs_selopt_connid-option = 'EQ'.
    gs_selopt_connid-low    = p_connid.
    APPEND gs_selopt_connid TO gt_selopt_connid.
    CLEAR: gs_selopt_connid.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form select_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM select_data .

  SELECT * FROM sflight
     INTO TABLE gt_sflight
          WHERE carrid IN gt_selopt_carrid
            AND connid IN gt_selopt_connid.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form write_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM write_data .

  IF gt_sflight IS NOT INITIAL.

    DESCRIBE TABLE gt_sflight LINES gv_no_lines.
    WRITE: TEXT-004,gv_no_lines.
    SKIP.
    ULINE.

    LOOP AT gt_sflight INTO gs_sflight.

      WRITE : / gs_sflight-carrid,
                gs_sflight-connid,
                gs_sflight-fldate,
                gs_sflight-price,
                gs_sflight-currency,
                gs_sflight-planetype,
                gs_sflight-seatsmax,
                gs_sflight-seatsocc,
                gs_sflight-paymentsum,
                gs_sflight-seatsmax_b,
                gs_sflight-seatsocc_b,
                gs_sflight-seatsmax_f,
                gs_sflight-seatsocc_f.
      CLEAR : gs_sflight.

    ENDLOOP.


  ELSE.

    WRITE : TEXT-005.

  ENDIF.

ENDFORM.
