@EndUserText.label: 'Excel Upload Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: { typeName: 'Sales Order Upload', title: { value: 'upload_id' } }
// @UI.fileUpload: { maxFileSize: 1000000, mimeTypes: ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'] } // Comment ra vì lỗi trước
@Search.searchable: true

define root view entity ZJH_C_EXCEL_UPLOAD
  as projection on ZJH_I_EXCEL_UPLOAD
{
      // Cần phải có @UI.facet thì mới hiển thị data khi vào phần detail/edit
      @UI.facet: [{ id:            'Upload_Id',
                 purpose:       #STANDARD,
                 type:          #IDENTIFICATION_REFERENCE,
                 label:         'Upload Excel data',
                 position:      10 }]
      @UI.lineItem: [{ position: 10, label: 'Upload ID' }]
      @UI: { identification: [ { position: 10, label: 'Upload ID'  } ] }
      @Search.defaultSearchElement: true // Tìm kiếm mặc định theo upload_id
      //@EndUserText.quickInfo: 'import excel file'
  key upload_id,

      @UI.selectionField: [{ position: 20 }] // Hiển thị input tìm kiếm trên UI
      @UI.lineItem: [{ position: 20 }]
      @UI: { identification: [ { position: 20, label: 'Customer'  } ] } // Hiển thị khi create/detail/update form
      sold_to_party,

      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_MATNR', element: 'Matnr' } }]
      @UI.selectionField: [{ position: 30 }] // Hiển thị input tìm kiếm trên UI
      @UI: { identification: [ { position: 30, label: 'Material'  } ] } // Hiển thị khi create/detail/update form
      @UI.lineItem: [{ position: 30 }]
      material,

      @UI.lineItem: [{ position: 40 }]
      unit,

      @Semantics.quantity.unitOfMeasure: 'unit'
      @UI.lineItem: [{ position: 50 }]
      quantity,

      //@Semantics.dateTime: true
      @UI.lineItem: [{ position: 60 }]
      delivery_date,

      @UI.lineItem: [{ position: 70 }]
      //@Consumption.filter.defaultValue: 'N' // Gắn filter mặc định của status
      status,

      @UI.lineItem: [{ position: 80 }]
      @Semantics.text: true
      message
}
