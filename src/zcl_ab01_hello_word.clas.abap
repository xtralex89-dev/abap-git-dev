CLASS zcl_ab01_hello_word DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ab01_hello_word IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( 'Hola Mundo ABAP 1!!' ).
    out->write( 'Hola Mundo ABAP 2!!' ).
    out->write( 'Hola Mundo ABAP 3!!' ).
    out->write( 'Hola Mundo ABAP 4!!' ).

  ENDMETHOD.
ENDCLASS.
