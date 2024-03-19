*&---------------------------------------------------------------------*
*& Report ZCM_TEST_347
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_347.

"Alıştırma – 10: Yeni bir rapor oluşturun ve kullanıcıdan 1 adet CURRENCY alın. Rapor içinde SFLIGHT
"tablosundaki tüm satırları okuyun ve REDUCE komutu kullanarak, elde edilen tablodaki tüm fiyatların
"toplamını tek bir değişken içine kaydedin.

PARAMETERS : p_curr TYPE sflight-currency.

*DATA : gv_price      TYPE sflight-price,
*       gv_paymentsum TYPE sflight-paymentsum.

SELECT * FROM sflight INTO TABLE @DATA(gt_sflight) WHERE currency = @p_curr.

DATA(gv_price) = REDUCE s_price( INIT x = 0
                      FOR gs_str
                       IN gt_sflight
                     NEXT x = x + gs_str-price ).

DATA(gv_paymentsum) = REDUCE s_sum( INIT x = 0
                           FOR gs_str
                            IN gt_sflight
                          NEXT x = x + gs_str-paymentsum ).

*DATA(gv_value) = gv_price + gv_paymentsum.

WRITE : gv_price,
       / gv_paymentsum.

*WRITE : gv_value.
