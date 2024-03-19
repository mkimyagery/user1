*&---------------------------------------------------------------------*
*& Report ZCM_TEST_56
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_56.
"İnsert

DATA : gs_structure TYPE zcm_table_001,
       gt_table     TYPE TABLE OF zcm_table_001.

START-OF-SELECTION.

  gs_structure-id      = '20240005'.
  gs_structure-name    = 'NEVZAT'.
  gs_structure-surname = 'DEGIRMENCI'.
  gs_structure-job     = 'CONSULTANT'.
  gs_structure-salary  = 5000.
  gs_structure-curr    = 'EUR'.
  gs_structure-gsm     = '+491231239871'.
  gs_structure-e_mail  = 'NEVZATDEGIRMENCI@GMAIL.COM'.

  INSERT zcm_table_001 FROM gs_structure.
  CLEAR: gs_structure.

  SELECT * FROM zcm_table_001 INTO TABLE gt_table.

  LOOP AT gt_table INTO gs_structure.
    WRITE : gs_structure-id , gs_structure-name  , gs_structure-surname,
            gs_structure-job, gs_structure-salary, gs_structure-curr,
            gs_structure-gsm, gs_structure-e_mail.
    CLEAR : gs_structure.
    SKIP.
    ULINE.
  ENDLOOP.
