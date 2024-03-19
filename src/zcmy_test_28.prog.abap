*&---------------------------------------------------------------------*
*& Report ZCM_TEST_28
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_28.
"Case-Endcase

PARAMETERS : p_day TYPE n.

DATA : gv_day TYPE string,
       gv_msg TYPE string.

CASE p_day.
  WHEN 1.
    gv_day = 'Pazartesi'.
  WHEN 2.
    gv_day = 'Salı'.
  WHEN 3.
    gv_day = 'Çarşamba'.
  WHEN 4.
    gv_day = 'Perşembe'.
  WHEN 5.
    gv_day = 'Cuma'.
  WHEN 6.
    gv_day = 'Cumartesi'.
  WHEN 7.
    gv_day = 'Pazar'.
  WHEN OTHERS.
    MESSAGE TEXT-001 TYPE 'S' DISPLAY LIKE 'E'.
ENDCASE.

IF p_day BETWEEN 1 AND 7.
  CONCATENATE TEXT-002 gv_day INTO gv_msg SEPARATED BY space.
  MESSAGE gv_msg TYPE 'I'.
ENDIF.

*IF p_day EQ 1.
*gv_day = 'Pazartesi'.
*  CONCATENATE TEXT-002 gv_day INTO gv_msg SEPARATED BY space.
*  MESSAGE gv_msg TYPE 'I'.
*ELSEIF p_day EQ 2.
*gv_day = 'Salı'.
*  CONCATENATE TEXT-002 gv_day INTO gv_msg SEPARATED BY space.
*  MESSAGE gv_msg TYPE 'I'.
*ENDIF.
*CONCATENATE TEXT-002 gv_day INTO gv_msg SEPARATED BY space.
*MESSAGE gv_msg TYPE 'I'.
