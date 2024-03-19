*&---------------------------------------------------------------------*
*& Report ZABAP_CM_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_001.


*WRITE : 'Merhaba.Tekrar Hoşgeldiniz.'.
*WRITE : /'Alpaslan CENGİZ'.
*ULINE.
*SKIP.
*
*WRITE : /'Herkese Başarılar.'.

*DATA : lv_variable(15) TYPE c,
*       lv_data         TYPE c LENGTH 10,
*       lv_int          TYPE i VALUE 50,
*       lv_date         TYPE d VALUE '20230413',
*       lv_variable2    LIKE lv_variable,
*       lv_packed       TYPE p LENGTH 3 DECIMALS 2.
*
*CONSTANTS : lc_int2      TYPE i VALUE '50',
*            lc_int3      LIKE lc_int2 VALUE 60,
*            lc_variable3 TYPE c LENGTH 4 VALUE 'test'.
*
*" = veya EQ
*"Farklı <> veya  NE
*"kücük esit <= veya LE
*"kücük < ve LT
*"buyuk esit >= veya GE
*"buyuk > veya GT
*
*START-OF-SELECTION.
*
*  lv_variable = 'Eren'.


*  lv_int = 35.
*  lv_variable2 = 'Karayel'.
*  lv_packed = '11.11'.
**  lc_variable3 = 'AAAA'.
*  CLEAR : lv_date.
*
*  WRITE : / 'Adı:' , lv_variable.
*  WRITE : / 'Soyadı:' , lv_variable2.
*  WRITE : / 'İnt:' , lv_int.
*  WRITE : / 'Package:' , lv_packed.
*
*  BREAK-POINT.
*
*DATA : lv_str1  TYPE string VALUE 'Alpaslan',
*       lv_str2  TYPE string VALUE 'Cengiz',
*       lv_tarih TYPE datum,
*       lv_sayim TYPE i,
*       lv_saat  TYPE uzeit,
*       lv_sonuc TYPE string.
*
*"Concatenate
*
*CONCATENATE lv_str1 lv_str2 INTO lv_sonuc.
*WRITE : 'Concatenate :' , lv_sonuc.
*
*CONCATENATE lv_str1 lv_str2 INTO lv_sonuc SEPARATED BY space.
*WRITE : / 'Concatenate + space :' , lv_sonuc.
*
*
*lv_tarih = sy-datum.
*lv_saat = sy-uzeit.
*
*CLEAR: lv_sonuc.
*
*CONCATENATE lv_tarih+6(2) lv_tarih+4(2) lv_tarih(4) INTO lv_sonuc SEPARATED BY '-'.
*WRITE : / 'Tarih Concatenate :' , lv_sonuc.
*
*CLEAR lv_sonuc.
*
*CONCATENATE lv_saat+0(2) lv_saat+2(2) lv_saat+4(2) INTO lv_sonuc SEPARATED BY '/'.
*WRITE : / 'Saat Concatenate :' , lv_sonuc.
*
*CLEAR lv_sonuc.
*
*lv_sonuc = '    Eren  Alparslan   Mustafa    ' .
*CONDENSE  lv_sonuc.
*
*WRITE: / 'Condence :' , lv_sonuc.
*
*CLEAR lv_sonuc.
*
*
*CONDENSE   lv_sonuc NO-GAPS.
*WRITE: / 'Condence with no-Gaps:' , lv_sonuc.
*
*CLEAR lv_sonuc.
*
*lv_sonuc = '12345678900011'.
*lv_sayim = strlen( lv_sonuc ).
*WRITE: / 'STRLEN Komutu :', lv_sayim.
*CLEAR: lv_sonuc.

*lv_sonuc = 'alpaslan.cengiz.ornek1'.
*REPLACE ALL OCCURRENCES OF '.' IN lv_sonuc WITH '-'.
*WRITE: / 'REPLACE Komutu :', lv_sonuc.

