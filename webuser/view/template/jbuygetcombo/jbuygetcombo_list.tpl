<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-jbuygetcombo').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div id="show-columns-prefrences" class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_columns_filter; ?></h3>
      </div>
      <div class="panel-body form-horizontal">
        <div class="row">
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="qty_buy" <?php if(in_array('qty_buy', $columns)) { ?>checked="checked"<?php } ?>  /> <?php echo $entry_qty_buy; ?></label>
            <?php if(in_array('qty_buy', $columns)) { ?>
            <input type="text" name="filter_qty_buy" value="<?php echo $filter_qty_buy; ?>" placeholder="<?php echo $entry_qty_buy; ?>" id="input-qty_buy" class="form-control" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="qty_get" <?php if(in_array('qty_get', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_qty_get; ?></label>
            <?php if(in_array('qty_get', $columns)) { ?>
            <input type="text" name="filter_qty_get" value="<?php echo $filter_qty_get; ?>" placeholder="<?php echo $entry_qty_get; ?>" id="input-qty_get" class="form-control" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="date_start" <?php if(in_array('date_start', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_date_start; ?></label>
            <?php if(in_array('date_start', $columns)) { ?>
            <div class="input-group date"><input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date_start" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>
            <?php } ?>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="buy_category" <?php if(in_array('buy_category', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_buy_category; ?></label>
            <?php if(in_array('buy_category', $columns)) { ?>
            <input type="text" name="filter_buy_category" value="<?php echo $filter_buy_category; ?>" placeholder="<?php echo $entry_buy_category; ?>" id="input-buy_category" class="form-control autofilter" data-id="category_id" data-controller="catalog/category/autocomplete" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="get_category" <?php if(in_array('get_category', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_get_category; ?></label>
            <?php if(in_array('get_category', $columns)) { ?>
            <input type="text" name="filter_get_category" value="<?php echo $filter_get_category; ?>" placeholder="<?php echo $entry_get_category; ?>" id="input-get_category" class="form-control autofilter" data-id="category_id" data-controller="catalog/category/autocomplete" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="date_end" <?php if(in_array('date_end', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_date_end; ?></label>
            <?php if(in_array('date_end', $columns)) { ?>
            <div class="input-group date"><input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date_end" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>
            <?php } ?>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="buy_product" <?php if(in_array('buy_product', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_buy_product; ?></label>
            <?php if(in_array('buy_product', $columns)) { ?>
            <input type="text" name="filter_buy_product" value="<?php echo $filter_buy_product; ?>" placeholder="<?php echo $entry_buy_product; ?>" id="input-buy_product" class="form-control autofilter" data-id="product_id" data-controller="catalog/product/autocomplete" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="get_product" <?php if(in_array('get_product', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_get_product; ?></label>
            <?php if(in_array('get_product', $columns)) { ?>
            <input type="text" name="filter_get_product" value="<?php echo $filter_get_product; ?>" placeholder="<?php echo $entry_get_product; ?>" id="input-get_product" class="form-control autofilter" data-id="product_id" data-controller="catalog/product/autocomplete" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="status" <?php if(in_array('status', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_status; ?></label>
            <?php if(in_array('status', $columns)) { ?>
            <select name="filter_status" id="input-status" class="form-control">
              <option value="*"></option>
              <?php if ($filter_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <?php } ?>
              <?php if (!$filter_status && !is_null($filter_status)) { ?>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
            <?php } ?>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="buy_manufacturer" <?php if(in_array('buy_manufacturer', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_buy_manufacturer; ?></label>
            <?php if(in_array('buy_manufacturer', $columns)) { ?>
            <input type="text" name="filter_buy_manufacturer" value="<?php echo $filter_buy_manufacturer; ?>" placeholder="<?php echo $entry_buy_manufacturer; ?>" id="input-buy_manufacturer" class="form-control autofilter" data-id="manufacturer_id" data-controller="catalog/manufacturer/autocomplete" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="get_manufacturer" <?php if(in_array('get_manufacturer', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_get_manufacturer; ?></label>
            <?php if(in_array('get_manufacturer', $columns)) { ?>
            <input type="text" name="filter_get_manufacturer" value="<?php echo $filter_get_manufacturer; ?>" placeholder="<?php echo $entry_get_manufacturer; ?>" id="input-get_manufacturer" class="form-control autofilter" data-id="manufacturer_id" data-controller="catalog/manufacturer/autocomplete" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="customer_group" <?php if(in_array('customer_group', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_customer_group; ?></label>
            <?php if(in_array('customer_group', $columns)) { ?>
            <select name="filter_customer_group" id="input-customer_group" class="form-control">
              <option value="*"></option>
              <?php foreach($customer_groups as $customer_group) { ?>
              <option value="<?php echo $customer_group['customer_group_id']; ?>" <?php if($filter_customer_group == $customer_group['customer_group_id']) { ?>selected="selected"<?php } ?>><?php echo $customer_group['name']; ?></option>
              <?php } ?>
            </select>
            <?php } ?>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="name" <?php if(in_array('name', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_name; ?></label>
            <?php if(in_array('name', $columns)) { ?>
            <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="discount" <?php if(in_array('discount', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_discount; ?></label>
            <?php if(in_array('discount', $columns)) { ?>
            <select name="filter_discount" id="input-discount" class="form-control">
              <option value="*"></option>
              <option value="free" <?php if($filter_discount=='free') { ?>selected="selected"<?php } ?>><?php echo $text_free; ?></option>
              <option value="fixed" <?php if($filter_discount=='fixed') { ?>selected="selected"<?php } ?>><?php echo $text_fixed; ?></option>
              <option value="percentage" <?php if($filter_discount=='percentage') { ?>selected="selected"<?php } ?>><?php echo $text_percentage; ?></option>
            </select>
            <?php } ?>
          </div>
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="stores" <?php if(in_array('stores', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_store; ?></label>
            <?php if(in_array('stores', $columns)) { ?>
            <select name="filter_stores" id="input-stores" class="form-control">
              <option value="*"></option>
              <?php foreach($stores as $store) { ?>
              <option value="<?php echo $store['store_id']; ?>" <?php if($filter_discount==$store['store_id']) { ?>selected="selected"<?php } ?>><?php echo $store['name']; ?></option>
              <?php } ?>
            </select>
            <?php } ?>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <label class="control-label"><input type="checkbox" name="columns[]" value="sort_order" <?php if(in_array('sort_order', $columns)) { ?>checked="checked"<?php } ?> /> <?php echo $entry_sort_order; ?></label>
            <?php if(in_array('sort_order', $columns)) { ?>
            <input type="text" name="filter_sort_order" value="<?php echo $filter_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort_order" class="form-control" />
            <?php } ?>
          </div>
        </div>
        <div class="form-group" style="border-top: none;">
          <div class="col-sm-12 text-right">
            <?php if(count($columns) > 0) { ?>
            <button type="button" id="button-filter" class="btn btn-primary"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            <?php } ?>
            <button type="button" id="button-preferences" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_preferences; ?></button>
          </div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-jbuygetcombo">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>

                  <?php if(in_array('name', $columns) || in_array('discount', $columns) || in_array('date_start', $columns) || in_array('date_end', $columns) || in_array('qty_buy', $columns) || in_array('qty_get', $columns)) { ?>
                  <td class="text-center"><?php echo $column_info; ?></td>
                  <?php } ?>

                  <?php if(in_array('buy_category', $columns) || in_array('buy_product', $columns) || in_array('buy_manufacturer', $columns) || in_array('get_category', $columns) || in_array('get_product', $columns) || in_array('get_manufacturer', $columns)) { ?>
                  <td class="text-center"><?php echo $column_getbuy; ?></td>
                  <?php } ?>
                  <?php if(in_array('sort_order', $columns)) { ?>
                  <td class="text-left"><?php if ($sort == 'a.sort_order') { ?>
                  <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                  <?php } ?></td>
                  <?php } ?>
                  <?php if(in_array('stores', $columns)) { ?>
                  <td class="text-left"><?php echo $column_store; ?></td>
                  <?php } ?>
                  <?php if(in_array('customer_group', $columns)) { ?>
                  <td class="text-left"><?php echo $column_customer_group; ?></td>
                  <?php } ?>
                  <?php if(in_array('status', $columns)) { ?>
                  <td class="text-left"><?php if ($sort == 'a.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <?php } ?>



                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($jbuygetcombos) { ?>
                <?php foreach ($jbuygetcombos as $jbuygetcombo) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($jbuygetcombo['jbuygetcombo_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $jbuygetcombo['jbuygetcombo_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $jbuygetcombo['jbuygetcombo_id']; ?>" />
                    <?php } ?></td>

                  <?php if(in_array('name', $columns) || in_array('discount', $columns) || in_array('date_start', $columns) || in_array('date_end', $columns) || in_array('qty_buy', $columns) || in_array('qty_get', $columns)) { ?>

                    <td class="text-center td-40">
                      <div class="table-responsive">
                        <table class="table table-bordered">
                          <?php if(in_array('name', $columns)) { ?>
                          <tr>
                            <td class="text-left"><?php if ($sort == 'a.name') { ?>
                              <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                              <?php } ?></td>
                              <td class="text-left"><?php echo $jbuygetcombo['name']; ?></td>
                          </tr>
                          <?php } ?>

                          <?php if(in_array('discount', $columns)) { ?>
                          <tr>
                            <td class="text-left"><?php if ($sort == 'a.discount_type') { ?>
                              <a href="<?php echo $sort_discount; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_discount; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_discount; ?>"><?php echo $column_discount; ?></a>
                              <?php } ?></td>
                            <td class="text-left">
                              <label><?php echo $column_discount_type; ?> :</label> <span><?php echo $jbuygetcombo['discount_text']; ?></span>
                              <?php if($jbuygetcombo['discount_type'] != 'free') { ?>
                              <br/>
                              <label><?php echo $column_discount_value; ?> :</label> <span><?php echo $jbuygetcombo['discount_value']; ?></span>
                              <?php } ?>
                            </td>
                          </tr>
                          <?php } ?>

                          <?php if(in_array('qty_buy', $columns)) { ?>
                          <tr>
                            <td class="text-left"><?php if ($sort == 'a.qty_buy') { ?>
                              <a href="<?php echo $sort_qty_buy; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_qty_buy; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_qty_buy; ?>"><?php echo $column_qty_buy; ?></a>
                              <?php } ?>
                            </td>
                            <td class="text-left"><?php echo $jbuygetcombo['qty_buy']; ?></td>
                          </tr>
                          <?php } ?>
                          <?php if(in_array('qty_get', $columns)) { ?>
                          <tr>
                            <td class="text-left"><?php if ($sort == 'a.qty_get') { ?>
                              <a href="<?php echo $sort_qty_get; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_qty_get; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_qty_get; ?>"><?php echo $column_qty_get; ?></a>
                              <?php } ?></td>
                              <td class="text-left"><?php echo $jbuygetcombo['qty_get']; ?></td>
                          </tr>
                          <?php } ?>

                          <?php if(in_array('date_start', $columns)) { ?>
                          <tr>
                            <td class="text-left"><?php echo $column_date_start; ?></td>
                            <td class="text-left"><span><?php echo $jbuygetcombo['date_start']; ?></span></td>
                          </tr>
                          <?php } ?>
                          <?php if(in_array('date_end', $columns)) { ?>
                          <tr>
                            <td class="text-left"><?php echo $column_date_end; ?></td>
                            <td class="text-left"><span><?php echo $jbuygetcombo['date_end']; ?></span></td>
                          </tr>
                          <?php } ?>
                          <tr>
                            <td class="text-left"><?php if ($sort == 'a.date_added') { ?>
                              <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                              <?php } ?>
                            </td>
                            <td class="text-left"><?php echo $jbuygetcombo['date_added']; ?></td>
                          </tr>
                          <tr>
                            <td class="text-left"><?php if ($sort == 'a.date_modified') { ?>
                              <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                              <?php } else { ?>
                              <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                              <?php } ?>
                            </td>
                            <td class="text-left"><?php echo $jbuygetcombo['date_modified']; ?></td>
                          </tr>
                        </table>
                      </div>
                    </td>
                  <?php } ?>

                  <?php if(in_array('buy_category', $columns) || in_array('buy_product', $columns) || in_array('buy_manufacturer', $columns) || in_array('get_category', $columns) || in_array('get_product', $columns) || in_array('get_manufacturer', $columns)) { ?>
                  <td class="text-left">
                    <?php if(in_array('buy_category', $columns) || in_array('buy_product', $columns) || in_array('buy_manufacturer', $columns)) { ?>
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <?php if(in_array('buy_category', $columns)) { ?>
                          <td><?php echo $column_buy_category; ?></td>
                          <?php } ?>
                          <?php if(in_array('buy_product', $columns)) { ?>
                          <td><?php echo $column_buy_product; ?></td>
                          <?php } ?>
                          <?php if(in_array('buy_manufacturer', $columns)) { ?>
                          <td><?php echo $column_buy_manufacturer; ?></td>
                          <?php } ?>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <?php if(in_array('buy_category', $columns)) { ?>
                          <td>
                            <?php foreach($jbuygetcombo['buy_categories'] as $buy_category) { ?>
                              <label><?php echo $buy_category['name']; ?></label> <br/>
                            <?php } ?>
                          </td>
                          <?php } ?>
                          <?php if(in_array('buy_product', $columns)) { ?>
                          <td>
                            <?php foreach($jbuygetcombo['buy_products'] as $buy_product) { ?>
                              <label><?php echo $buy_product['name']; ?></label> <br/>
                            <?php } ?>
                          </td>
                          <?php } ?>
                          <?php if(in_array('buy_manufacturer', $columns)) { ?>
                          <td>
                            <?php foreach($jbuygetcombo['buy_manufacturers'] as $buy_manufacturer) { ?>
                              <label><?php echo $buy_manufacturer['name']; ?></label> <br/>
                            <?php } ?>
                          </td>
                          <?php } ?>
                        </tr>
                      </tbody>
                    </table>
                    <?php } ?>
                    <?php if(in_array('get_category', $columns) || in_array('get_product', $columns) || in_array('get_manufacturer', $columns)) { ?>
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <?php if(in_array('get_category', $columns)) { ?>
                          <td><?php echo $column_get_category; ?></td>
                          <?php } ?>
                          <?php if(in_array('get_product', $columns)) { ?>
                          <td><?php echo $column_get_product; ?></td>
                          <?php } ?>
                          <?php if(in_array('get_manufacturer', $columns)) { ?>
                          <td><?php echo $column_get_manufacturer; ?></td>
                          <?php } ?>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <?php if(in_array('get_category', $columns)) { ?>
                          <td>
                            <?php foreach($jbuygetcombo['get_categories'] as $get_category) { ?>
                              <label><?php echo $get_category['name']; ?></label> <br/>
                            <?php } ?>
                          </td>
                          <?php } ?>
                          <?php if(in_array('get_product', $columns)) { ?>
                          <td>
                            <?php foreach($jbuygetcombo['get_products'] as $get_product) { ?>
                              <label><?php echo $get_product['name']; ?></label> <br/>
                            <?php } ?>
                          </td>
                          <?php } ?>
                          <?php if(in_array('get_manufacturer', $columns)) { ?>
                          <td>
                            <?php foreach($jbuygetcombo['get_manufacturers'] as $get_manufacturer) { ?>
                              <label><?php echo $get_manufacturer['name']; ?></label> <br/>
                            <?php } ?>
                          </td>
                          <?php } ?>
                        </tr>
                      </tbody>
                    </table>
                    <?php } ?>
                  </td>
                  <?php } ?>
                  <?php if(in_array('sort_order', $columns)) { ?>
                  <td class="text-left"><?php echo $jbuygetcombo['sort_order']; ?></td>
                  <?php } ?>
                  <?php if(in_array('stores', $columns)) { ?>
                  <td class="text-left">
                  <?php foreach($jbuygetcombo['stores'] as $store) { ?>
                    <label><?php echo $store['name']; ?></label> <br/>
                  <?php } ?>
                  </td>
                  <?php } ?>
                  <?php if(in_array('customer_group', $columns)) { ?>
                  <td class="text-left">
                  <?php foreach($jbuygetcombo['customer_groups'] as $customer_group) { ?>
                    <label><?php echo $customer_group['name']; ?></label> <br/>
                  <?php } ?>
                  </td>
                  <?php } ?>
                  <?php if(in_array('status', $columns)) { ?>
                  <td class="text-left"><label class="label <?php if($jbuygetcombo['rstatus']==1) { ?>label-success<?php } else { ?>label-danger<?php } ?>"><?php echo $jbuygetcombo['status']; ?></label></td>
                  <?php } ?>
                  <td class="text-right"><a href="<?php echo $jbuygetcombo['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="12"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <style type="text/css">
    .td-40 table td:first-child { width: 40%;  }
  </style>
  <script type="text/javascript">
    $('#button-preferences').on('click', function() {
      var data = $('#show-columns-prefrences input[type="checkbox"]').serialize();
      var $this = $(this);
      $.ajax({
        url: 'index.php?route=jbuygetcombo/jbuygetcombo/showHideColumnPreferences&<?php echo $JocToken; ?>=<?php echo $token; ?>',
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
          $this.button('loading');
        },
        complete: function() {
          $this.button('reset');
        },
        success: function(json) {

          if (json['error'] && json['update']==0) {
            $('#show-columns-prefrences').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

            var offset = $('#show-columns-prefrences').offset();

            $('html, body').animate({ scrollTop: (offset.top - 70) }, 'slow');

            setTimeout(function(){
              window.location.reload();
            }, 2000);
          }

          if (json['success'] && json['update']==1) {
            $('#show-columns-prefrences').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

            var offset = $('#show-columns-prefrences').offset();

            $('html, body').animate({ scrollTop: (offset.top - 70) }, 'slow');

            setTimeout(function(){
              window.location.reload();
            }, 2000);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    });

    <?php if(in_array('buy_category', $columns) || in_array('buy_product', $columns) || in_array('buy_manufacturer', $columns) || in_array('get_category', $columns) || in_array('get_product', $columns) || in_array('get_manufacturer', $columns)) { ?>
    $('.autofilter').each(function() {

      var $this = $(this);
      var name = $(this).attr('name');
      var controller = $(this).attr('data-controller');
      var id = $(this).attr('data-id');

      $('input[name=\''+ name +'\']').autocomplete({
        'source': function(request, response) {
          $.ajax({
            url: 'index.php?route='+ controller +'&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
            dataType: 'json',
            success: function(json) {
              json.unshift({
                [id] : 0,
                ['name'] : '<?php echo $text_none; ?>'
              });

              response($.map(json, function(item) {
                return {
                  label: item['name'],
                  value: item[id]
                }
              }));
            }
          });
        },
        'select': function(item) {
          console.log(item);
          $('input[name=\''+ name +'\']').val(item['label']);
        }
      });
    });
    <?php } ?>
    <?php if(count($columns) > 0) { ?>
    $('#button-filter').on('click', function() {
      var url = 'index.php?route=jbuygetcombo/jbuygetcombo&<?php echo $JocToken; ?>=<?php echo $token; ?>';

      <?php if(in_array('qty_buy', $columns)) { ?>
      var filter_qty_buy = $('input[name=\'filter_qty_buy\']').val();

      if (filter_qty_buy) {
        url += '&filter_qty_buy=' + encodeURIComponent(filter_qty_buy);
      }
      <?php } ?>
      <?php if(in_array('qty_get', $columns)) { ?>
      var filter_qty_get = $('input[name=\'filter_qty_get\']').val();

      if (filter_qty_get) {
        url += '&filter_qty_get=' + encodeURIComponent(filter_qty_get);
      }
      <?php } ?>
      <?php if(in_array('date_start', $columns)) { ?>
      var filter_date_start = $('input[name=\'filter_date_start\']').val();

      if (filter_date_start) {
        url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
      }
      <?php } ?>
      <?php if(in_array('date_end', $columns)) { ?>
      var filter_date_end = $('input[name=\'filter_date_end\']').val();

      if (filter_date_end) {
        url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
      }
      <?php } ?>
      <?php if(in_array('name', $columns)) { ?>
      var filter_name = $('input[name=\'filter_name\']').val();

      if (filter_name) {
        url += '&filter_name=' + encodeURIComponent(filter_name);
      }
      <?php } ?>
      <?php if(in_array('buy_category', $columns)) { ?>
      var filter_buy_category = $('input[name=\'filter_buy_category\']').val();

      if (filter_buy_category) {
        url += '&filter_buy_category=' + encodeURIComponent(filter_buy_category);
      }
      <?php } ?>
      <?php if(in_array('buy_product', $columns)) { ?>
      var filter_buy_product = $('input[name=\'filter_buy_product\']').val();

      if (filter_buy_product) {
        url += '&filter_buy_product=' + encodeURIComponent(filter_buy_product);
      }
      <?php } ?>
      <?php if(in_array('buy_manufacturer', $columns)) { ?>
      var filter_buy_manufacturer = $('input[name=\'filter_buy_manufacturer\']').val();

      if (filter_buy_manufacturer) {
        url += '&filter_buy_manufacturer=' + encodeURIComponent(filter_buy_manufacturer);
      }
      <?php } ?>
      <?php if(in_array('stores', $columns)) { ?>
      var filter_stores = $('select[name=\'filter_stores\']').val();

      if (filter_stores != '*') {
        url += '&filter_stores=' + encodeURIComponent(filter_stores);
      }
      <?php } ?>

      <?php if(in_array('sort_order', $columns)) { ?>
      var filter_sort_order = $('input[name=\'filter_sort_order\']').val();

      if (filter_sort_order) {
        url += '&filter_sort_order=' + encodeURIComponent(filter_sort_order);
      }
      <?php } ?>
      <?php if(in_array('customer_group', $columns)) { ?>
      var filter_customer_group = $('select[name=\'filter_customer_group\']').val();

      if (filter_customer_group != '*') {
        url += '&filter_customer_group=' + encodeURIComponent(filter_customer_group);
      }
      <?php } ?>
      <?php if(in_array('status', $columns)) { ?>
      var filter_status = $('select[name=\'filter_status\']').val();

      if (filter_status != '*') {
        url += '&filter_status=' + encodeURIComponent(filter_status);
      }
      <?php } ?>
      <?php if(in_array('get_category', $columns)) { ?>
      var filter_get_category = $('input[name=\'filter_get_category\']').val();

      if (filter_get_category) {
        url += '&filter_get_category=' + encodeURIComponent(filter_get_category);
      }
      <?php } ?>
      <?php if(in_array('get_product', $columns)) { ?>
      var filter_get_product = $('input[name=\'filter_get_product\']').val();

      if (filter_get_product) {
        url += '&filter_get_product=' + encodeURIComponent(filter_get_product);
      }
      <?php } ?>
      <?php if(in_array('get_manufacturer', $columns)) { ?>
      var filter_get_manufacturer = $('input[name=\'filter_get_manufacturer\']').val();

      if (filter_get_manufacturer) {
        url += '&filter_get_manufacturer=' + encodeURIComponent(filter_get_manufacturer);
      }
      <?php } ?>
      <?php if(in_array('discount', $columns)) { ?>
      var filter_discount = $('select[name=\'filter_discount\']').val();

      if (filter_discount != '*') {
        url += '&filter_discount=' + encodeURIComponent(filter_discount);
      }
      <?php } ?>
      location = url;
    });
    <?php } ?>
  </script>
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
  $('.date').datetimepicker({
    pickTime: false
  });
  //--></script>
</div>
<?php echo $footer; ?>
