*&---------------------------------------------------------------------*
*& Report ZCM_TEST_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_10.

"Constant Komutu

CONSTANTS : gc_city   TYPE c LENGTH 10 VALUE 'ISTANBUL',
            gc_user   TYPE string VALUE 'USER_01',
            gc_number TYPE i VALUE 1903,
            gc_numnum TYPE n LENGTH 5 VALUE 123,
            gc_date   TYPE d VALUE '20231128',
            gc_time   TYPE t VALUE '200000',
            gc_pnum   TYPE p DECIMALS 4 VALUE '120.1234'.

WRITE : gc_city,
      / gc_user,
      / gc_number,
      / gc_numnum,
      / gc_date,
      / gc_time,
      / gc_pnum.
