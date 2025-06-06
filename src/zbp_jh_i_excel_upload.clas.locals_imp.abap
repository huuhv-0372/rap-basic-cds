CLASS lhc_ZJH_I_EXCEL_UPLOAD DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zjh_i_excel_upload RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zjh_i_excel_upload RESULT result.

    METHODS upload_excel FOR MODIFY
      IMPORTING keys FOR ACTION zjh_i_excel_upload~upload_excel RESULT result.

ENDCLASS.

CLASS lhc_ZJH_I_EXCEL_UPLOAD IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD upload_excel.
  ENDMETHOD.

ENDCLASS.
