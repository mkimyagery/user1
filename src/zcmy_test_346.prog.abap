*&---------------------------------------------------------------------*
*& Report ZCM_TEST_346
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_346.

"Alıştırma – 9: Yeni bir rapor oluşturun ve kullanıcıdan 2 adet CARRID alın. Rapor içinde 2 kere SPFLI
"tablosundan ilgili satırları okuyun ve iki ayrı internal tablo içine kaydedin. Her okumada secim
"ekranından gelen bir CARRID bilgisini koşul olarak belirleyin. Inline declaration ile SPFLI tablosunun
"satir yapısı ile ayni satır yapısında bir internal tablo tanımlayın. Öncelikle FOR IN döngüsü kullanarak
"birinci internal tablodaki verileri, daha sonra BASE FOR IN komutlarını kullanarak ikinci internal
"tablodaki verileri üçüncü internal tablonun içine aktarın.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS : p_carr_1 TYPE s_carr_id,
               p_carr_2 TYPE s_carr_id.
SELECTION-SCREEN END OF BLOCK a1.

TYPES : BEGIN OF gty_spfli,
          carrid    TYPE spfli-carrid,
          connid    TYPE spfli-connid,
          countryfr TYPE spfli-countryfr,
          cityfrom  TYPE spfli-cityfrom,
          airpfrom  TYPE spfli-airpfrom,
          countryto TYPE spfli-countryto,
          cityto    TYPE spfli-cityto,
          airpto    TYPE spfli-airpto,
          fltime    TYPE spfli-fltime,
          deptime   TYPE spfli-deptime,
          arrtime   TYPE spfli-arrtime,
          distance  TYPE spfli-distance,
          distid    TYPE spfli-distid,
          fltype    TYPE spfli-fltype,
          period    TYPE spfli-period,
        END OF gty_spfli.

TYPES : gtt_spfli TYPE TABLE OF gty_spfli WITH NON-UNIQUE KEY carrid.


SELECT * FROM spfli INTO TABLE @DATA(gt_spfli_1) WHERE carrid = @p_carr_1.
SELECT * FROM spfli INTO TABLE @DATA(gt_spfli_2) WHERE carrid = @p_carr_2.

DATA(gt_table) = VALUE gtt_spfli( FOR gs_spfli_1
                                  IN gt_spfli_1
                                ( carrid    = gs_spfli_1-carrid
                                  connid    = gs_spfli_1-connid
                                  countryfr = gs_spfli_1-countryfr
                                  cityfrom  = gs_spfli_1-cityfrom
                                  airpfrom  = gs_spfli_1-airpfrom
                                  countryto = gs_spfli_1-countryto
                                  cityto    = gs_spfli_1-cityto
                                  airpto    = gs_spfli_1-airpto
                                  fltime    = gs_spfli_1-fltime
                                  deptime   = gs_spfli_1-deptime
                                  arrtime   = gs_spfli_1-arrtime
                                  distance  = gs_spfli_1-distance
                                  distid    = gs_spfli_1-distid
                                  fltype    = gs_spfli_1-fltype
                                  period    = gs_spfli_1-period ) ).

gt_table = VALUE #( BASE gt_table
                    FOR gs_spfli_2
                     IN gt_spfli_2
                 ( carrid    = gs_spfli_2-carrid
                   connid    = gs_spfli_2-connid
                   countryfr = gs_spfli_2-countryfr
                   cityfrom  = gs_spfli_2-cityfrom
                   airpfrom  = gs_spfli_2-airpfrom
                   countryto = gs_spfli_2-countryto
                   cityto    = gs_spfli_2-cityto
                   airpto    = gs_spfli_2-airpto
                   fltime    = gs_spfli_2-fltime
                   deptime   = gs_spfli_2-deptime
                   arrtime   = gs_spfli_2-arrtime
                   distance  = gs_spfli_2-distance
                   distid    = gs_spfli_2-distid
                   fltype    = gs_spfli_2-fltype
                   period    = gs_spfli_2-period ) ).

BREAK-POINT.
