*&---------------------------------------------------------------------*
*& Include          ZGI_TEST_89_SS
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS : p_carrid TYPE s_carr_id,
               p_inc_1  RADIOBUTTON GROUP abc,
               p_exc_1  RADIOBUTTON GROUP abc.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.
  PARAMETERS : p_connid TYPE s_conn_id,
               p_inc_2  RADIOBUTTON GROUP xyz,
               p_exc_2  RADIOBUTTON GROUP xyz.

SELECTION-SCREEN END OF BLOCK a2.
