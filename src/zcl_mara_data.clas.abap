CLASS zcl_mara_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mara_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zjh_mara.

    DATA: lt_upload TYPE STANDARD TABLE OF zjh_mara,
          ls_upload TYPE zjh_mara.

*    ls_upload = VALUE zjh_mara(
*      client        = sy-mandt
*      matnr     = 'MATNR001'
*      description       = 'Waiting for approval'
*    ).
*    APPEND ls_upload TO lt_upload.
*
*    ls_upload = VALUE zjh_mara(
*      client        = sy-mandt
*      matnr     = 'MATNR002'
*      description       = 'Waiting for approval'
*    ).
*
*    APPEND ls_upload TO lt_upload.
*
*    ls_upload = VALUE zjh_mara(
*      client        = sy-mandt
*      matnr     = 'MATNR003'
*      description       = 'Waiting for approval'
*    ).
*
*    APPEND ls_upload TO lt_upload.

    DO 10 TIMES.
      ls_upload = VALUE #(
        client        = sy-mandt
        matnr     = |MAT00{ sy-index }|        " DEMO0001, DEMO0002,...
        description       = |Demo line { sy-index } created|
      ).
      APPEND ls_upload TO lt_upload.
    ENDDO.

    INSERT zjh_mara FROM TABLE @lt_upload.

    "INSERT zjh_excel_upload FROM TABLE lt_upload.
    COMMIT WORK.
    out->write( 'Data of zjh_mara table inserted' ).
  ENDMETHOD.
ENDCLASS.

