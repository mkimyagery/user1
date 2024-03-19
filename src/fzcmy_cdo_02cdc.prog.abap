FORM CD_CALL_ZCM_CDO_02.
  IF   ( UPD_ZCM_TABLO_1 NE SPACE )
    OR ( UPD_ICDTXT_ZCM_CDO_02 NE SPACE )
  .
    CALL FUNCTION 'ZCM_CDO_02_WRITE_DOCUMENT' IN UPDATE TASK
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
* updateflag of ZCM_TABLO_1
          UPD_ZCM_TABLO_1
                      = UPD_ZCM_TABLO_1
          UPD_ICDTXT_ZCM_CDO_02
                      = UPD_ICDTXT_ZCM_CDO_02
        TABLES
          ICDTXT_ZCM_CDO_02
                      = ICDTXT_ZCM_CDO_02
          XZCM_TABLO_1
                      = XZCM_TABLO_1
          YZCM_TABLO_1
                      = YZCM_TABLO_1
    .
  ENDIF.
  CLEAR PLANNED_CHANGE_NUMBER.
ENDFORM.
