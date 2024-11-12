<?php echo $header; ?>
<div style="width: 100%; padding-top:80px; min-height:80vh; margin-bottom:120px" class="container">
  <style>
    h3 {
      font-size: 14px;
    }

    .number {
      text-align: center;
    }

    .panel {
      background: transparent !important;
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

      #desktop_table {
        display: none !important
      }

      .cart_img {
        margin-top: 10px;
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

      #mobile_table {
        display: none !important
      }

    }

    @media all and (device-width: 768px) and (device-height: 1024px) and (orientation:portrait) {
      #gck {
        margin-top: 40px;
      }
    }

    thead tr td p {
      letter-spacing: 3px;
      font-size: 11px;
      text-transform: uppercase
    }


    .panel-default>.panel-heading {
      text-align: center;
      border: none;
    }

    .fa.fa-caret-down {
      display: none;
    }

    .panel {
      box-shadow: none;
      background: #fff;
      border-radius: 0px;
      border: none;
      margin-top: -15px;
      margin-bottom: 0px;
      padding: 0px;
    }

    .col-sm-10 a {
      text-align: left !important;
      padding: 0px;
      font-size: 12px;
    }

    .panel-default>.panel-heading {
      text-align: left;
    }

    #input-coupon::placeholder {
      display: none;
      opacity: 0;
    }

    input {
      box-shadow: none !important;
    }

    .panel-default>.panel-heading {
      background-color: transparent;
    }
  </style>




  <div class="row">
    <div style="margin-top:30px; " id="content" class="col-sm-10 offset-sm-1 col-12"><?php echo $content_top; ?>


      <div class="row justify-content-center mb-3 pb-3">
        <div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
          <h2 class="big">My Cart</h2>

        </div>
      </div>

      <div class="row">
        <div class="col-sm-12">
          <form style="margin-top: 20px" id="cf" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div id="desktop_table" class="table-responsive">
              <table class="table table-stripped">
                <thead>
                  <tr>
                    <td class="text-center">
                      <p>Image</p>
                    </td>
                    <td class="text-center">
                      <p>Name</p>
                    </td>

                    <td class="text-center">
                      <p><?php echo $column_quantity; ?></p>
                    </td>
                    <td class="text-center">
                      <p>Price</p>
                    </td>
                    <td class="text-center">
                      <p>Total</p>
                    </td>
                    <td class="text-center">
                      <p>Remove</p>
                    </td>

                  </tr>
                </thead>
                <tbody>
                  <?php $size_x = 1;
                  foreach ($products as $product) { ?>

                    <?php $related[] = $product['related']; ?>
                    <tr>

                      <td class="text-center">
                        <?php if ($product['thumb']) { ?>
                          <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" class="cart_img" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                          </a>
                        <?php } ?>

                      </td>

                      <td class="text-center">
                        <a href="<?php echo $product['href']; ?>">
                          <h3><?php echo $product['name']; ?></h3>
                          <?php if (!$product['stock']) { ?>
                            <span class="text-danger">*<i>(Out of stock)</i></span>
                          <?php } ?>
                          <?php if ($product['option']) { ?>
                            <?php foreach ($product['option'] as $option) { ?>

                              <font style="font-size:10px; color:#3c3c3c;  margin-left:-10px">
                                <?php echo $option['value']; ?>
                              </font>
                              <br />
                            <?php } ?>
                          <?php } ?>



                        </a>



                      </td>



                      <td class="text-center">

                        <div style="width:120px; margin:auto; margin-top:20px; " class="row">
                          <div style="cursor: pointer; text-align:center; padding-left:0px; padding-right:0px; height:34px; border:thin solid #ccc" class="col-sm-4">
                            <li style=" font-size:12px; line-height:34px; margin:auto; text-align:center;" class="fa fa-minus less_quantity"></li>
                          </div>
                          <div style=" padding-left:0px; padding-right:0px;" class="col-sm-4">
                            <input style="box-shadow:none; height:34px; border:thin solid #666; padding-top:4px; text-align:center; border-radius:0px; width:100%; cursor:default" class="input-quantity" readonly name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" class="form-control" />
                          </div>
                          <div style=" cursor: pointer; padding-left:0px; padding-right:0px; height:34px; text-align:center; border:thin solid #ccc" class="col-sm-4">
                            <li style="font-size:12px; line-height:34px; text-align:center;" class="fa fa-plus add_quantity"></li>
                          </div>
                        </div>



                      </td>
                      <td class="text-center">
                        <h4 style="margin-top: 20px"><?php echo $product['price']; ?>
                        </h4>
                      </td>
                      <td class="text-center">
                        <h4 style="margin-top: 20px"><?php echo $product['total']; ?>
                        </h4>
                      </td>
                      <td style="text-align:center; padding-right:30px"><button style="background-color: transparent; outline:none; margin:auto; margin-top:15px; text-align:center; margin-left:10px; border:none; box-shadow:none " type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
                          <i style="color: #333" class="fa fa-times-circle"></i>
                        </button></td>


                    </tr>
                  <?php $size_x++;
                  } ?>
                  <?php foreach ($vouchers as $vouchers) { ?>
                    <tr>
                      <td></td>
                      <td class="text-center"><?php echo $vouchers['description']; ?></td>
                      <td class="text-center"></td>
                      <td class="text-center">
                        <div class="input-group btn-block">
                          <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                          <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div>
                      </td>
                      <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                      <td class="text-right"><?php echo $vouchers['amount']; ?></td>

                    </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </form>
          <form style="margin-top: 20px" id="cf1" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

            <div class="row" id="mobile_table">
              <div class="col-12">
                <?php foreach ($products as $product) { ?>

                  <div class="row">
                    <div style="padding:5px" class="col-4">
                      <?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>">
                          <img src="<?php echo $product['thumb']; ?>" class="cart_img" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                        </a>
                      <?php } ?>

                    </div>
                    <div style="margin-left:-20px; text-align:left" class="col-8">
                      <a style="text-align:left" href="<?php echo $product['href']; ?>">
                        <h3><?php echo $product['name']; ?></h3>
                        <?php if (!$product['stock']) { ?>
                          <span class="text-danger">*<i>(Out of stock)</i></span>
                        <?php } ?>
                        <?php if ($product['option']) { ?>
                          <?php foreach ($product['option'] as $option) { ?>

                            <p style=" color:#ccc"><?php echo $option['value']; ?></p>

                          <?php } ?>
                        <?php } ?>
                      </a>

                      <p>

                        <?php echo $product['price']; ?>

                      </p>
                      <p style="margin-left: -10px;margin-top: -15px;">
                        <button style="background-color: transparent; position: absolute; top: 17.5px; right: -20px; outline:none; margin:auto;  text-align:center; border:none; box-shadow:none " type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
                          <img src="image/cross.png" alt="" style="width:10px" class="img-responsive">
                        </button>
                      </p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-6" style="padding:4.5px">
                      <div style="width:120px; margin:auto; margin-top:20px; margin-left:0px " class="row">
                        <div style="cursor: pointer; text-align:center; padding-left:0px; padding-right:0px; height:34px; border:thin solid #ccc" class="col-4">
                          <li style=" font-size:12px; margin:auto; text-align:center; margin-top:10px;" class="fa fa-minus less_quantity1"></li>
                        </div>
                        <div style=" padding-left:0px; padding-right:0px;" class="col-4">
                          <input style="box-shadow:none; height:34px; border:thin solid #666; text-align:center; border-radius:0px; width:100%; cursor:default" class="input-quantity1" readonly name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" class="form-control" />
                        </div>
                        <div style=" cursor: pointer; padding-left:0px; padding-right:0px; height:34px; text-align:center; border:thin solid #ccc" class="col-4">
                          <li style="font-size:12px; text-align:center; margin-top:10px;" class="fa fa-plus add_quantity1"></li>
                        </div>
                      </div>

                    </div>

                    <div class="col-6" style="text-align:right">
                      <h4 style="margin-top: 35px; font-size:14px"> <?php echo $product['total']; ?>
                      </h4>

                    </div>
                  </div>
                  <hr />
                <?php } ?>
              </div>
            </div>

          </form>
          <br />

          <div class="row">
            <div class="col-sm-5">

              <?php print_r($modules[0]); ?><br /><br />

            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-5">
              <table style="width:100%" class="table">
                <?php for ($i = 0; $i < sizeof($totals); $i++) { ?>
                  <?php if ($i == (sizeof($totals)) - 1) { ?>
                    <tr style="border:none">
                      <td style="border:none; text-transform:uppercase" class="text-left"><strong><?php echo $totals[$i]['title']; ?>:</strong></td>
                      <td style="border:none; text-transform:uppercase" class="text-right"><?php echo $totals[$i]['text']; ?></td>
                    </tr>
                  <?php } else { ?>
                    <tr style="border:none">
                      <td style="border:none; text-transform:uppercase" class="text-left"><strong><?php echo $totals[$i]['title']; ?>:</strong></td>
                      <td style="border:none; text-transform:uppercase" class="text-right"><?php echo $totals[$i]['text']; ?></td>
                    </tr>
                  <?php } ?>

                <?php } ?>
              </table>
              <br />


              <div class="row">

                <div class="col-sm-12 col-12 text-center">

                  <?php if (!$logged) { ?>
                    <a id="gck" style="float: right; " href="index.php?route=checkout/guest_new">
                      <button style="width:100%;" class="btn btn-hero">Proceed To Checkout</button></a>

                    <a href="index.php?route=account/login" style="float:right; margin-right:10px;">

                      <button style="width:100%;" class="btn btn-hero"> Sign Up</button>
                    </a>
                  <?php } else { ?>

                    <div class="buttons clearfix">
                      <div class="pull-right">
                        <a href="index.php?route=checkout/registered_payment">
                          <button class="btn btn-primary">Checkout</button>
                        </a></div>
                    </div>

                  <?php } ?>
                </div>
              </div>



            </div>
          </div>




        </div>

        <form style="display:none" method="post" id="loginf">
          <input name="redirect" value="checkout/registered_payment">
        </form>
      </div>

      <div style="width: 100%; margin-top:100px; margin-bottom:70px" class="row">

        <!-- related products area start -->
        <div class="col-12">
          <!-- section title start -->
          <div class="section-title text-center">
            <h2 class="title">You May Also like</h2>

          </div>
          <!-- section title start -->
        </div>
        <!-- related products area end -->

        <div style="width: 100%;" class="row">

          <?php foreach ($related as $relate) { ?>
            <?php if (sizeof($relate) > 0) { ?>
              <?php for ($i; $i < sizeof($relate); $i++) { ?>
                <div class="col-sm-3 col-6 product-boxes">
                  <!-- product grid start -->
                  <div class="product-item">
                    <figure class="product-thumb">
                      <a href="<?php print_r($relate[$i]['href']); ?>">
                        <img style="z-index:99999999" src="<?php print_r($relate[$i]['thumb']); ?>" class="img-responsive pri-img">
                        <img style="z-index:99999999" src="<?php print_r($relate[$i]['thumb']); ?>" class="img-responsive sec-img">

                      </a>

                    </figure>
                    <p class="description" style="display: none;">
                      <?php print_r($relate[$i]['description']); ?>
                      <input type="hidden" class="pid" value="<?php echo $relate[$i]['product_id']; ?>">
                    </p>
                    <div class="product-caption text-center">
                      <h6 class="product-name">
                        <a href="<?php print_r($relate[$i]['href']); ?>">
                          <?php print_r($relate[$i]['name']); ?>
                        </a>
                      </h6>

                      <?php if ($relate[$i]['price']) { ?>
                        <?php if ($relate[$i]['special']) { ?>
                          <div class="price-box">
                            <span class="price-regular"><?php echo $relate[$i]['special']; ?></span>
                            <span class="price-old"><del><?php echo $relate[$i]['price']; ?></del></span>
                          </div>
                        <?php } else { ?>
                          <div class="price-box">
                            <span class="price-regular">
                              <?php echo preg_replace('~\.0+$~', '', $relate[$i]['price']); ?>
                            </span>
                          </div>
                        <?php } ?>
                      <?php } ?>

                      <div class="row">
                        <div class="col-sm-12 text-center">
                          <button onclick="cart.add('<?php echo $relate[$i]['product_id']; ?>', 
  '<?php echo $relate[$i]['minimum']; ?>');" class="btn btn-round btn-cart1">
                            <i class="pe-7s-cart"></i>
                          </button>&nbsp;&nbsp;
                          <?php if ($logged) { ?>
                            <button onclick="wishlist.add('<?php echo $relate[$i]['product_id']; ?>');" class="btn btn-round btn-cart1">
                              <i class="pe-7s-like"></i>
                            </button>
                          <?php } else { ?>
                            <button onclick="alert('Please login to use wishlist')" class="btn btn-round btn-cart1">
                              <i class="pe-7s-like"></i>
                            </button>
                          <?php } ?>

                          &nbsp;&nbsp;



                        </div>
                      </div>

                    </div>

                  </div>
                  <!-- product grid end -->
                </div>
              <?php } ?>
            <?php } ?>



          <?php } ?>







        </div>
      </div>


      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script>
  $(".add_quantity").click(function() {
    var b = Number($(this).parent().siblings().find(".input-quantity").val()) + 1;
    $(this).parent().siblings().find(".input-quantity").val(b);
    $("#cf").submit();
  })

  $(".less_quantity").click(function() {

    var b = Number($(this).parent().siblings().find(".input-quantity").val()) - 1;
    if (b <= 0) {
      b = 1;
    }
    $(this).parent().siblings().find(".input-quantity").val(b);
    $("#cf").submit();
  })


  $(".add_quantity1").click(function() {
    var b = Number($(this).parent().siblings().find(".input-quantity1").val()) + 1;
    $(this).parent().siblings().find(".input-quantity1").val(b);
    $("#cf1").submit();
  })

  $(".less_quantity1").click(function() {

    var b = Number($(this).parent().siblings().find(".input-quantity1").val()) - 1;
    if (b <= 0) {
      b = 1;
    }
    $(this).parent().siblings().find(".input-quantity1").val(b);
    $("#cf1").submit();
  })
</script>
<?php echo $footer; ?>