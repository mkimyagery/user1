*&---------------------------------------------------------------------*
*& Report ZCM_TEST_57
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_57.
"Update

DATA : gs_structure TYPE zcm_table_001,
       gt_table     TYPE TABLE OF zcm_table_001.

START-OF-SELECTION.

  UPDATE zcm_table_001 SET salary = 6000
                           curr   = 'USD'
                     WHERE id     = '20240005'.
*                       and name   = 'NEVZAT'.

  SELECT * FROM zcm_table_001 INTO TABLE gt_table.

  CLEAR: gs_structure.

  READ TABLE gt_table INTO gs_structure WITH KEY id = '20240005'.
  IF sy-subrc EQ 0.
    WRITE : gs_structure-id , gs_structure-name  , gs_structure-surname,
            gs_structure-job, gs_structure-salary, gs_structure-curr,
            gs_structure-gsm, gs_structure-e_mail.
    CLEAR : gs_structure.
  ENDIF.
