<?php echo $header; ?>
<style>
  h3 {
    text-transform: uppercase
  }

  .checkout_heading {
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 2px
  }

  #checkout_block .col-sm-3 {
    min-height: 150px
  }

  p {
    font-size: 14px;
  }
</style>

<div style=" margin-bottom:40px; padding-top:100px; min-height:60vh" class="container">
  <div class="row">
    <div class="col-sm-12">

      <div class="row">
        <div style=" padding-top:25px; background:#F0EEE2" class="col-sm-10 offset-sm-1">

          <h3 style="text-transform:uppercase;  text-align:center; letter-spacing:2.6px">Secure Checkout</h3>
          <hr />

          <div style="padding-left:30px" id="checkout_block" class="row">
            <div class="col-sm-3">
              <span style="padding:10px">

                <p class="checkout_heading">Billing Address &nbsp;<?php if (!$logged) { ?><a style="font-size:14px" href="index.php?route=checkout/guest_new">Edit</a><?php } ?></p>
                <p style="text-transform:capitalize; letter-spacing:1px; font-size:14px">
                  <?php echo $order_data['payment_firstname'] . ' ' . $order_data['payment_lastname']; ?><br />
                  <?php echo $order_data['payment_address_1'] . ' ' . $order_data['payment_address_2']; ?><br />
                  <?php echo $order_data['payment_city'] . ', ' . $order_data['payment_zone']; ?><br />
                  <?php echo $order_data['payment_country'] . ' ' . $order_data['payment_postcode']; ?>
                </p>
              </span>
            </div>

            <div class="col-sm-3">
              <span style="padding:10px">

                <p class="checkout_heading">Shipping Address <?php if (!$logged) { ?>
                    <a style="font-size:12px" href="index.php?route=checkout/guest_shipping_new">Edit</a>
                  <?php } ?></p>

                <p style="text-transform:capitalize; font-size:14px; letter-spacing:1px">
                  <?php echo $order_data['shipping_firstname'] . ' ' . $order_data['shipping_lastname']; ?><br />
                  <?php echo $order_data['shipping_address_1'] . ' ' . $order_data['shipping_address_2']; ?><br />
                  <?php echo $order_data['shipping_city'] . ', ' . $order_data['shipping_zone']; ?><br />
                  <?php echo $order_data['shipping_country'] . ' ' . $order_data['shipping_postcode']; ?>
                </p>
              </span>
            </div>

            <div class="col-sm-3">
              <span style="padding:10px">
                <h5 class="checkout_heading">Shipping method</h5>
                <p style="text-transform:capitalize; font-size:14px; letter-spacing:1px">Standard Shipping</p>
              </span>
            </div>

            <div class="col-sm-3">
              <div class="panel-collapse" id="collapse-payment-method">
                <div class="panel-body"></div>
              </div>



            </div>

          </div>


        </div>
      </div>

      <div class="row">

        <div style="margin-top:30px; background-color:#F0EEE2; padding:10px" class="col-sm-10 offset-sm-1">
          <span id="confirm_box">

          </span>
        </div>
      </div>

      <div class="row">


        <div class="col-sm-4">
          <textarea style="display:none" name="comment"></textarea>
          <div style="display:none" class="row">
            <div class="col-sm-12">
              <?php if ($shipping_methods) { ?>
                <?php foreach ($shipping_methods as $shipping_method) { ?>
                  <p>Shipping Charges</p>
                  <?php if (!$shipping_method['error']) { ?>
                    <?php foreach ($shipping_method['quote'] as $quote) { ?>
                      <div class="radio">
                        <label>
                          <?php if ($quote['code'] == $code || !$code) { ?>
                            <?php $code = $quote['code']; ?>
                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
                          <?php } else { ?>
                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
                          <?php } ?>
                          <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            </div>
          </div>

        </div>
      </div>
    </div>

  </div>
</div>

<script>
  $(document).ready(function(e) {
    $.ajax({
      url: 'index.php?route=checkout/shipping_method/save',
      type: 'post',
      data: $('input[name=\'shipping_method\']:checked, textarea'),
      dataType: 'json',
      success: function(data) {
        console.log("api1");
        console.log(data);
        $.ajax({
          url: 'index.php?route=checkout/payment_method',
          dataType: 'html',
          complete: function() {
            $('#button-shipping-method').button('reset');
          },
          success: function(html) {
            console.log(html);
            $('#collapse-payment-method .panel-body').html(html);

            $.ajax({
              url: 'index.php?route=checkout/payment_method/save',
              type: 'post',
              data: $(
                '#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'
              ),
              dataType: 'json',
              beforeSend: function() {
                $('#button-payment-method').button('loading');
              },
              success: function(json) {
                $.ajax({
                  url: 'index.php?route=checkout/confirm',
                  dataType: 'html',
                  complete: function() {
                    $('#button-payment-method').button('reset');
                  },
                  success: function(html) {
                    $('#confirm_box').html(html);
                  }
                  //error: function(xhr, ajaxOptions, thrownError) {
                  // alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr
                  // .responseText);
                  //}
                })
                console.log(json);
              }
              //error: function(xhr, ajaxOptions, thrownError) {
              //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              //}

            })


          }
        })
      }
      //error: function(xhr, ajaxOptions, thrownError) {
      //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      //}

    })
  });

  $("body").on("change", "input[name=\'payment_method\']", function() {
    $.ajax({
      url: 'index.php?route=checkout/payment_method/save',
      type: 'post',
      data: $('input[name=\'payment_method\']:checked, textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-payment-method').button('loading');
      },
      success: function(json) {
        $.ajax({
          url: 'index.php?route=checkout/confirm',
          dataType: 'html',
          complete: function() {
            $('#button-payment-method').button('reset');
          },
          success: function(html) {
            $('#confirm_box').html(html);
            location.reload();
          }
          //error: function(xhr, ajaxOptions, thrownError) {
          //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          //}
        })
        console.log(json);
      }
      //error: function(xhr, ajaxOptions, thrownError) {
      //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      //}

    })

  })

  $(document).delegate('#button-payment-method', 'click', function() {

    $.ajax({
      url: 'index.php?route=checkout/payment_method/save',
      type: 'post',
      data: $(
        '#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'
      ),
      dataType: 'json',
      beforeSend: function() {
        $('#button-payment-method').button('loading');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['redirect']) {
          location = json['redirect'];
        } else if (json['error']) {
          $('#button-payment-method').button('reset');

          if (json['error']['warning']) {
            $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-danger">' + json[
                'error']['warning'] +
              '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          }
        } else {
          $.ajax({
            url: 'index.php?route=checkout/confirm',
            dataType: 'html',
            complete: function() {
              $('#button-payment-method').button('reset');
            },
            success: function(html) {
              $('#collapse-checkout-confirm .panel-body').html(html);

              $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html(
                '<a href="#collapse-checkout-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_confirm; ?> <i class="fa fa-caret-down"></i></a>'
              );

              $('a[href=\'#collapse-checkout-confirm\']').trigger('click');
            }
            //error: function(xhr, ajaxOptions, thrownError) {
            //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            //}
          });
        }
      }
      //error: function(xhr, ajaxOptions, thrownError) {
      //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      //}
    });
  });
</script>
<?php echo $footer; ?>