*&---------------------------------------------------------------------*
*& Report ZABAP_CM_005
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_005.

*TABLES : mara,sflight.

*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
*Çerçeveye no ıntervals eklenirse tüm aralıkların ikincisi ortadan kalkar!
*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
*  SELECT-OPTIONS : s_matnr FOR mara-matnr  NO INTERVALS, "Malzeme
*                   s_mtart FOR mara-mtart,               "Malzeme Türü
*                   s_matkl FOR mara-matkl.               "Mal Grubu
*SELECTION-SCREEN END OF BLOCK b1.

*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
*"radio butonu oluşturarak 2 seçenek arasından birini seçmesi beklenir
*PARAMETERS: r_yes RADIOBUTTON GROUP r1,
*r_no RADIOBUTTON GROUP r1 DEFAULT 'X'.
*"iki parametre arasına boş satır ekleme
*SELECTION-SCREEN SKIP 1.
*"checkbox ile seçim yaptırma
*PARAMETERS: c_smail AS CHECKBOX DEFAULT 'X'.
*"iki parametre arasına boş satır ekleme
*SELECTION-SCREEN SKIP 1.
*"listbox oluşturma
*PARAMETERS: pl_carr TYPE sflight-carrid
*AS LISTBOX VISIBLE LENGTH 20 DEFAULT 'AA' OBLIGATORY.
*SELECTION-SCREEN END OF BLOCK b2.

*DATA : gv_var TYPE i.
*
*DO.
*
*  gv_var = gv_var + 2. " 0 = 0 + 2 -->
**  gv_var = 21.
*  IF gv_var > 21.
*    EXIT.
*  ENDIF.
*
*ENDDO.
*
*WRITE : gv_var.

PARAMETERS : p_num1 TYPE i.

DATA : gv_counter TYPE n LENGTH 3,
       gv_msg     TYPE string.

IF p_num1 >= 500.
  MESSAGE '500den daha küçük bir sayı giriniz!' TYPE 'S' DISPLAY LIKE 'E'.
  exit.
ENDIF.

WHILE p_num1 < 500 .

  p_num1 = p_num1 + 10.
  gv_counter = gv_counter + 1.

ENDWHILE.

SHIFT gv_counter LEFT DELETING LEADING '0'.
CONCATENATE TEXT-002 gv_counter TEXT-003 INTO gv_msg SEPARATED BY space.

MESSAGE gv_msg TYPE 'I'.


*PARAMETERS : p_day TYPE n.
*
*DATA : gv_day TYPE string,
*       gv_msg TYPE string.
*
*
*IF p_day BETWEEN 1 AND 7.
*
*  CASE p_day.
*    WHEN 1.
*      gv_day = 'Pazartesi'.
*    WHEN 2.
*      gv_day = 'Salı'.
*    WHEN 3.
*      gv_day = 'Çarşamba'.
*    WHEN 4.
*      gv_day = 'Perşembe'.
*    WHEN 5.
*      gv_day = 'Cuma'.
*    WHEN 6.
*      gv_day = 'Cumartesi'.
*    WHEN 7.
*      gv_day = 'Pazar'.
*  ENDCASE.
*
*  WRITE : 'Girilen gün adı :' , gv_day.
*
*ELSE.
*  MESSAGE '1 ile 7 arasında bir rakam giriniz!' TYPE 'S' DISPLAY LIKE 'E'.
*ENDIF.
