*&---------------------------------------------------------------------*
*& Report ZABAP_CM_003
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_003.

DATA : gt_mara TYPE TABLE OF mara,
       gs_mara TYPE mara.

SELECT * FROM mara INTO TABLE gt_mara.

*SELECT SINGLE * FROM mara INTO gs_mara WHERE matnr = 'EWMS4-40'.
*
*
*WRITE :   gs_mara-matnr ,
*        / gs_mara-ersda,
*        / gs_mara-ernam.

*READ TABLE gt_mara INTO gs_mara WITH key matnr = 'EWMS4-40'.

*READ TABLE gt_mara INTO gs_mara INDEX 5.

READ TABLE gt_mara TRANSPORTING NO FIELDS WITH KEY matnr = 'EWMS4-40'.

IF sy-subrc IS INITIAL.

  WRITE :   gs_mara-matnr ,
        / gs_mara-ersda,
        / gs_mara-ernam.

ENDIF.
