@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_WAREHOUSE_437
  as select from zwarehouse_437
  association [0..1] to zwareh_mat_437 as _Material on $projection.MaterialId = _Material.material_id
{
  key material_id           as MaterialId,
  key plant                 as Plant,
  key storage               as Storage,
      mat_type              as MatType,
      industry              as Industry,
      mat_group             as MatGroup,
      unit                  as Unit,
      created_on            as CreatedOn,
      valid_until           as ValidUntil,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      gross_weight          as GrossWeight,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      net_weight            as NetWeight,
      weight_unit           as WeightUnit,
      @Semantics.quantity.unitOfMeasure: 'VolumeUnit'
      volume                as Volume,
      volume_unit           as VolumeUnit,
      @Semantics.amount.currencyCode: 'Waers'
      price                 as Price,
      @Semantics.amount.currencyCode: 'Waers'
      promotion_price       as PromotionPrice,
      waers                 as Waers,
      // Publication of associations
      _Material,
      // audit components
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

}
