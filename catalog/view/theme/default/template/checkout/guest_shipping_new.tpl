<?php echo $header; ?>
<div style="margin-top:100px; min-height:70vh" class="container">

  <style>
    label {
      font-size: 12px;
      text-transform: uppercase
    }

    select {
      -webkit-border-radius: 0px;
    }

    select option {
      border-radius: 0px
    }

    @media screen and (max-width:600px) {

      #address_col,
      #pin_box {
        margin-top: 15px
      }
    }
  </style>
  <style>
    .number {
      text-align: center;
    }

    .number span {
      width: 25px;
      height: 25px;
      padding-top: 2px;
      display: block;
      text-align: center;
      margin: auto;
      border-radius: 50%;
      background-color: #333;
      color: #fff
    }

    td h3 {
      font-size: 14px;
      text-transform: uppercase
    }

    .size_list {
      list-style: none;
      float: left;
      margin-left: 0px;
      padding-left: 0px;
      margin-top: 20px
    }

    .size_list li {
      float: left;
      border: thin solid #ccc;
      width: 40px;
      height: 40px;
      padding-top: 10px;
      text-align: center
    }

    table tr td {
      letter-spacing: 1.5px !important
    }

    @media screen and (max-width:600px) {
      .size_list {
        list-style: none;
        float: left;
        margin-left: 0px;
        padding-left: 0px;
        margin-top: 5px
      }
    }

    @media screen and (min-width:601px) {
      .size_list {
        list-style: none;
        float: left;
        margin-left: 0px;
        padding-left: 0px;
        margin-top: 20px
      }
    }
  </style>


  <div class="row">
    <div class="col-sm-8 offset-sm-2 col-xs-10 offset-xs-1">
      <div class="row">
        <div class="col-sm-12">
          <h3 style="text-align:center; margin-top: 60px; margin-bottom:40px">SHIPPING ADDRESS</h3>
          <hr />
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">


          <form class="form-horizontal">
            <div class="form-group required">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="First Name" id="input-shipping-firstname" class="form-control" />
                </div>
                <div class="col-sm-6">
                  <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="Last Name" id="input-shipping-lastname" class="form-control" />
                </div>
              </div>


            </div>

            <div style="display:none" class="form-group">
              <label class="col-sm-2 control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
              <div class="col-sm-10">
                <input type="text" name="company" value="<?php echo $company; ?>" placeholder="" id="input-shipping-company" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="Address Line-1" id="input-shipping-address-1" class="form-control" />
                </div>
                <div class="col-sm-6">
                  <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="Address Line-2" id="input-shipping-address-2" class="form-control" />
                </div>
              </div>


            </div>
            <div class="form-group required">
              <div class="row">
                <div class="col-sm-6">
                  <input type="text" name="city" value="<?php echo $city; ?>" placeholder="City" id="input-shipping-city" class="form-control" />
                </div>
                <div class="col-sm-6">
                  <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="Pin Code" id="input-shipping-postcode" class="form-control" />
                </div>
              </div>



            </div>

            <div class="form-group required">
              <div class="row">
                <div class="col-sm-6">
                  <select name="country_id" id="input-shipping-country" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
                      <?php if ($country['country_id'] == $country_id) { ?>
                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                      <?php } else { ?>
                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
                <div class="col-sm-6">
                  <select name="zone_id" id="input-payment-zone" class="form-control">
                    <option value=""> --- Please Select --- </option>
                    <option value="1475">Andaman and Nicobar Islands</option>
                    <option value="1476">Andhra Pradesh</option>
                    <option value="1477">Arunachal Pradesh</option>
                    <option value="1478">Assam</option>
                    <option value="1479">Bihar</option>
                    <option value="1480">Chandigarh</option>
                    <option value="1481">Dadra and Nagar Haveli</option>
                    <option value="1482">Daman and Diu</option>
                    <option value="1483">Delhi</option>
                    <option value="1484">Goa</option>
                    <option value="1485">Gujarat</option>
                    <option value="1486">Haryana</option>
                    <option value="1487">Himachal Pradesh</option>
                    <option value="1488">Jammu and Kashmir</option>
                    <option value="1489">Karnataka</option>
                    <option value="1490">Kerala</option>
                    <option value="1491">Lakshadweep Islands</option>
                    <option value="1492">Madhya Pradesh</option>
                    <option value="1493">Maharashtra</option>
                    <option value="1494">Manipur</option>
                    <option value="1495">Meghalaya</option>
                    <option value="1496">Mizoram</option>
                    <option value="1497">Nagaland</option>
                    <option value="1498">Orissa</option>
                    <option value="1499">Puducherry</option>
                    <option value="1500">Punjab</option>
                    <option value="1501">Rajasthan</option>
                    <option value="1502">Sikkim</option>
                    <option value="1503">Tamil Nadu</option>
                    <option value="4231">Telangana</option>
                    <option value="1504">Tripura</option>
                    <option value="1505">Uttar Pradesh</option>
                    <option value="1506">West Bengal</option>
                  </select>
                </div>
              </div>


            </div>

            <?php foreach ($custom_fields as $custom_field) { ?>
              <?php if ($custom_field['location'] == 'address') { ?>
                <?php if ($custom_field['type'] == 'select') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                          <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                          <?php } else { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                          <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'radio') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                          <div class="radio">
                            <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } else { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'checkbox') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                          <div class="checkbox">
                            <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } else { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                            <?php } ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'text') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'textarea') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'file') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                      <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'date') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div class="input-group date">
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                        <span class="input-group-btn">
                          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                        </span></div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'time') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div class="input-group time">
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                        <span class="input-group-btn">
                          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                        </span></div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'datetime') { ?>
                  <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                    <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                    <div class="col-sm-10">
                      <div class="input-group datetime">
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                        <span class="input-group-btn">
                          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                        </span></div>
                    </div>
                  </div>
                <?php } ?>
              <?php } ?>
            <?php } ?>
            <div class="buttons">
              <div class="pull-right">
                <input type="button" value="<?php echo $button_continue; ?>" id="button-guest-shipping" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-hero" />
              </div>
            </div>
          </form>

        </div>
      </div>



    </div>
  </div>
