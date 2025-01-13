@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_WAREHOUSE_437
  provider contract transactional_query
  as projection on ZR_WAREHOUSE_437
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @ObjectModel.text.element: [ 'MaterialDescription' ]
  key MaterialId,
  key Plant,
  key Storage,
      _Material.description as MaterialDescription,
      MatType,
      Industry,
      MatGroup,
      @Semantics.unitOfMeasure: true
      Unit,
      CreatedOn,
      ValidUntil,
      GrossWeight,
      NetWeight,
      @Semantics.unitOfMeasure: true
      WeightUnit,
      Volume,
      @Semantics.unitOfMeasure: true
      VolumeUnit,
      Price,
      PromotionPrice,
      @Semantics.currencyCode: true
      Waers,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}
