@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Excel Upload Interface for Sales Order'

define root view entity ZJH_I_EXCEL_UPLOAD
  as select from zjh_excel_upload
{
  key upload_id,
      sold_to_party,
      material,
      unit,
      @Semantics.quantity.unitOfMeasure : 'unit'
      quantity,
      delivery_date,
      status,
      message
}
