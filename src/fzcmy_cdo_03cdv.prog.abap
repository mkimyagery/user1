* declaration for the long text
DATA: BEGIN OF ICDTXT_ZCM_CDO_03 OCCURS 20.
        INCLUDE STRUCTURE CDTXT.
DATA: END OF ICDTXT_ZCM_CDO_03.
DATA: UPD_ICDTXT_ZCM_CDO_03 TYPE C.

* table with the NEW content of: ZCM_DERS_NOTLARI
DATA: BEGIN OF XZCM_DERS_NOTLARI OCCURS 20.
        INCLUDE STRUCTURE ZZCM_DERS_NOTLARI.
DATA: END OF XZCM_DERS_NOTLARI.

* table with the OLD content of: ZCM_DERS_NOTLARI
DATA: BEGIN OF YZCM_DERS_NOTLARI OCCURS 20.
        INCLUDE STRUCTURE ZZCM_DERS_NOTLARI.
DATA: END OF YZCM_DERS_NOTLARI.

DATA: UPD_ZCM_DERS_NOTLARI TYPE C.
