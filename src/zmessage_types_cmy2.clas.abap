class ZMESSAGE_TYPES_CMY2 definition
  public
  final
  create public .

public section.

  methods SHOW_MESSAGE
    importing
      !IV_SUCCES type CHAR1
      !IV_ERROR type CHAR1
      !IV_WARNING type CHAR1
      !IV_INFORMATION type CHAR1 .
protected section.
private section.
ENDCLASS.



CLASS ZMESSAGE_TYPES_CMY2 IMPLEMENTATION.


  METHOD SHOW_MESSAGE.

    IF iv_succes = abap_true.
*      MESSAGE s000(zcm_msg_class_2).
      MESSAGE s000.
    ELSEIF iv_error   = abap_true.
*      MESSAGE e000(zcm_msg_class_2).
      MESSAGE e000.
    ELSEIF iv_warning = abap_true.
*      MESSAGE w000(zcm_msg_class_2).
      MESSAGE w000.
    ELSEIF iv_information = abap_true.
*      MESSAGE i000(zcm_msg_class_2).
      MESSAGE i000.
    ENDIF.


  ENDMETHOD.
ENDCLASS.
