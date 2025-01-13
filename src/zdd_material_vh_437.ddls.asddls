@AbapCatalog.sqlViewName: 'Z_MATERIALVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'CDS - Value Help'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'MaterialId'
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S
@ObjectModel.usageType.dataClass: #CUSTOMIZING

@VDM.viewType: #COMPOSITE
//@VDM.lifecycle.contract.type: #PUBLIC_LOCAL_API
@Search.searchable: true
define view ZDD_material_vh_437
  as select from zwareh_mat_437
{
      @ObjectModel.text.element:['Description']
  key material_id as MaterialId,
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
      @Consumption.hidden: true
  key language    as Language,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text:true
      description as Description
}
