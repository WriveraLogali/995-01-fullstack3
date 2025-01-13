CLASS lhc_zr_warehouse_437 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrWarehouse437
        RESULT result,
      validateDates FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrWarehouse437~validateDates,
      setCreateDate FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrWarehouse437~setCreateDate.
ENDCLASS.

CLASS lhc_zr_warehouse_437 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateDates.
* Read root entity entries updated
    READ ENTITIES OF zr_warehouse_437 IN LOCAL MODE
     ENTITY ZrWarehouse437
     FIELDS ( CreatedOn
              ValidUntil )
     WITH CORRESPONDING #( keys )
     RESULT DATA(lt_root_entity).

* Iterate through the root entity records
    LOOP AT lt_root_entity INTO DATA(ls_root_entity).
* Created on less than Valid Until Date / Valid Until Date greater than Created on
      IF ls_root_entity-CreatedOn GT ls_root_entity-ValidUntil.

* Set authorizations
        APPEND VALUE #( %tky = ls_root_entity-%tky ) TO failed-ZrWarehouse437.

* Customize error messages
        APPEND VALUE #( %tky = ls_root_entity-%tky
                        %msg = NEW /dmo/cm_flight_messages( textid = /dmo/cm_flight_messages=>begin_date_bef_end_date
                                                            begin_date = ls_root_entity-CreatedOn
                                                            end_date = ls_root_entity-ValidUntil
                                                            severity = if_abap_behv_message=>severity-error )
                        %state_area = 'VALIDATE_COMPONENT'
                        %element-CreatedOn = if_abap_behv=>mk-on ) TO reported-ZrWarehouse437.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD setCreateDate.
* Read root entity entries
    READ ENTITIES OF zr_warehouse_437 IN LOCAL MODE
     ENTITY ZrWarehouse437
     FIELDS ( CreatedOn ) WITH CORRESPONDING #( keys )
     RESULT DATA(lt_root_entity).

    DELETE lt_root_entity WHERE CreatedOn IS NOT INITIAL.

    CHECK lt_root_entity IS NOT INITIAL.

* Modify status in Root Entity
    MODIFY ENTITIES OF zr_warehouse_437 IN LOCAL MODE
      ENTITY ZrWarehouse437
      UPDATE
      FIELDS ( CreatedOn )
      WITH VALUE #(  FOR ls_root_entity IN lt_root_entity ( %tky = ls_root_entity-%tky
                                          CreatedOn = cl_abap_context_info=>get_system_date( ) )  ).
  ENDMETHOD.

ENDCLASS.
