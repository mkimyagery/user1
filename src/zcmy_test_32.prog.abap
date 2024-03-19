*&---------------------------------------------------------------------*
*& Report ZCM_TEST_32
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcmy_test_32.

*TYPES : BEGIN OF gty_structure,
*          id      TYPE n LENGTH 8,
*          name    TYPE c LENGTH 40,
*          surname TYPE c LENGTH 40,
*          job     TYPE c LENGTH 20,
*          salary  TYPE i,
*          curr    TYPE c LENGTH 3,
*          gsm     TYPE string,
*          e_mail  TYPE string,
*        END OF  gty_structure.
*
*DATA : gs_structure TYPE gty_structure.
*
*gs_structure-id      = 20220001.
*gs_structure-name    = 'Mehmet'.
*gs_structure-surname = 'Yılmaz'.
*gs_structure-job     = 'Teacher'.
*gs_structure-salary  = 30000.
*gs_structure-curr    = 'TL'.
*gs_structure-gsm     = '+49166634543298'.
*gs_structure-e_mail  = 'mehmetyilmaz@gmail.com'.
*
*WRITE :  gs_structure-id      ,
*       / gs_structure-name    ,
*       / gs_structure-surname ,
*       / gs_structure-job     ,
*       / gs_structure-salary  ,
*       / gs_structure-curr    ,
*       / gs_structure-gsm     ,
*       / gs_structure-e_mail  .


**SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
**
**  PARAMETERS : p_id     TYPE c LENGTH 8,
**               p_name   TYPE c LENGTH 20,
**               p_sname  TYPE c LENGTH 20,
**               p_deprtm TYPE c LENGTH 15,
**               p_team   TYPE c LENGTH 15.
**
**SELECTION-SCREEN END OF BLOCK a1.
**
**DATA : BEGIN OF gs_structure,
**         user_id TYPE c LENGTH 8,
**         name    TYPE c LENGTH 20,
**         sname   TYPE c LENGTH 20,
**         deprtm  TYPE c LENGTH 15,
**         team    TYPE c LENGTH 15,
**       END OF gs_structure.
**
**START-OF-SELECTION.
**
**  gs_structure-user_id = p_id.
**  gs_structure-name    = p_name.
**  gs_structure-sname   = p_sname.
**  gs_structure-deprtm  = p_deprtm.
**  gs_structure-team    = p_team.
**
**  WRITE :   gs_structure-user_id,
**          / gs_structure-name ,
**          / gs_structure-sname ,
**          / gs_structure-deprtm ,
**          / gs_structure-team .
