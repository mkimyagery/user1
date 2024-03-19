*&---------------------------------------------------------------------*
*& Report ZCM_TEST_152
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_152.

TYPES : BEGIN OF gty_address,
          street   TYPE char20,
          house_no TYPE int2,
          pbx_no   TYPE char5,
          city     TYPE char30,
        END OF gty_address.

TYPES : BEGIN OF gty_deep_str,
          id      TYPE zcm_de_id,
          name    TYPE zcm_de_name,
          surname TYPE zcm_de_surname,
          address TYPE gty_address,
          gsm     TYPE zcm_de_gsm,
          e_mail  TYPE zcm_de_e_mail,
        END OF gty_deep_str.

DATA : gs_structure TYPE gty_deep_str.


START-OF-SELECTION.

  gs_structure-id               = 20240001.
  gs_structure-name             = 'Alpaslan'.
  gs_structure-surname          = 'Cengiz'.
  gs_structure-address-street   = 'İlkbahar Caddesi'.
  gs_structure-address-house_no = 25.
  gs_structure-address-pbx_no   = '45010'.
  gs_structure-address-city     = 'MANISA'.
  gs_structure-gsm              = '+9005541114545'.
  gs_structure-e_mail           = 'alpaslancengiz@gmail.com'.

  BREAK-POINT.
