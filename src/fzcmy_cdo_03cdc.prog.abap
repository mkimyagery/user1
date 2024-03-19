FORM CD_CALL_ZCM_CDO_03.
  IF   ( UPD_ZCM_DERS_NOTLARI NE SPACE )
    OR ( UPD_ICDTXT_ZCM_CDO_03 NE SPACE )
  .
    CALL FUNCTION 'ZCM_CDO_03_WRITE_DOCUMENT' IN UPDATE TASK
        EXPORTING
          OBJECTID                = OBJECTID
          TCODE                   = TCODE
          UTIME                   = UTIME
          UDATE                   = UDATE
          USERNAME                = USERNAME
          PLANNED_CHANGE_NUMBER   = PLANNED_CHANGE_NUMBER
          OBJECT_CHANGE_INDICATOR = CDOC_UPD_OBJECT
          PLANNED_OR_REAL_CHANGES = CDOC_PLANNED_OR_REAL
          NO_CHANGE_POINTERS      = CDOC_NO_CHANGE_POINTERS
* updateflag of ZCM_DERS_NOTLARI
          UPD_ZCM_DERS_NOTLARI
                      = UPD_ZCM_DERS_NOTLARI
          UPD_ICDTXT_ZCM_CDO_03
                      = UPD_ICDTXT_ZCM_CDO_03
        TABLES
          ICDTXT_ZCM_CDO_03
                      = ICDTXT_ZCM_CDO_03
          XZCM_DERS_NOTLARI
                      = XZCM_DERS_NOTLARI
          YZCM_DERS_NOTLARI
                      = YZCM_DERS_NOTLARI
    .
  ENDIF.
  CLEAR PLANNED_CHANGE_NUMBER.
ENDFORM.
