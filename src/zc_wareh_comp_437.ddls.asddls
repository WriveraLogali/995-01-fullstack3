@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_WAREH_COMP_437
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_WAREH_COMP_437
{
  key CompCode,
  CompName,
  Street,
  HouseNo,
  City,
  PostlCod1,
  Country,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
