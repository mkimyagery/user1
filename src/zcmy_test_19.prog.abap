*&---------------------------------------------------------------------*
*& Report ZCM_TEST_19
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_19.

"CONCATENATE
*DATA : gv_ad       TYPE string,
*       gv_soyad    TYPE string,
*       gv_ad_soyad TYPE string.
*
*gv_ad    = 'Alpaslan'.
*gv_soyad = 'Cengiz'.
*
*CONCATENATE gv_ad gv_soyad INTO gv_ad_soyad SEPARATED BY space.
*
*WRITE : 'Ad Soyad :' , gv_ad_soyad.


"CONDENSE
*DATA : gv_text TYPE c LENGTH 50.
*
*gv_text = '    Sampiyon   BESIKTAS  '.
*
*CONDENSE gv_text.
*
*WRITE : gv_text.
*
*CONDENSE gv_text NO-GAPS.
*
*WRITE : / gv_text.


"REPLACE

*DATA : gv_city1 TYPE string,
*       gv_city2 TYPE string.
*
*gv_city1 = 'Manisa'.
*gv_city2 = 'İstanbul'.
*
*REPLACE ALL OCCURRENCES OF 'M' IN gv_city1 WITH 'N'.
*REPLACE ALL OCCURRENCES OF 'b' IN gv_city2 WITH 'K'.
*
*WRITE : gv_city1,
*      / gv_city2.


"SEARCH
*DATA : gv_atasozu TYPE string.
*
*gv_atasozu = 'Uzum uzume baka baka kararır.'.
*
*SEARCH gv_atasozu FOR 'kara'.
*
*WRITE: sy-subrc , 'Sonuc Olumlu'.

"SHIFT
*DATA : gv_text_01 TYPE string,
*       gv_text_02 TYPE string,
*       gv_text_03 TYPE string,
*       gv_text_04 TYPE string.
*
*gv_text_01 = '9876543210'.
*gv_text_02 = '9876543210'.
*gv_text_03 = '98765000000'.
*gv_text_04 = '00000098765'.
*
*SHIFT gv_text_01 RIGHT UP TO '43'.
*WRITE: gv_text_01.
*SKIP.
*
*SHIFT gv_text_02 LEFT UP TO '32'.
*WRITE: gv_text_02.
*SKIP.
*
*SHIFT gv_text_03 RIGHT DELETING TRAILING '0'.
*WRITE: gv_text_03.
*SKIP.
*
*SHIFT gv_text_04 LEFT DELETING LEADING '0'.
*WRITE: gv_text_04.
*SKIP.


"SPLIT
*DATA : gv_text  TYPE string,
*       gv_word1 TYPE string,
*       gv_word2 TYPE string,
*       gv_word3 TYPE string,
*       gv_word4 TYPE string,
*       gv_word5 TYPE string.
*
*gv_text = 'Bugün günlerden perşembe hava yağmurlu'.
*
*SPLIT gv_text AT space INTO gv_word1
*                            gv_word2
*                            gv_word3
*                            gv_word4
*                            gv_word5.
*
*WRITE : gv_word1,
*      / gv_word2,
*      / gv_word3,
*      / gv_word4,
*      / gv_word5.


"STRLEN

*DATA : gv_text   TYPE string,
*       gv_lenght TYPE i.
*
*gv_text = 'manisa ege bölgesindedir.'.
*
*gv_lenght = strlen( gv_text ).
*
*WRITE : 'Text' , gv_lenght, 'uzunluğundadır.'.

"TRANSLATE
*DATA : gv_text1 TYPE string,
*       gv_text2 TYPE string,
*       gv_text3 TYPE string.
*
*
*gv_text1 = 'lenovo pc'.
*gv_text2 = 'CASPER PC'.
*gv_text3 = 'AsUs pC'.
*
*TRANSLATE gv_text1 TO UPPER CASE.
*WRITE: gv_text1.
*SKIP.
*
*TRANSLATE gv_text2 TO LOWER CASE .
*WRITE: gv_text2.
*SKIP.
*
*TRANSLATE gv_text3 TO LOWER CASE .
*WRITE: gv_text3.
*SKIP.
*
*TRANSLATE gv_text3 TO UPPER CASE .
*WRITE: gv_text3.
*SKIP.
