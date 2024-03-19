*&---------------------------------------------------------------------*
*& Report ZAC_CON_CHECK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zacy_con_check.

TABLES : spfli.
TYPES: tr_carrid TYPE RANGE OF spfli-carrid .

*--------------------------------------------------------------------*
* Data
*--------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS cl_spfli DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS cl_spfli DEFINITION .

  PUBLIC SECTION .
*   1. Define reference of class CL_GUI_TIMER.
    DATA : ob_timer  TYPE REF TO cl_gui_timer .
    METHODS : set_filter IMPORTING filter TYPE tr_carrid ,
      display_report ,
*             2. Define event handling method for event FINISHED of class CL_GUI_TIMER.
      timer_event FOR EVENT finished OF cl_gui_timer.

  PRIVATE SECTION .
    DATA : r_carrid TYPE tr_carrid,
           i_spfli  TYPE TABLE OF spfli.

    DATA : ob_grid TYPE REF TO cl_gui_alv_grid .

    METHODS : get_data .
ENDCLASS .                    "cl_spfli DEFINITION

*----------------------------------------------------------------------*
*       CLASS cl_spfli IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS cl_spfli IMPLEMENTATION .

  METHOD set_filter .
    me->r_carrid = filter .
  ENDMETHOD .                    "set_filter

  METHOD get_data .
    SELECT *
      INTO TABLE i_spfli
      FROM spfli
     WHERE carrid IN r_carrid .
  ENDMETHOD .                    "get_data

  METHOD timer_event .

*    me->get_data( ) .
*
*    IF me->ob_grid IS INITIAL .
*      CALL FUNCTION 'GET_GLOBALS_FROM_SLVC_FULLSCR'
*        IMPORTING
*          e_grid = ob_grid.
*    ENDIF.

*    CALL METHOD ob_grid->check_changed_data .

*    MESSAGE sy-uzeit TYPE 'S' .

*   7. Call RUN method of CL_GUI_TIMER again to activate timer
    me->ob_timer->run( ) .
    WRITE:/ 'Bağlantı kontrol ediliyor..'.
  ENDMETHOD .                    "timer_event

  METHOD display_report .

    WRITE:/ 'Bağlantı kontrol ediliyor..'.
  ENDMETHOD .                    "display_report


ENDCLASS .                    "cl_spfli IMPLEMENTATION

DATA : ob_spfli TYPE REF TO cl_spfli,
       ob_timer TYPE REF TO cl_gui_timer.

*--------------------------------------------------------------------*
* Selection Screen
*--------------------------------------------------------------------*
*SELECT-OPTIONS s_carrid FOR spfli-carrid .
*PARAMETERS : "p_refres  TYPE char01 AS CHECKBOX ,
DATA: p_int TYPE int1 VALUE '30'.

*--------------------------------------------------------------------*
* Start of Selection
*--------------------------------------------------------------------*
START-OF-SELECTION .
  RANGES: s_carrid FOR spfli-carrid.
* Create main object
  CREATE OBJECT ob_spfli .
  ob_spfli->set_filter( s_carrid[] ) .

* If Auto refresh required then initialise timer object
* Bind event listner method to object
* Set interval and call method run
*  IF p_refres IS NOT INITIAL .
*   3. Initialise object CL_GUI_TIMER.
  CREATE OBJECT ob_spfli->ob_timer .

*   4. Bind event handling method to object of CL_GUI_TIMER
  SET HANDLER ob_spfli->timer_event FOR ob_spfli->ob_timer .

*   5. Set interval for timer
  ob_spfli->ob_timer->interval = p_int .

*   6. Call method RUN of CL_GUI_TIMER.
  ob_spfli->ob_timer->run( ) .
*  ENDIF.

* Display ALV report
  ob_spfli->display_report( ) .
