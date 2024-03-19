*&---------------------------------------------------------------------*
*& Report ZABAP_CM_017
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_cmy_017.

"Global tanımlama
DATA : gs_structure TYPE zcm_s_deepstr_05.

START-OF-SELECTION.

  gs_structure-id               = 20241903.
  gs_structure-name             = 'Alpaslan'.
  gs_structure-surname          = 'Cengiz'.
  gs_structure-address-street   = 'İlkbahar Caddesi'.
  gs_structure-address-house_no = 45.
  gs_structure-address-pbx_no   = '45010'.
  gs_structure-address-city     = 'MANISA'.
  gs_structure-gsm              = '05541814646'.
  gs_structure-email            = 'alpaslancengiz@gmail.com'.

*  BREAK user1.

  "Lokal tanımlama
  TYPES : BEGIN OF gty_adress,
            street   TYPE char30,
            house_no TYPE int2,
            pbx_no   TYPE char5,
            city     TYPE char30,
          END OF gty_adress.

  TYPES : BEGIN OF gty_deep_str,
            id      TYPE zcm_de_id,
            name    TYPE zcm_de_name,
            surname TYPE zcm_de_surname,
            address TYPE gty_adress,
            gsm     TYPE zcm_de_gsm,
            email   TYPE zcm_de_e_mail,
          END OF gty_deep_str.

  DATA : gs_structure2 TYPE gty_deep_str.

  gs_structure2-id               = 20241903.
  gs_structure2-name             = 'Alpaslan'.
  gs_structure2-surname          = 'Cengiz'.
  gs_structure2-address-street   = 'İlkbahar Caddesi'.
  gs_structure2-address-house_no = 45.
  gs_structure2-address-pbx_no   = '45010'.
  gs_structure2-address-city     = 'MANISA'.
  gs_structure2-gsm              = '05541814646'.
  gs_structure2-email            = 'alpaslancengiz@gmail.com'.

  BREAK user1.
