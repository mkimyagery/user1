*&---------------------------------------------------------------------*
*& Include          ZCM_TEST_81_SS
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS : p_carrid TYPE s_carr_id,
               p_inc1   RADIOBUTTON GROUP abc,
               p_exc1   RADIOBUTTON GROUP abc.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.

  PARAMETERS : p_connid TYPE zcm_de_connid2 , "s_conn_id,
               p_inc2   RADIOBUTTON GROUP xyz,
               p_exc2   RADIOBUTTON GROUP xyz.

SELECTION-SCREEN END OF BLOCK a2.