</div><br /><br />
<script type="text/javascript">
  $(".sticky-header").addClass("header_disabled");
  $(".sticky-header").css("background-color", '#fff');
  $(".sticky-header").css("border-bottom", '#f1f1f1 thin solid');
  $(".sticky-header #navigation a").css("color", "#181818");
  $(".main_logo").attr("src", "img/logo-blue.png");

  $('select[name=\'country_id\']').on('change', function() {
    $.ajax({
      url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
      dataType: 'json',
      beforeSend: function() {
        $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function() {
        $('.fa-spin').remove();
      },
      success: function(json) {
        if (json['postcode_required'] == '1') {
          $('input[name=\'postcode\']').parent().parent().addClass('required');
        } else {
          $('input[name=\'postcode\']').parent().parent().removeClass('required');
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $('select[name=\'zone_id\']').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');


  $(document).delegate('#button-guest-shipping', 'click', function() {
    $.ajax({
      url: 'index.php?route=checkout/guest_shipping_new/save',
      type: 'post',
      data: $('input[type=\'text\'], textarea, select'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-guest-shipping').button('loading');
      },
      success: function(json) {
        $('.alert,.text-danger').remove();
        if (json['redirect']) {
          locatio = json['redirect'];
        } else if (json['error']) {
          $('#button-guest-shipping').button('reset');
          if (json['error']['warning']) {
            $('#collapse-shipping-address, .panel-body ').prepend('<div class = "alert alert-danger" > ' + json['error ']['warning '] + ' <button type = "button" class = "close" data-dismiss="alert"> &times; </button></div> ');
          }

          for (i in json['error']) {
            var element = $('#input-shipping-' + i.replace('_', '-'));

            if ($(element).parent().hasClass('input-group')) {
              $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
            } else {
              $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
            }
          }

          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        } else {
          location = "index.php?route=checkout/checkout_new";
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });
</script>

<?php echo $footer; ?>