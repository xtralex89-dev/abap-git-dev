"! Clase de demostración para ejecución desde la consola de ADT.
"! Además de imprimir mensajes, muestra las cuatro operaciones
"! aritméticas básicas con cantidades decimales y manejo de errores.
CLASS zcl_ab01_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! Permite ejecutar la clase como una aplicación de consola en ADT.
    INTERFACES if_oo_adt_classrun .

  PRIVATE SECTION.

    "! Cantidad decimal utilizada por todas las operaciones aritméticas.
    TYPES ty_quantity TYPE p LENGTH 8 DECIMALS 2.

    "! Suma dos cantidades.
    "! @parameter iv_quantity_1 | Primera cantidad
    "! @parameter iv_quantity_2 | Segunda cantidad
    "! @parameter rv_result     | Resultado de la suma
    "! @raising cx_sy_arithmetic_error | Error aritmético, como un desbordamiento
    METHODS add
      IMPORTING
        iv_quantity_1 TYPE ty_quantity
        iv_quantity_2 TYPE ty_quantity
      RETURNING
        VALUE(rv_result) TYPE ty_quantity
      RAISING
        cx_sy_arithmetic_error.

    "! Resta la segunda cantidad de la primera.
    "! @parameter iv_quantity_1 | Cantidad de la que se resta
    "! @parameter iv_quantity_2 | Cantidad que se resta
    "! @parameter rv_result     | Resultado de la resta
    "! @raising cx_sy_arithmetic_error | Error aritmético, como un desbordamiento
    METHODS subtract
      IMPORTING
        iv_quantity_1 TYPE ty_quantity
        iv_quantity_2 TYPE ty_quantity
      RETURNING
        VALUE(rv_result) TYPE ty_quantity
      RAISING
        cx_sy_arithmetic_error.

    "! Divide la primera cantidad entre la segunda.
    "! @parameter iv_quantity_1 | Dividendo
    "! @parameter iv_quantity_2 | Divisor
    "! @parameter rv_result     | Resultado de la división
    "! @raising cx_sy_arithmetic_error | División entre cero u otro error aritmético
    METHODS divide
      IMPORTING
        iv_quantity_1 TYPE ty_quantity
        iv_quantity_2 TYPE ty_quantity
      RETURNING
        VALUE(rv_result) TYPE ty_quantity
      RAISING
        cx_sy_arithmetic_error.

    "! Multiplica dos cantidades.
    "! @parameter iv_quantity_1 | Primera cantidad
    "! @parameter iv_quantity_2 | Segunda cantidad
    "! @parameter rv_result     | Resultado de la multiplicación
    "! @raising cx_sy_arithmetic_error | Error aritmético, como un desbordamiento
    METHODS multiply
      IMPORTING
        iv_quantity_1 TYPE ty_quantity
        iv_quantity_2 TYPE ty_quantity
      RETURNING
        VALUE(rv_result) TYPE ty_quantity
      RAISING
        cx_sy_arithmetic_error.

ENDCLASS.



CLASS zcl_ab01_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Mensajes originales de la demostración Hello World.
    out->write( 'Hola Mundo ABAP 1!!' ).
    out->write( 'Hola Mundo ABAP 2!!' ).
    out->write( 'Hola Mundo ABAP 3!!' ).
    out->write( 'Hola Mundo ABAP 4!!' ).
    " Code added from GitHub v1
    out->write( 'Hola Mundo ABAP 5!!' ).
    out->write( 'Hola Mundo ABAP 6!!' ).
    out->write( 'Hola Mundo ABAP 7!!' ).
    out->write( 'Hola Mundo ABAP 8!!' ).

    " Cantidades de ejemplo empleadas en las cuatro operaciones.
    DATA(lv_quantity_1) = CONV ty_quantity( '25.50' ).
    DATA(lv_quantity_2) = CONV ty_quantity( '10.00' ).

    " Cada operación controla su propia excepción para que las siguientes
    " continúen ejecutándose aunque una de ellas produzca un error.
    TRY.
        DATA(lv_sum) = add(
          iv_quantity_1 = lv_quantity_1
          iv_quantity_2 = lv_quantity_2 ).
        out->write( |Suma: { lv_quantity_1 } + { lv_quantity_2 } = { lv_sum }| ).
      CATCH cx_sy_arithmetic_error INTO DATA(lx_add_error).
        out->write( |Error en la suma: { lx_add_error->get_text( ) }| ).
    ENDTRY.

    TRY.
        DATA(lv_difference) = subtract(
          iv_quantity_1 = lv_quantity_1
          iv_quantity_2 = lv_quantity_2 ).
        out->write( |Resta: { lv_quantity_1 } - { lv_quantity_2 } = { lv_difference }| ).
      CATCH cx_sy_arithmetic_error INTO DATA(lx_subtract_error).
        out->write( |Error en la resta: { lx_subtract_error->get_text( ) }| ).
    ENDTRY.

    TRY.
        DATA(lv_quotient) = divide(
          iv_quantity_1 = lv_quantity_1
          iv_quantity_2 = lv_quantity_2 ).
        out->write( |División: { lv_quantity_1 } / { lv_quantity_2 } = { lv_quotient }| ).
      CATCH cx_sy_arithmetic_error INTO DATA(lx_divide_error).
        out->write( |Error en la división: { lx_divide_error->get_text( ) }| ).
    ENDTRY.

    TRY.
        DATA(lv_product) = multiply(
          iv_quantity_1 = lv_quantity_1
          iv_quantity_2 = lv_quantity_2 ).
        out->write( |Multiplicación: { lv_quantity_1 } * { lv_quantity_2 } = { lv_product }| ).
      CATCH cx_sy_arithmetic_error INTO DATA(lx_multiply_error).
        out->write( |Error en la multiplicación: { lx_multiply_error->get_text( ) }| ).
    ENDTRY.

  ENDMETHOD.


  METHOD add.
    rv_result = iv_quantity_1 + iv_quantity_2.
  ENDMETHOD.


  METHOD subtract.
    rv_result = iv_quantity_1 - iv_quantity_2.
  ENDMETHOD.


  METHOD divide.
    rv_result = iv_quantity_1 / iv_quantity_2.
  ENDMETHOD.


  METHOD multiply.
    rv_result = iv_quantity_1 * iv_quantity_2.
  ENDMETHOD.

ENDCLASS.
