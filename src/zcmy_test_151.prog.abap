*&---------------------------------------------------------------------*
*& Report ZCM_TEST_151
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_151.

DATA : gs_structure TYPE zcm_s_deepstr_03.

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
