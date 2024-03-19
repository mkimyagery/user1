*&---------------------------------------------------------------------*
*& Report ZABAP_CM_021
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_021.

DATA : gv_1     TYPE c LENGTH 3 VALUE '100',
       gv_2     TYPE c LENGTH 3 VALUE '10A',
       gv_3     TYPE c LENGTH 3 VALUE '200',
       gv_4     TYPE c LENGTH 3 VALUE '$4%',
       gv_5     TYPE c LENGTH 3 VALUE 'ABC',
       gv_text1 TYPE string VALUE 'Tükenmez Kalem',
       gv_text2 TYPE string VALUE 'Dolma Kalem',
       gv_text3 TYPE string VALUE 'Abap programlama dili ögreniyorum.',
       gv_text4 TYPE string VALUE 'Comparison Operatörleri.',
       gv_text5 TYPE string VALUE 'euroTech Study'.

WRITE: 'CO: ****************************************'.
SKIP.

IF gv_1 CO '0123456789'.
  WRITE:'gv_1 ile matematiksel işlem yapılabilir'.
ELSE.
  WRITE: 'gv_1 ile matematiksel işlem yapılamaz'.
ENDIF.

SKIP.

IF gv_2 CO '0123456789'.
  WRITE:'gv_2 ile matematiksel işlem yapılabilir'.
ELSE.
  WRITE: 'gv_2 ile matematiksel işlem yapılamaz'.
ENDIF.

SKIP.

IF gv_3 CO '0123456789'.
  WRITE:'gv_3 ile matematiksel işlem yapılabilir'.
ELSE.
  WRITE: 'gv_3 ile matematiksel işlem yapılamaz'.
ENDIF.

SKIP.

IF gv_4 CO '0123456789'.
  WRITE:'gv_4 ile matematiksel işlem yapılabilir'.
ELSE.
  WRITE: 'gv_4 ile matematiksel işlem yapılamaz'.
ENDIF.



IF gv_5 CO 'abc'.
  WRITE:'kücük harflerden oluşur'.
ELSE.
  WRITE: 'büyük harflerden oluşur'.
ENDIF.

SKIP.
WRITE: 'CN: ****************************************'.
SKIP.

IF gv_1 CN '0123456789'.
  WRITE:'gv_1 ile matematiksel işlem yapılamaz'.
ELSE.
  WRITE:'gv_1 ile matematiksel işlem yapılabilir' .
ENDIF.

SKIP.

IF gv_2 CN '0123456789'.
  WRITE:'gv_2 ile matematiksel işlem yapılamaz'.
ELSE.
  WRITE:'gv_2 ile matematiksel işlem yapılabilir' .
ENDIF.

SKIP.

IF gv_3 CN '0123456789'.
  WRITE:'gv_3 ile matematiksel işlem yapılamaz'.
ELSE.
  WRITE:'gv_3 ile matematiksel işlem yapılabilir' .
ENDIF.

SKIP.

IF gv_4 CN '0123456789'.
  WRITE:'gv_4 ile matematiksel işlem yapılamaz'.
ELSE.
  WRITE:'gv_4 ile matematiksel işlem yapılabilir' .
ENDIF.

SKIP.
WRITE: 'CA: ****************************************'.

SKIP.
IF gv_text1 CA 'çığöşü'.
  WRITE : 'Text Türkçe karakter içermektedir.'.
ELSE.
  WRITE : 'Text Türkçe karakter içermemektedir.'.
ENDIF.
SKIP.

WRITE: 'NA: ****************************************'.

SKIP.
IF gv_text2 NA 'çığöşü'.
  WRITE : 'Text Türkçe karakter içermektedir.'.
ELSE.
  WRITE : 'Text Türkçe karakter içermemektedir.'.
ENDIF.
SKIP.

WRITE: 'CS: ****************************************'.

SKIP.

IF gv_text3 CS 'PRO'.
  WRITE : 'PRO text''i değişken içerisinde yer almaktadır.'. " pro kelimesi programlamadaki pro'dur.
ENDIF.

SKIP.
WRITE: 'NS: ****************************************'.

SKIP.
IF gv_text3 NS 'SAP'.
  WRITE : 'SAP text''i değişken içerisinde yer almamaktadır.'. " pro kelimesi programlamadaki pro'dur.
ENDIF.

SKIP.
WRITE: 'CP: ****************************************'.

IF gv_text4 CP 'COM*'.

  WRITE: / 'gv_text4 değişkeni COM texti ile başlamaktadır.'.

ENDIF.

SKIP.
WRITE: 'CP: ****************************************'.

IF gv_text4 CP '*leri.'.

  WRITE: / 'gv_text4 değişkeni leri. texti ile bitmektedir.'.

ENDIF.

SKIP.
WRITE: 'CP: ****************************************'.

IF gv_text4 CP '*tör*'.

  WRITE: / 'gv_text4 değişkeni tör textini içermektedir.'.

ENDIF.

SKIP.
WRITE: 'NP: ****************************************'.

IF gv_text5 NP 'TR*'.

  WRITE: / 'gv_text5 TR texti ile başlamamaktadır.'.

ENDIF.

SKIP.
WRITE: 'NP: ****************************************'.

IF gv_text5 NP '*DE'.

  WRITE: / 'gv_text5 DE texti ile bitmemektedir.'.

ENDIF.

SKIP.
WRITE: 'NP: ****************************************'.

IF gv_text5 NP '*DE*'.

  WRITE: / 'gv_text5 DE texti içermemektedir.'.

ENDIF.
