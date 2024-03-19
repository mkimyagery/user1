*&---------------------------------------------------------------------*
*& Report ZCM_TEST_23
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_23.

**PARAMETERS : p_buyuk TYPE string,
**             p_kucuk TYPE string.
**
***p_value = 'Aşağıdaki değerleri doldurunuz!'.
**
**TRANSLATE p_buyuk TO UPPER CASE."Büyük
**TRANSLATE p_kucuk TO LOWER CASE."küçük
**
**WRITE :  p_buyuk ,
**       / p_kucuk.

*PARAMETERS : p_deger1 TYPE i,
*             p_deger2 TYPE i.
*
*DATA : gv_toplam TYPE i.
*
*gv_toplam = p_deger1 + p_deger2.
*
*WRITE : gv_toplam.
*ULINE.

**********************************************************************
"NE(Not Equal) = eşit değil // EQ(Equal) = Eşittir.  <>= eşit değildir
**********************************************************************

*PARAMETERS : p_deger3 TYPE i,
*             p_deger4 TYPE i.
*
*DATA : gv_bolme TYPE i.
*
*IF p_deger4 = 0.
*  WRITE : 'Bölen ifadesi sıfır olamaz!!!'.
*  ULINE.
*ELSE.
*  gv_bolme = p_deger3 / p_deger4.
*  WRITE : gv_bolme.
*  ULINE.
*ENDIF.
*
*IF p_deger4 NE 0.
*  gv_bolme = p_deger3 / p_deger4.
*  WRITE : gv_bolme.
*  ULINE.
*ELSE.
*  WRITE : 'Bölen ifadesi sıfır olamaz!!!'.
*  ULINE.
*ENDIF.
**********************************************************************

*PARAMETERS : p_deger5 TYPE i,
*             p_deger6 TYPE i,
*             p_islem  TYPE c LENGTH 1.
*
*DATA : gv_sonuc TYPE i.
*
*IF p_islem EQ '*'.
*  gv_sonuc = p_deger5 * p_deger6.
*
*ELSEIF p_islem EQ '/'.
*  gv_sonuc = p_deger5 / p_deger6.
*
*ELSEIF p_islem EQ '+'.
*  gv_sonuc = p_deger5 + p_deger6.
*
*ELSEIF p_islem EQ '-'.
*  gv_sonuc = p_deger5 - p_deger6.
*
*ENDIF.
*
*WRITE : gv_sonuc.
*ULINE.

"Alıştırma 5ve6
*PARAMETERS: p_text1 TYPE string,
*            p_old   TYPE string,
*            p_new   TYPE string.
*
*PARAMETERS: p_rdb1 RADIOBUTTON GROUP ac,
*            p_rdb2 RADIOBUTTON GROUP ac.
*
*DATA gv_text TYPE string.
*
*IF p_rdb1 EQ abap_true."Abap_true eşittir X Hangisi işaretli
*
*  gv_text = p_text1.
*
*  REPLACE ALL OCCURRENCES OF p_old IN gv_text WITH p_new. " MEALİ :  p_old parametresininde BULUNAN DEĞERİ gv_text İÇİNE p_new ile DEĞİŞTİRİP yaz.
*
*  WRITE: / 'Orijinal Metin:', p_text1,
*         / 'Değiştirilen Kelime:', p_old,
*         / 'Yeni Kelime:', p_new,
*         / 'Değiştirilen Metin:', gv_text.
*
*ELSEIF p_rdb2  EQ abap_true.
*
*  gv_text = p_text1.
*
*  REPLACE ALL OCCURRENCES OF p_old IN gv_text WITH p_new. " MEALİ :  p_old parametresininde BULUNAN DEĞERİ gv_text İÇİNE p_new ile DEĞİŞTİRİP yaz.
*
*  WRITE: / 'Orijinal Metin:', p_text1,
*         / 'Değiştirilen Kelime:', p_old,
*         / 'Yeni Kelime:', p_new,
*         / 'Değiştirilen Metin:', gv_text.
*
*ENDIF.

**********************************************************************
**********************************************************************
**********************************************************************
"Alıştırma 7

*PARAMETERS : p_text1 TYPE string,
*             p_text2 TYPE string.
*
*DATA : gv_name TYPE string.
*
*CONCATENATE p_text1 p_text2 INTO gv_name SEPARATED BY space.
*WRITE : gv_name.

**********************************************************************
**********************************************************************
"Alıştırma 8

*PARAMETERS : p_value1 TYPE string,
*             p_value2 TYPE string."Char size harfler büyük olarak geliyor
*
*DATA : gv_value TYPE string.
*
*CONDENSE : p_value1 , p_value2.
*
*CONCATENATE p_value1 p_value2 INTO gv_value SEPARATED BY space.
*WRITE : gv_value.

**********************************************************************
**********************************************************************
"Alıştırma 9
*PARAMETERS : p_value1 TYPE string,
*             p_value2 TYPE string.
*
*SEARCH p_value1 FOR p_value2 .
*
*IF sy-subrc EQ 0.
*  WRITE : 'Sonuc Olumlu'.
*ELSE.
*  WRITE : 'Sonuc Bulunamadı'.
*ENDIF.

**********************************************************************
**********************************************************************
"Alıştırma 10
*PARAMETERS : p_deger1 TYPE string, "Sayısal değer girilebilir.
*             p_deger2 TYPE string,
*
*             p_rdb1   RADIOBUTTON GROUP ac,
*             p_rdb2   RADIOBUTTON GROUP ac.
*
*SEARCH p_deger1 FOR p_deger2 .
*
*IF sy-subrc EQ 0.
*
*  IF p_rdb1 EQ abap_true.
*    SHIFT p_deger1 RIGHT UP TO p_deger2.
*  ELSEIF p_rdb2 EQ abap_true.
*    SHIFT p_deger1 LEFT UP TO p_deger2.
*  ENDIF.
*
*ELSE.
*
*  WRITE : 'Sonuc olumsuz'.
*ENDIF.

**********************************************************************
**********************************************************************
"Alıştırma 11
*PARAMETERS : p_values TYPE string.
*
*DATA : gv_lenght TYPE i.
*
*gv_lenght = strlen( p_values ).
*
*IF gv_lenght > 5 .
*  MESSAGE 'Girdiğiniz değer uzunluğu 5ten büyüktür.' type 'I'.
*ELSE.
*  WRITE : gv_lenght.
*ENDIF.


**********************************************************************
**********************************************************************
*"Alıştırma 12
*
PARAMETERS : p_name  TYPE string,
             p_sname TYPE string,
             p_city  TYPE string,

             p_gmail RADIOBUTTON GROUP ac1,
             p_html  RADIOBUTTON GROUP ac1,
             p_yaho  RADIOBUTTON GROUP ac1.


DATA : gv_mail TYPE string.

IF p_gmail EQ abap_true.

  CONCATENATE p_name p_sname p_city '@' 'gmail.com' INTO gv_mail.

ELSEIF p_html EQ abap_true.

  CONCATENATE p_name p_sname p_city '@' 'hotmail.com' INTO gv_mail.

ELSEIF p_yaho EQ abap_true.

  CONCATENATE p_name p_sname p_city '@' 'yahoo.com' INTO gv_mail.

ENDIF.

WRITE : gv_mail.
ULINE.

**********************************************************************
**********************************************************************
*"Alıştırma 13

**********************************************************************
**********************************************************************
*"Alıştırma 14

**********************************************************************
**********************************************************************
*"Alıştırma 15
