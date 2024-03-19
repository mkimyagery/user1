*&---------------------------------------------------------------------*
*& Report ZCM_TEST_332
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_332.

TYPES : BEGIN OF gty_header,
          header TYPE c LENGTH 20,
        END OF gty_header.

DATA : gv_agencynum TYPE s_agncynum,
       gt_header    TYPE TABLE OF gty_header.

SELECT-OPTIONS : so_agnum FOR gv_agencynum.

START-OF-SELECTION.

  SELECT * FROM zcm_stravelag INTO TABLE @DATA(gt_table) WHERE agencynum IN @so_agnum.

  gt_header = VALUE #( ( header = 'MANDT'     ) ( header = 'ID'       )
                       ( header = 'AGENCYNUM' ) ( header = 'NAME'     )
                       ( header = 'STREET'    ) ( header = 'POSTBOX'  )
                       ( header = 'POSTCODE'  ) ( header = 'CITY'     )
                       ( header = 'COUNTRY'   ) ( header = 'REGION'   )
                       ( header = 'TELEPHONE' ) ( header = 'URL'      )
                       ( header = 'LANGU'     ) ( header = 'CURRENCY' ) ).

  CALL METHOD cl_gui_frontend_services=>gui_download
    EXPORTING
      filename                = 'C:\Users\P16\Desktop'
      filetype                = 'ASC'
      write_field_separator   = abap_true
      fieldnames              = gt_header
    CHANGING
      data_tab                = gt_table
    EXCEPTIONS
      file_write_error        = 1
      no_batch                = 2
      gui_refuse_filetransfer = 3
      invalid_type            = 4
      no_authority            = 5
      unknown_error           = 6
      header_not_allowed      = 7
      separator_not_allowed   = 8
      filesize_not_allowed    = 9
      header_too_long         = 10
      dp_error_create         = 11
      dp_error_send           = 12
      dp_error_write          = 13
      unknown_dp_error        = 14
      access_denied           = 15
      dp_out_of_memory        = 16
      disk_full               = 17
      dp_timeout              = 18
      file_not_found          = 19
      dataprovider_exception  = 20
      control_flush_error     = 21
      not_supported_by_gui    = 22
      error_no_gui            = 23
      OTHERS                  = 24.

  IF sy-subrc <> 0.
    MESSAGE 'Islem Basarısız BRO!' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
