*&---------------------------------------------------------------------*
*& Report ZCM_TEST_21
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_21.
"Radiobutton ve Checkbox(gruplandırmaya gerek yok)

PARAMETERS : p_rbd_01 RADIOBUTTON GROUP abc,
             p_rbd_02 RADIOBUTTON GROUP abc,
             p_rbd_03 RADIOBUTTON GROUP abc,
             p_rbd_04 RADIOBUTTON GROUP xyz,
             p_rbd_05 RADIOBUTTON GROUP xyz,
             p_rbd_06 RADIOBUTTON GROUP xyz,
             p_cbx_01 AS CHECKBOX,
             p_cbx_02 AS CHECKBOX,
             p_cbx_03 AS CHECKBOX.
