CLASS zcl_zjh_excel_upload_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zjh_excel_upload_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "DELETE FROM zjh_excel_upload.

    DATA: lt_upload TYPE STANDARD TABLE OF zjh_excel_upload,
          ls_upload TYPE zjh_excel_upload.

    ls_upload = VALUE zjh_excel_upload(
      client        = sy-mandt
      upload_id     = 'UPL000005'
      sold_to_party = '1000000030'
      material      = 'MAT001'
      unit          = 'EA'
      quantity      = '50'
      delivery_date = '20250605'
      status        = 'S'
      message       = 'Waiting for approval'
    ).

    INSERT zjh_excel_upload FROM @ls_upload.

    "INSERT zjh_excel_upload FROM TABLE lt_upload.
    COMMIT WORK.
    out->write( 'Data of zjh_excel_upload table inserted' ).
  ENDMETHOD.
ENDCLASS.
