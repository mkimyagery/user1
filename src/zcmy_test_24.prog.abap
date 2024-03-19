*&---------------------------------------------------------------------*
*& Report ZCM_TEST_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_24.

"Success Message (Başarılı)

*DATA : gv_number_01 TYPE n LENGTH 2.
*DATA : gv_number_02 TYPE n LENGTH 2.
*
*gv_number_01 = 70.
*
*IF gv_number_01 > 50.
*  gv_number_02 = gv_number_01 + 10.
*  WRITE: 'gv_number_02', gv_number_02.
*  MESSAGE 'Toplama islemi basari ile gerceklestirildi.' TYPE 'S'.
*ENDIF.

"Information (Bilgi)

*DATA: gv_number TYPE n LENGTH 2.
*
*gv_number = 20.
*
*IF gv_number > 50.
*  MESSAGE 'Girdiğiniz sayı 50''den büyüktür.' TYPE 'I'.
*ELSEIF gv_number = 50.
*  MESSAGE 'Girdiğiniz sayı 50''ye esittir.' TYPE 'I'.
*ELSE.
*  MESSAGE 'Girdiğiniz sayı 50''den kücüktür.' TYPE 'I'.
*ENDIF.

*PARAMETERS : p_txt_01 TYPE c LENGTH 10,
*             p_txt_02 TYPE c LENGTH 10,
*             p_txt_03 TYPE c LENGTH 10.
*
*DATA : gv_text TYPE c LENGTH 10.
*
*gv_text = p_txt_01. "Türkiye
*MESSAGE gv_text TYPE 'I'.
*CLEAR: gv_text.
*
*gv_text = p_txt_02."Almanya
*MESSAGE gv_text TYPE 'I'.
*CLEAR: gv_text.
*
*gv_text = p_txt_03."Hollanda
*MESSAGE gv_text TYPE 'I'.
*CLEAR: gv_text.


"Error Mesaj(Hata Mesajı)

*PARAMETERS : gv_num1 TYPE i,
*             gv_num2 TYPE i.
*
*DATA : gv_result TYPE i.
*
*IF gv_num1 = 0 AND gv_num2 = 0.
*  MESSAGE 'Lütfen alanları doldurunuz!' TYPE 'S' DISPLAY LIKE 'E'.
*ENDIF.
*
*gv_result = gv_num1 + gv_num2.
*WRITE : 'Sonuc:', gv_result.
*ULINE.

"Warning Mesaj
*PARAMETERS : gv_num1 TYPE i,
*             gv_num2 TYPE i.
*
*DATA : gv_result TYPE i.
*
*IF gv_num1 = 0 AND gv_num2 = 0.
*  MESSAGE 'Lütfen alanları doldurunuz!' TYPE 'W' ."DISPLAY LIKE 'E'.
*ENDIF.
*
*gv_result = gv_num1 + gv_num2.
*WRITE : 'Sonuc:', gv_result.

*PARAMETERS : gv_name  TYPE c LENGTH 20,
*             gv_sname TYPE c LENGTH 20.
*
*DATA : gv_fullname TYPE c LENGTH 40.
*
*"is initial boşsa // is not initial doluysa(boş değilse)
*IF gv_name IS INITIAL AND gv_sname IS INITIAL.
*  MESSAGE 'Lütfen her iki alanı da doldurunuz.' TYPE 'A'.
*ENDIF.
*
*CONCATENATE gv_name gv_sname INTO gv_fullname SEPARATED BY space.
*
*WRITE : gv_fullname.

"Exit Mesaj
PARAMETERS : gv_num1 TYPE i,
             gv_num2 TYPE i.

DATA : gv_result TYPE i.

IF gv_num2 = 0.
  MESSAGE 'Yapılması imkansız işlem talebi ile karsılasıldı.' TYPE 'X'.
ENDIF.

gv_result = gv_num1 / gv_num2.

WRITE : 'Sonuc:' ,gv_result.
