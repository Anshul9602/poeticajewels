<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-jbuygetcombo" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-jbuygetcombo" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general; ?></a></li>
            <li><a href="#tab-getbuy" data-toggle="tab"><i class="fa fa-shopping-cart"></i> <?php echo $tab_getbuy; ?></a></li>
            <li><a href="#tab-description" data-toggle="tab"><i class="fa fa-language"></i> <?php echo $tab_description; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group">
                <label class="col-sm-12 control-label j-control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-12">
                  <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-primary <?php if ($status) { ?>active<?php } ?>"><input type="radio" name="status" value="1" <?php if ($status) { ?>checked="checked"<?php } ?> /> <?php echo $text_enabled; ?></label>
                    <label class="btn btn-primary <?php if (!$status) { ?>active<?php } ?>"><input type="radio" name="status" value="0" <?php if (!$status) { ?>checked="checked"<?php } ?> /> <?php echo $text_disabled; ?></label>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <div class="col-sm-12">
                      <input type="text" name="name" id="input-name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                      <?php if ($error_name) { ?>
                      <div class="text-danger"><?php echo $error_name; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12">
                  <div class="form-group">
                    <label class="col-sm-12 control-label j-control-label" for="input-entry_sort_order"><?php echo $entry_sort_order; ?></label>
                    <div class="col-sm-12">
                      <input type="text" name="sort_order" id="input-sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-12 control-label j-control-label" for="input-discount"><?php echo $entry_discount; ?></label>
                <div class="col-sm-12">
                  <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-primary <?php if ($discount_type=='fixed') { ?>active<?php } ?>"><input type="radio" name="discount_type" value="fixed" <?php if ($discount_type=='fixed') { ?>checked="checked"<?php } ?> /> <?php echo $text_fixed; ?></label>
                    <label class="btn btn-primary <?php if ($discount_type=='free') { ?>active<?php } ?>"><input type="radio" name="discount_type" value="free" <?php if ($discount_type=='free') { ?>checked="checked"<?php } ?> /> <?php echo $text_free; ?></label>
                    <label class="btn btn-primary <?php if ($discount_type=='percent') { ?>active<?php } ?>"><input type="radio" name="discount_type" value="percent" <?php if ($discount_type=='percent') { ?>checked="checked"<?php } ?> /> <?php echo $text_percentage; ?></label>
                  </div>

                </div>
              </div>
              <div class="form-group required discount_value <?php if($discount_type=='free') { ?>hide<?php } ?>">
                <label class="col-sm-12 control-label j-control-label" for="input-discount_value"><?php echo $entry_discount_value; ?></label>
                <div class="col-sm-12">
                  <input type="text" name="discount_value" id="input-discount_value" value="<?php echo $discount_value; ?>" placeholder="<?php echo $entry_discount_value; ?>" class="form-control" />
                  <?php if ($error_discount_value) { ?>
                  <div class="text-danger"><?php echo $error_discount_value; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label" for="input-qty_buy"><?php echo $entry_qty_buy; ?></label>
                    <div class="col-sm-12">
                      <input type="text" name="qty_buy" id="input-qty_buy" value="<?php echo $qty_buy; ?>" placeholder="<?php echo $entry_qty_buy; ?>" class="form-control" />
                      <?php if ($error_qty_buy) { ?>
                      <div class="text-danger"><?php echo $error_qty_buy; ?></div>
                      <?php } ?>
                    </div>
                  </div>

                </div>
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label" for="input-qty_get"><?php echo $entry_qty_get; ?></label>
                    <div class="col-sm-12">
                      <input type="text" name="qty_get" id="input-qty_get" value="<?php echo $qty_get; ?>" placeholder="<?php echo $entry_qty_get; ?>" class="form-control" />
                      <?php if ($error_qty_get) { ?>
                      <div class="text-danger"><?php echo $error_qty_get; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label" for="input-date_start"><?php echo $entry_date_start; ?></label>
                    <div class="col-sm-12">
                      <div class="input-group date">
                        <input type="text" name="date_start" value="<?php echo $date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date_start" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span>
                      </div>
                      <?php if ($error_date_start) { ?>
                      <div class="text-danger"><?php echo $error_date_start; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12">
                  <div class="form-group">
                    <label class="col-sm-12 control-label j-control-label" for="input-date_end"><?php echo $entry_date_end; ?></label>
                    <div class="col-sm-12">
                      <div class="input-group date">
                        <input type="text" name="date_end" value="<?php echo $date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date_end" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label"><?php echo $entry_store; ?></label>
                    <div class="col-sm-12">
                      <div class="well well-sm" style="height: 150px; overflow: auto;">
                        <?php foreach ($stores as $store_) { ?>
                        <div class="checkbox">
                          <label>
                            <?php if (in_array($store_['store_id'], $store)) { ?>
                            <input type="checkbox" name="store[]" value="<?php echo $store_['store_id']; ?>" checked="checked" />
                            <?php echo $store_['name']; ?>
                            <?php } else { ?>
                            <input type="checkbox" name="store[]" value="<?php echo $store_['store_id']; ?>" />
                            <?php echo $store_['name']; ?>
                            <?php } ?>
                          </label>
                        </div>
                        <?php } ?>
                      </div>

                      <label class="selectall label label-default"><?php echo $text_selectall; ?></label> &nbsp;&nbsp; <label class="deselectall label label-default"><?php echo $text_deselectall; ?></label>

                      <?php if ($error_store) { ?>
                      <div class="text-danger"><?php echo $error_store; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label"><?php echo $entry_customer_group; ?></label>
                    <div class="col-sm-12">
                      <div class="well well-sm" style="height: 150px; overflow: auto;">
                        <?php foreach ($customer_groups as $customer_group_) { ?>
                        <div class="checkbox">
                          <label>
                            <?php if (in_array($customer_group_['customer_group_id'], $customer_group)) { ?>
                            <input type="checkbox" name="customer_group[]" value="<?php echo $customer_group_['customer_group_id']; ?>" checked="checked" />
                            <?php echo $customer_group_['name']; ?>
                            <?php } else { ?>
                            <input type="checkbox" name="customer_group[]" value="<?php echo $customer_group_['customer_group_id']; ?>" />
                            <?php echo $customer_group_['name']; ?>
                            <?php } ?>
                          </label>
                        </div>
                        <?php } ?>
                      </div>
                      <label class="selectall label label-default"><?php echo $text_selectall; ?></label> &nbsp;&nbsp; <label class="deselectall label label-default"><?php echo $text_deselectall; ?></label>
                      <?php if ($error_customer_group) { ?>
                      <div class="text-danger"><?php echo $error_customer_group; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-getbuy">
              <fieldset>
                <legend><?php echo $legend_buy; ?></legend>
                <div class="row">
                  <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-buy_category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_buy_category; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="buycategory" value="" placeholder="<?php echo $entry_buy_category; ?>" id="input-buy_category" class="form-control" />
                        <div id="buy-category" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($buy_categories as $buy_category) { ?>
                          <div id="buy-category<?php echo $buy_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $buy_category['name']; ?>
                            <input type="hidden" name="buy_category[]" value="<?php echo $buy_category['category_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-buy_product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_buy_product; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="buyproduct" value="" placeholder="<?php echo $entry_buy_product; ?>" id="input-buy_product" class="form-control" />
                        <div id="buy-product" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($buy_products as $buy_product) { ?>
                          <div id="buy-product<?php echo $buy_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $buy_product['name']; ?>
                            <input type="hidden" name="buy_product[]" value="<?php echo $buy_product['product_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-buy_manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_buy_manufacturer; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="buymanufacturer" value="" placeholder="<?php echo $entry_buy_manufacturer; ?>" id="input-buy_manufacturer" class="form-control" />
                        <div id="buy-manufacturer" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($buy_manufacturers as $buy_manufacturer) { ?>
                          <div id="buy-manufacturer<?php echo $buy_manufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $buy_manufacturer['name']; ?>
                            <input type="hidden" name="buy_manufacturer[]" value="<?php echo $buy_manufacturer['manufacturer_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php if ($error_buy_item) { ?>
                <div class="text-danger"><?php echo $error_buy_item; ?></div>
                <?php } ?>
              </fieldset>
              <fieldset>
                <legend><?php echo $legend_get; ?></legend>
                <div class="row">
                  <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-get_category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_get_category; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="getcategory" value="" placeholder="<?php echo $entry_get_category; ?>" id="input-get_category" class="form-control" />
                        <div id="get-category" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($get_categories as $get_category) { ?>
                          <div id="get-category<?php echo $get_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $get_category['name']; ?>
                            <input type="hidden" name="get_category[]" value="<?php echo $get_category['category_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-get_product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_get_product; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="getproduct" value="" placeholder="<?php echo $entry_get_product; ?>" id="input-get_product" class="form-control" />
                        <div id="get-product" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($get_products as $get_product) { ?>
                          <div id="get-product<?php echo $get_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $get_product['name']; ?>
                            <input type="hidden" name="get_product[]" value="<?php echo $get_product['product_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-12">
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-get_manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_get_manufacturer; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="getmanufacturer" value="" placeholder="<?php echo $entry_get_manufacturer; ?>" id="input-get_manufacturer" class="form-control" />
                        <div id="get-manufacturer" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($get_manufacturers as $get_manufacturer) { ?>
                          <div id="get-manufacturer<?php echo $get_manufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $get_manufacturer['name']; ?>
                            <input type="hidden" name="get_manufacturer[]" value="<?php echo $get_manufacturer['manufacturer_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php if ($error_get_item) { ?>
                <div class="text-danger"><?php echo $error_get_item; ?></div>
                <?php } ?>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-description">
              <div class="row">
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label"><?php echo $entry_text_ribbon; ?></label>
                    <div class="col-sm-12">
                      <?php foreach ($languages as $language) { ?>
                      <div class="input-group"><span class="input-group-addon"><img src="<?php echo $language['lang_flag']; ?>" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="description[<?php echo $language['language_id']; ?>][text_ribbon]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['text_ribbon'] : ''; ?>" placeholder="<?php echo $entry_text_ribbon; ?>" class="form-control" />
                      </div>
                      <?php if (isset($error_description[$language['language_id']]['text_ribbon'])) { ?>
                      <div class="text-danger"><?php echo $error_description[$language['language_id']]['text_ribbon']; ?></div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12">
                  <div class="form-group required">
                    <label class="col-sm-12 control-label j-control-label"><?php echo $entry_text_order_total; ?></label>
                    <div class="col-sm-12">
                      <?php foreach ($languages as $language) { ?>
                      <div class="input-group"><span class="input-group-addon"><img src="<?php echo $language['lang_flag']; ?>" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="description[<?php echo $language['language_id']; ?>][text_order_total]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['text_order_total'] : ''; ?>" placeholder="<?php echo $entry_text_order_total; ?>" class="form-control" />
                      </div>
                      <?php if (isset($error_description[$language['language_id']]['text_order_total'])) { ?>
                      <div class="text-danger"><?php echo $error_description[$language['language_id']]['text_order_total']; ?></div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
              <fieldset>
                <legend><?php echo $legend_description; ?></legend>
                <div class="form-group">
                  <label class="col-sm-12 control-label j-control-label" for="input-buyget_position"><?php echo $entry_buyget_position; ?></label>
                  <div class="col-sm-12">
                    <select name="position" id="input-buyget_position" class="form-control">
                      <option value="tab_description_above" <?php if ($position=='tab_description_above') { ?>selected="selected"<?php } ?>><?php echo $text_tab_description_above; ?></option>
                      <option value="as_popup" <?php if ($position=='as_popup') { ?>selected="selected"<?php } ?>><?php echo $text_as_popup; ?></option>
                      <option value="tab_description_inside" <?php if ($position=='tab_description_inside') { ?>selected="selected"<?php } ?>><?php echo $text_tab_description_inside; ?></option>
                    </select>
                  </div>
                </div>
                <div class="row position_text position_popup" <?php if($position!='as_popup') { ?>style="display: none;"<?php } ?>>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group required">
                      <label class="col-sm-12 control-label j-control-label"><?php echo $entry_text_popup_btn; ?></label>
                      <div class="col-sm-12">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="<?php echo $language['lang_flag']; ?>" title="<?php echo $language['name']; ?>" /></span>
                          <input type="text" name="description[<?php echo $language['language_id']; ?>][text_popup_btn]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['text_popup_btn'] : ''; ?>" placeholder="<?php echo $entry_text_popup_btn; ?>" class="form-control" />
                        </div>
                        <?php if (isset($error_description[$language['language_id']]['text_popup_btn'])) { ?>
                        <div class="text-danger"><?php echo $error_description[$language['language_id']]['text_popup_btn']; ?></div>
                        <?php } ?>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group required">
                      <label class="col-sm-12 control-label j-control-label"><?php echo $entry_text_popup_btn_close; ?></label>
                      <div class="col-sm-12">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="<?php echo $language['lang_flag']; ?>" title="<?php echo $language['name']; ?>" /></span>
                          <input type="text" name="description[<?php echo $language['language_id']; ?>][text_popup_btn_close]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['text_popup_btn_close'] : ''; ?>" placeholder="<?php echo $entry_text_popup_btn_close; ?>" class="form-control" />
                        </div>
                        <?php if (isset($error_description[$language['language_id']]['text_popup_btn_close'])) { ?>
                        <div class="text-danger"><?php echo $error_description[$language['language_id']]['text_popup_btn_close']; ?></div>
                        <?php } ?>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group required position_text position_tab" <?php if($position!='tab_description_inside') { ?>style="display: none;"<?php } ?>>
                  <label class="col-sm-12 control-label j-control-label"><?php echo $entry_text_tab; ?></label>
                  <div class="col-sm-12">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"><img src="<?php echo $language['lang_flag']; ?>" title="<?php echo $language['name']; ?>" /></span>
                      <input type="text" name="description[<?php echo $language['language_id']; ?>][text_tab]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['text_tab'] : ''; ?>" placeholder="<?php echo $entry_text_tab; ?>" class="form-control" />
                    </div>
                    <?php if (isset($error_description[$language['language_id']]['text_tab'])) { ?>
                    <div class="text-danger"><?php echo $error_description[$language['language_id']]['text_tab']; ?></div>
                    <?php } ?>
                    <?php } ?>
                  </div>
                </div>
                <ul class="nav nav-tabs" id="language">
                  <?php foreach ($languages as $language) { ?>
                  <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="<?php echo $language['lang_flag']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                  <?php } ?>
                </ul>
                <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                    <div class="form-group required">
                      <label class="col-sm-12 control-label j-control-label" for="input-combo_title<?php echo $language['language_id']; ?>"><?php echo $entry_combo_title; ?></label>
                      <div class="col-sm-12">
                        <input type="text" name="description[<?php echo $language['language_id']; ?>][combo_title]" value="<?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['combo_title'] : ''; ?>" placeholder="<?php echo $entry_combo_title; ?>" id="input-combo_title<?php echo $language['language_id']; ?>" class="form-control" />
                        <?php if (isset($error_description[$language['language_id']]['combo_title'])) { ?>
                        <div class="text-danger"><?php echo $error_description[$language['language_id']]['combo_title']; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label j-control-label" for="input-combo_description<?php echo $language['language_id']; ?>"><?php echo $entry_combo_description; ?></label>
                      <div class="col-sm-12">
                        <textarea name="description[<?php echo $language['language_id']; ?>][combo_description]" placeholder="<?php echo $entry_combo_description; ?>" id="input-combo_description<?php echo $language['language_id']; ?>" class="form-control summernote" data-toggle="summernote" data-lang="<?php echo $summernote; ?>"><?php echo isset($description[$language['language_id']]) ? $description[$language['language_id']]['combo_description'] : ''; ?></textarea>
                      </div>
                    </div>
                  </div>
                  <?php } ?>
                </div>
              </fieldset>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <style type="text/css">
    .j-control-label { text-align: left !important;  }
  </style>
  <?php echo $summernote_editor; ?>

  <script type="text/javascript">
    $('input[name="discount_type"]').on('change', function() {
      if($(this).val() != 'free' ) {
        $('.discount_value').show('slow');
      } else {
        $('.discount_value').hide('slow');
      }
    });

    $('#input-buyget_position').on('change', function() {

      $('.position_text').hide('slow');

      if($(this).val() == 'tab_description_inside' ) {
        $('.position_tab').show('slow');
      }
      if($(this).val() == 'as_popup' ) {
        $('.position_popup').show('slow');
      }
    });

    $('.selectall').on('click',function(){
      $(this).prev('div').find('input[type="checkbox"]').prop('checked',true);
    })

    $('.deselectall').on('click',function(){
      $(this).prevAll('div').find('input[type="checkbox"]').prop('checked',false);
    });

    // Buy Category
    $('input[name=\'buycategory\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/category/autocomplete&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['category_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'buycategory\']').val('');

        $('#buy-category' + item['value']).remove();

        $('#buy-category').append('<div id="buy-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="buy_category[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#buy-category').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Buy Product
    $('input[name=\'buyproduct\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/product/autocomplete&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['product_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'buyproduct\']').val('');

        $('#buy-product' + item['value']).remove();

        $('#buy-product').append('<div id="buy-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="buy_product[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#buy-product').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Buy Manufacturer
    $('input[name=\'buymanufacturer\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/manufacturer/autocomplete&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['manufacturer_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'buymanufacturer\']').val('');

        $('#buy-manufacturer' + item['value']).remove();

        $('#buy-manufacturer').append('<div id="buy-manufacturer' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="buy_manufacturer[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#buy-manufacturer').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Get Category
    $('input[name=\'getcategory\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/category/autocomplete&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['category_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'getcategory\']').val('');

        $('#get-category' + item['value']).remove();

        $('#get-category').append('<div id="get-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="get_category[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#get-category').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Get Product
    $('input[name=\'getproduct\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/product/autocomplete&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['product_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'getproduct\']').val('');

        $('#get-product' + item['value']).remove();

        $('#get-product').append('<div id="get-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="get_product[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#get-product').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    // Get Manufacturer
    $('input[name=\'getmanufacturer\']').autocomplete({
      'source': function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/manufacturer/autocomplete&<?php echo $JocToken; ?>=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['manufacturer_id']
              }
            }));
          }
        });
      },
      'select': function(item) {
        $('input[name=\'getmanufacturer\']').val('');

        $('#get-manufacturer' + item['value']).remove();

        $('#get-manufacturer').append('<div id="get-manufacturer' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="get_manufacturer[]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#get-manufacturer').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });
  </script>
  <script type="text/javascript"><!--
    $('.date').datetimepicker({
      pickTime: false
    });

    $('.time').datetimepicker({
      pickDate: false
    });

    $('.datetime').datetimepicker({
      pickDate: true,
      pickTime: true
    });
  //--></script>
  <script type="text/javascript"><!--
    $('#language a:first').tab('show');
  //--></script>
</div>
<?php echo $footer; ?>
