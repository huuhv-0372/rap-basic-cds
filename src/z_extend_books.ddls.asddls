@AbapCatalog.sqlViewAppendName: ''
@EndUserText.label: 'CDS extend'
extend view ZI_BOOKS with Z_extend_books
{
    zjh_books.flight_date as ZZFlightDate
}
