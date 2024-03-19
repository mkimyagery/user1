*&---------------------------------------------------------------------*
*& Report ZCM_TEST_191
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_191.

"Comparison Operatörlerinde kullanılabilcek tipler : C N D ve T

"CO ( Contains Only)

DATA : gv_1 TYPE c LENGTH 3 VALUE '100',
       gv_2 TYPE c LENGTH 3 VALUE '10A',
       gv_3 TYPE c LENGTH 3 VALUE '200',
       gv_4 TYPE c LENGTH 3 VALUE '$4%'.


IF gv_1 CO '0123456789'.
  WRITE : 'gv_1 degiskeni ile matematiksel islem yapılabilir.'.
ELSE.
  WRITE : 'gv_1 degiskeni ile matematiksel islem yapılamaz.'.
ENDIF.

IF gv_2 CO '0123456789'.
  WRITE : / 'gv_2 degiskeni ile matematiksel islem yapılabilir.'.
ELSE.
  WRITE : / 'gv_2 degiskeni ile matematiksel islem yapılamaz.'.
ENDIF.

IF gv_3 CO '0123456789'.
  WRITE : / 'gv_3 degiskeni ile matematiksel islem yapılabilir.'.
ELSE.
  WRITE : / 'gv_3 degiskeni ile matematiksel islem yapılamaz.'.
ENDIF.

IF gv_4 CO '0123456789'.
  WRITE : / 'gv_4 degiskeni ile matematiksel islem yapılabilir.'.
ELSE.
  WRITE : / 'gv_4 degiskeni ile matematiksel islem yapılamaz.'.
ENDIF.

DATA : lv_str1 TYPE string,
       lv_str2 TYPE string.

lv_str1 = 'abap programming'.
lv_str2 = 'Abap Programming For Beginners'.

IF lv_str1 CO lv_str2.
  WRITE : / 'ABAP_TRUE'.
ELSE.
  WRITE : / 'ABAP_FALSE'.
ENDIF.
