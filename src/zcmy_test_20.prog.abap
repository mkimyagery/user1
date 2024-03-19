*&---------------------------------------------------------------------*
*& Report ZCM_TEST_20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_20.

PARAMETERS : p_text   TYPE c LENGTH 20,
             p_numc   TYPE n LENGTH 6,
             p_intgr  TYPE i,
             p_dec    TYPE p DECIMALS 4,
             p_string TYPE string,
             p_date   TYPE d,
             p_time   TYPE t.

WRITE :  p_text ,
       / p_numc ,
       / p_intgr,
       / p_dec  ,
       / p_string,
       / p_date  ,
       / p_time.

"condense
