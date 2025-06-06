@AbapCatalog.sqlViewName: 'ZI_MATNR_LIST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material list cds'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #BASIC // Cái này cần có để hiển thị đc F4 help khi search
define view ZI_MATNR
    as select from zjh_mara
{
  key matnr       as Matnr,
      description as Description
}
