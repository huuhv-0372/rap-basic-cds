@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view of books table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_BOOKS
  as select from zjh_books
  //composition of target_data_source_name as _association_name
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
//      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode
//      cast(day_of_week as ZTY_ENUM_WEEKDAY preserving type) as weekday,
//      cast(note as ZTY_Definition preserving type) as note
      // comment
      //    _association_name // Make association public

}
