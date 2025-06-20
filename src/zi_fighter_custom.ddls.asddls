@EndUserText.label: 'CDS view custom'

@ObjectModel: {
    query: {
        implementedBy: 'ABAP:ZCL_FIGHTER_CUSTOM'
    }
}

@UI: {
  headerInfo: {
    typeName: 'Flight',
    typeNamePlural: 'Flights',
    title: { value: 'carrier_id' },
    description: { value: 'connection_id' }
  }
}

define root custom entity ZI_FIGHTER_CUSTOM
{
  @UI.facet      : [
           {
             id      :  'Flight_Data',
             purpose :  #STANDARD,
             type    :  #IDENTIFICATION_REFERENCE,
             label   :  'Flights',
             position: 10 }
         ]

      @UI.lineItem   : [{ position: 10 }]
      @UI.selectionField : [{position: 10}]
      @UI.identification: [{position: 10}]
  key carrier_id     : /dmo/carrier_id;

      @UI.lineItem   : [{ position: 20 }]
      @UI.selectionField : [{position: 20}]
      @UI.identification: [{position: 20}]
  key connection_id  : /dmo/connection_id;

      @UI.lineItem   : [{ position: 30 }]
      @UI.selectionField : [{position: 30}]
      @UI.identification: [{position: 30}]
  key flight_date    : /dmo/flight_date;

      @UI.lineItem   : [{ position: 40 }]
      @UI.identification: [{position: 40}]
      @Semantics.amount.currencyCode : 'currency_code'
      price          : /dmo/flight_price;

      @UI.lineItem   : [{ position: 50 }]
      @UI.identification: [{position: 50}]
      currency_code  : /dmo/currency_code;

      @UI.lineItem   : [{ position: 60 }]
      @UI.identification: [{position: 60}]
      plane_type_id  : /dmo/plane_type_id;

      @UI.lineItem   : [{ position: 70 }]
      @UI.identification: [{position: 70}]
      seats_max      : /dmo/plane_seats_max;

      @UI.lineItem   : [{ position: 80 }]
      @UI.identification: [{position: 80}]
      seats_occupied : /dmo/plane_seats_occupied;
}