*REPLACE FIRST OCCURRENCE OF '.' IN lv_sonuc WITH '-'.
*WRITE: / 'REPLACE Komutu :', lv_sonuc.
*
*CLEAR: lv_sonuc.
*
*lv_sonuc = 'Zübeyde Öncü'.
*SEARCH lv_sonuc FOR 'zübeyde'.
*WRITE: / 'Search' , sy-subrc.
*
*ULINE.
*CLEAR: lv_sonuc.
*lv_sonuc = 'Zübeyde Öncü'.
*SEARCH lv_sonuc FOR 'mehlika'.
*WRITE: / 'Search' , sy-subrc.
*
*CLEAR: lv_sonuc.
*lv_sonuc = '12345'.
*SHIFT lv_sonuc RIGHT UP TO '3'.
*WRITE: / 'Shift:', lv_sonuc.
*
*CLEAR: lv_sonuc.
*lv_sonuc = '12345'.
*SHIFT lv_sonuc LEFT UP TO '3'.
*WRITE: / 'Shift:', lv_sonuc.
*
*CLEAR: lv_sonuc.
*lv_sonuc = '12345666666'.
*SHIFT lv_sonuc RIGHT DELETING TRAILING  '6'.
*WRITE: / 'Shift:', lv_sonuc.
*
*CLEAR: lv_sonuc.
*lv_sonuc = '000012345666666'.
*SHIFT lv_sonuc LEFT DELETING LEADING  '0'.
*WRITE: / 'Shift:', lv_sonuc.
*
*CLEAR : lv_str1 , lv_str2, lv_sonuc.
*
*lv_sonuc = 'Duran:Aydın'.
*
*SPLIT lv_sonuc AT ':' INTO lv_str1 lv_str2.
*
*WRITE : / 'SPLIT-1 :' , lv_str1,
*        / 'SPLIT-2 :' , lv_str2.
*
*CLEAR : lv_str1 , lv_str2, lv_sonuc.
*
*lv_sonuc = 'Duran Aydın'.
*
*SPLIT lv_sonuc AT ' ' INTO lv_str1 lv_str2.
*
*WRITE : / 'SPLIT-1 :' , lv_str1,
*        / 'SPLIT-2 :' , lv_str2.
*
*CLEAR : lv_str1 , lv_str2, lv_sonuc.
*
*lv_sonuc = 'Duran Aydın'.
*
*SPLIT lv_sonuc AT space INTO lv_str1 lv_str2.
*
*WRITE : / 'SPLIT-1 :' , lv_str1,
*        / 'SPLIT-2 :' , lv_str2.
*
*CLEAR : lv_str1 , lv_str2, lv_sonuc.
*
*lv_sonuc = 'Duran Aydın Salih'.
*
*SPLIT lv_sonuc AT space INTO lv_str1 lv_str2.
*
*WRITE : / 'SPLIT-1 :' , lv_str1,
*        / 'SPLIT-2 :' , lv_str2.
*
*CLEAR lv_sonuc.
*
*lv_sonuc = 'Güllü Ipek'.
*TRANSLATE lv_sonuc TO LOWER CASE.
*WRITE : /'translate:' , lv_sonuc.
*
*CLEAR lv_sonuc.
*
*lv_sonuc = 'güllü Ipek'.
*TRANSLATE lv_sonuc TO UPPER CASE.
*WRITE : /'translate:' , lv_sonuc.
*
*
*CLEAR lv_sonuc.
*
*lv_sonuc = 'güllü Ipek'.
*TRANSLATE lv_sonuc USING 'üEpB'.
*WRITE : /'translate:' , lv_sonuc.




*SELECT FROM t000
*  FIELDS ROW_NUMBER( ) OVER( ORDER BY mandt ) AS row_count,
*  t000~mandt
*  ORDER BY mandt INTO TABLE @DATA(table).


*SELECT FROM vbak
*  FIELDS ROW_NUMBER( ) OVER( ORDER BY vbeln ) AS row_count,
*  vbak~vbeln
*  ORDER BY vbeln
*  INTO TABLE @DATA(gt_vbak).
*
*  BREAK-POINT.
