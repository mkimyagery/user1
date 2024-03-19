*&---------------------------------------------------------------------*
*& Report ZCM_TEST_34
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_34.

"Satırlar, içerisinde birden fazla değişkeni yan yana tutabilen objelerdir.

"2 türlü tanımlama yöntemi var ;
"1: tip tanımla , tipi referans göster ,
"2: Data içerisinde begin of ile tanımla .

**TYPES : BEGIN OF ty_structure,
**          name    TYPE c LENGTH 40,
**          surname TYPE c LENGTH 40,
**        END OF ty_structure.
**
**DATA : gs_structure TYPE ty_structure,
**       gt_table     TYPE TABLE OF ty_structure.
**
**DATA : BEGIN OF gs_structure2,
**         name    TYPE c LENGTH 40,
**         surname TYPE c LENGTH 40,
**       END OF gs_structure2.
**
**DATA : gt_table2 LIKE TABLE OF gs_structure2.
**
**IF 1 = 1.
**  BREAK-POINT.
**ENDIF.
***DATA : gt_table2 TYPE TABLE OF gs_structure2.X Kullanılamıyor.
**********************************************************************
