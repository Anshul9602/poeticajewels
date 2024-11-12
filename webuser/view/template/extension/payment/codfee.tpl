<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-codfee" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-codfee" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-addfee" data-toggle="tab"><?php echo $tab_addfee; ?></a></li>
            <li><a href="#tab-support" data-toggle="tab"><i class="fa fa-support"></i> <?php echo $tab_support; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                <div class="col-sm-10">
                  <select name="codfee_order_status_id" id="input-order-status" class="form-control">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $codfee_order_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                <div class="col-sm-10">
                  <select name="codfee_geo_zone_id" id="input-geo-zone" class="form-control">
                    <option value="0"><?php echo $text_all_zones; ?></option>
                    <?php foreach ($geo_zones as $geo_zone) { ?>
                    <?php if ($geo_zone['geo_zone_id'] == $codfee_geo_zone_id) { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-exclude_shipping"><span data-toggle="tooltip" title="<?php echo $help_exclude_shipping; ?>"><?php echo $entry_exclude_shipping; ?></span></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach($shippingmethods as $shippingmethod) { ?>
                    <div class="checkbox"><label><input type="checkbox" name="codfee_exclude_shipping[]" value="<?php echo $shippingmethod['code']; ?>" <?php if(in_array($shippingmethod['code'], $codfee_exclude_shipping)) { ?>checked="checked"<?php } ?> /> <?php echo $shippingmethod['name']; ?></label></div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="codfee_status" id="input-status" class="form-control">
                    <?php if ($codfee_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="codfee_sort_order" value="<?php echo $codfee_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-addfee">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                <div class="col-sm-3">
                  <select name="codfee_tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $codfee_tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-type"><span data-toggle="tooltip" title="<?php echo $help_type; ?>"><?php echo $entry_type; ?></span></label>
                <div class="col-sm-3">
                  <select name="codfee_type" id="input-type" class="form-control">
                    <?php if ($codfee_type == 'P') { ?>
                    <option value="P" selected="selected"><?php echo $text_percent; ?></option>
                    <?php } else { ?>
                    <option value="P"><?php echo $text_percent; ?></option>
                    <?php } ?>
                    <?php if ($codfee_type == 'F') { ?>
                    <option value="F" selected="selected"><?php echo $text_amount; ?></option>
                    <?php } else { ?>
                    <option value="F"><?php echo $text_amount; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="table-responsive">
              <table id="codfee" class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $column_rules; ?></td>
                    <td class="text-left"><?php echo $column_addfee; ?></td>
                    <td class="text-left"></td>
                  </tr>
                </thead>
                <tbody id="tbody">
                 <?php $codfee_total_row = 0; ?>
                    <?php foreach ($codfee_totals as $codfee_total ) { ?>
                    <tr id="codfee-row<?php echo $codfee_total_row; ?>">

                      <td class="text-left" width="70%">
                        <table class="table table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left"><?php echo $column_totalvalue; ?></td>
                            </tr>
                            </thead>
                          <tbody>
                            <tr>
                              <td class="text-left">
                                <div class="input-group">
                                  <input type="text" name="codfee_total[<?php echo $codfee_total_row; ?>][from_total]" value="<?php echo $codfee_total['from_total']; ?>" placeholder="<?php echo $entry_from; ?>" class="form-control" />
                                  <span class="input-group-btn"><a class="btn btn-info" type="button"><?php echo $text_to; ?></a></span>
                                  <input type="text" name="codfee_total[<?php echo $codfee_total_row; ?>][to_total]" value="<?php echo $codfee_total['to_total']; ?>" placeholder="<?php echo $entry_to; ?>" class="form-control" />
                                </div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <table class="table table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left"><span data-toggle="tooltip" title="<?php echo $help_customergroups; ?>"><?php echo $column_customergroups; ?></span></td>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td class="text-left">
                                <div class="well well-sm" style="height: 150px; overflow: auto;">
                                  <?php foreach($customergroups as $customergroup) { ?>
                                  <div class="checkbox"><label><input type="checkbox" name="codfee_total[<?php echo $codfee_total_row; ?>][customergroup][]" value="<?php echo $customergroup['customer_group_id']; ?>" <?php if( isset($codfee_total['customergroup']) && in_array($customergroup['customer_group_id'], $codfee_total['customergroup'])) { ?>checked="checked"<?php } ?> /> <?php echo $customergroup['name']; ?></label></div>
                                  <?php } ?>
                                </div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>

                      <td class="text-right" width="15%"><input type="text" name="codfee_total[<?php echo $codfee_total_row; ?>][fee]" value="<?php echo $codfee_total['fee']; ?>" placeholder="<?php echo $entry_fee; ?>" class="form-control" /></td>
                      <td class="text-left" width="15%"><button type="button" onclick="$('#codfee-row<?php echo $codfee_total_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $codfee_total_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>

                      <td colspan="2"></td>

                      <td class="text-left"><button type="button" onclick="addCodFee();" data-toggle="tooltip" title="<?php echo $button_codfee_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-support">
              <div class="card-deck mb-3 text-center">
                <div class="card mb-4 shadow-sm">
                  <div class="card-header">
                    <h4 class="my-0 font-weight-normal">Support</h4>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title pricing-card-title">For Support Send E-mail at <big class="text-muted">extensionstudio.oc@gmail.com</big></h4>
                    <a target="_BLANK" href="https://www.opencart.com/index.php?route=marketplace/extension&filter_member=ExtensionStudio" class="btn btn-lg btn-primary">View Other Extensions</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--
var codfee_total_row = <?php echo $codfee_total_row; ?>;

function addCodFee() {
  html  = '<tr id="codfee-row' + codfee_total_row + '">';

    html += '<td class="text-left" width="70%">';
      html += '<table class="table table-bordered table-hover">';
        html += '<thead>';
        html += '<tr>';
          html += '<td class="text-left"><?php echo $column_totalvalue; ?></td>';
        html += '</tr>';
        html += '</thead>';
        html += '<tbody>';
        html += '<tr>';
          html += '  <td class="text-left"><div class="input-group"><input type="text" name="codfee_total[' + codfee_total_row + '][from_total]" value="" placeholder="<?php echo $entry_from; ?>" class="form-control" /><span class="input-group-btn"><button class="btn btn-info radius-zero" type="button"><?php echo $text_to; ?></button></span><input type="text" name="codfee_total[' + codfee_total_row + '][to_total]" value="" placeholder="<?php echo $entry_to; ?>" class="form-control" /></div></td>';
        html += '</tr>';
        html += '</tbody>';
      html += '</table>';
      html += '<table class="table table-bordered table-hover">';
        html += '</tbody>';
        html += '<thead>';
        html += '<tr>';
          html += '<td class="text-left"><span data-toggle="tooltip" title="<?php echo $help_customergroups; ?>"><?php echo $column_customergroups; ?></span></td>';
        html += '</tr>';
        html += '</thead>';
        html += '<tbody>';
        html += '<tr>';
          html += '  <td class="text-left"><div class="well well-sm" style="height: 150px; overflow: auto;"><?php foreach($customergroups as $customergroup) { ?><div class="checkbox"><label><input type="checkbox" name="codfee_total[' + codfee_total_row + '][customergroup][]" value="<?php echo $customergroup['customer_group_id']; ?>" /> <?php echo $customergroup['name']; ?></label></div><?php } ?></div></td>';
        html += '</tr>';
        html += '</tbody>';
      html += '</table>';
    html += '</td>';

    html += '  <td class="text-right" width="15%"><input type="text" name="codfee_total[' + codfee_total_row + '][fee]" value="" placeholder="<?php echo $entry_fee; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" width="15%"><button type="button" onclick="$(\'#codfee-row' + codfee_total_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#codfee > tbody').append(html);

  $('[data-toggle=\'tooltip\']').tooltip({
    container: 'body',
    html: true
  });

  codfee_total_row++;
}
//--></script>
<style type="text/css">
.radius-zero {
  border-radius: 0;
}
</style>
</div>
<?php echo $footer; ?>