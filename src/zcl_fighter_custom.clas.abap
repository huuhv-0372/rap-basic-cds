CLASS zcl_fighter_custom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
ENDCLASS.



CLASS zcl_fighter_custom IMPLEMENTATION.
    METHOD if_rap_query_provider~select.
    IF io_request->is_data_requested( ).

      DATA(lv_top)     = io_request->get_paging( )->get_page_size( ).
      IF lv_top < 0.
        lv_top = 1.
      ENDIF.

      DATA(lv_skip)    = io_request->get_paging( )->get_offset( ).

      DATA(lt_sort)    = io_request->get_sort_elements( ).

      DATA lt_result TYPE STANDARD TABLE OF ZI_FIGHTER_CUSTOM.

      DATA : lv_orderby TYPE string.
      LOOP AT lt_sort INTO DATA(ls_sort).
        IF ls_sort-descending = abap_true.
          lv_orderby = |'{ lv_orderby } { ls_sort-element_name } DESCENDING '|.
        ELSE.
          lv_orderby = |'{ lv_orderby } { ls_sort-element_name } ASCENDING '|.
        ENDIF.
      ENDLOOP.
      IF lv_orderby IS INITIAL.
        lv_orderby = 'CARRIER_ID'.
      ENDIF.

      DATA(lv_conditions) =  io_request->get_filter( )->get_as_sql_string( ).

      SELECT FROM /dmo/flight
        FIELDS carrier_id, connection_id, flight_date, price, currency_code, plane_type_id, seats_max, seats_occupied
        WHERE (lv_conditions)
        ORDER BY (lv_orderby)
        INTO TABLE @DATA(flights)
        UP TO @lv_top ROWS OFFSET @lv_skip.

      LOOP AT flights INTO DATA(ls_flight).
          APPEND VALUE #(
            carrier_id      = ls_flight-carrier_id
            connection_id   = ls_flight-connection_id
            flight_date     = ls_flight-flight_date
            price           = ls_flight-price
            currency_code   = ls_flight-currency_code
            plane_type_id   = ls_flight-plane_type_id
            seats_max       = ls_flight-seats_max
            seats_occupied  = ls_flight-seats_occupied
            ZZfield_custom   = |Flight { ls_flight-carrier_id }-{ ls_flight-connection_id }|
          ) TO lt_result.
        ENDLOOP.

      IF io_request->is_total_numb_of_rec_requested(  ).
        io_response->set_total_number_of_records( lines( lt_result ) ).
        io_response->set_data( lt_result ).
      ENDIF.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
