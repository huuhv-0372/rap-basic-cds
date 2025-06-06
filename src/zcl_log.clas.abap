CLASS zcl_log DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_log IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA day TYPE zty_definition_enum.
    day = zty_definition_enum-mon.

    out->write( day ).
  ENDMETHOD.
ENDCLASS.
