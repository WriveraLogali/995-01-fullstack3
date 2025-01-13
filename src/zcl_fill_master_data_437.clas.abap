CLASS zcl_fill_master_data_437 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_fill_master_data_437 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*  data lv_user TYPE
    DELETE FROM zwareh_mat_437.
    DELETE FROM zwareh_comp_437.

    TRY.
        DATA(lv_language) = cl_abap_context_info=>get_user_technical_name( ).
      CATCH cx_abap_context_info_error.
        "handle exception
    ENDTRY.

* Fill material Data
    INSERT zwareh_mat_437 FROM TABLE @( VALUE #( FOR i = 1 UNTIL i > 5
                                                   ( material_id = |100000000{ i }|
                                                     language = lv_language
                                                     description = |Material{ i }|
                                                     ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } New Materials were added| ).
    ENDIF.

* Fill material Data
    INSERT zwareh_comp_437 FROM TABLE @( VALUE #( FOR i = 1 UNTIL i > 5
                                                   ( comp_code = |100{ i }|
                                                     comp_name = |Company{ i }|
                                                     street = |Street{ i }|
                                                     house_no = |House{ i }|
                                                     city = |City{ i }|
                                                     postl_cod1 = |Postl{ i }|
                                                     country = |C-{ i }|
                                                     ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } New Companies were added| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
