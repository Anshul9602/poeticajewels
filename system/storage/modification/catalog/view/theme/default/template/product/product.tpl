<?php echo $header; ?>
<script src="catalog/view/javascript/jquery.zoom.js" type="text/javascript"></script>
<style>
  .panel-default {
    border: none;
    box-shadow: none;
    border-top: thin solid #f1f1f1;
    border-radius: 0
  }

  .panel-body {
    border: none !important;
    padding: 10px;
    margin-top: -15px !important;
    text-align: justify
  }

  .panel-default .panel-heading {
    padding: 0;
    border-radius: 0;
    color: #212121;

    border-color: #ccc;
    background: none;
    border-left: none;
    border-right: none;

  }

  .panel-title {
    font-size: 14px;
  }

  .panel-body {
    padding: 0px;
    margin-top: 15px;
    margin-bottom: 15px;
  }

  .panel-body ul {
    margin-top: 10px;

  }

  .panel-title a {
    display: block;
    padding: 15px;
    text-decoration: none;
    color: #333;
  }

  .more-less {
    float: right;
  }

  .glyphicon {
    font-size: 10px;
    color: #666;
    font-weight: 100;
  }

  .btn-round {
    padding: 0px;
  }

  .zoom {
    cursor: zoom-in;
    z-index: 9999999;
  }


  .file_input {
    display: none;
    border: thin solid #ccc;
    width: 120px;
    margin: 5px;
    padding: 7.5px 5px;
    text-align: center;
    float: left;
  }


  @media screen and (max-width:650px) {
    .hidden-mobile {
      display: none;
    }

    #button-cart {
      margin-bottom: 10px;
    }

    .desktop_slider {
      display: none !important;
    }

    .slider_mob,
    .slider-mob-box {
      display: inline !important;
    }




    .slider_mob {
      margin-top: -45px !important;
    }

    .product-details-des {
      margin-top: 18px;
    }

    .product-details-des .pro-review {
      width: 100%;
    }

    .slick-slider .slick-list,
    .slick-slider .slick-track {
      transform: none !important;
    }

    .slick-dots {
      margin-left: -40px !important;
    }
  }

  @media screen and (min-width:651px) {
    .slick-list {
      min-height: 620px;
    }

    .desktop_slider {
      display: inline !important;
    }

    .slider_mob,
    .slider-mob-box {
      display: none !important;
    }

    .btn-primary {
      width: 250px;
      float: left;
      margin-left: 10px;
    }

    #button-cart {
      margin-left: 0px;
    }

    select,
    input {
      max-width: 400px;
    }
  }

  .imgth {
    max-width: 100px;
  }

  .btn-wishilist {
    width: 40px;
    height: 40px;
    margin-top: -2px;
  }

  .btn-cart2 {
    width: 35px;
    height: 35px;
    margin-top: 2px;
    line-height: 2.8;
  }

  #button-customization {
    margin-top: 0px;
  }

  .product-review-info .tab-content.reviews-tab {
    border-color: #EF7776;
  }

  .slider-nav .slick-active div li img {
    border: 3px solid #fff;
  }

  .slider-nav .slick-active.slick-current div li img {
    border: 3px solid #EF7776;
  }

  .slick-list.draggable {
    height: auto !important;
  }
</style>
<!-- breadcrumb area start -->
<div class="breadcrumb-area hidden-phone">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>

                <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
              <?php } ?>
            </ul>

          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<br /><br />
<style>
  .addthis_button_facebook_like {
    margin-left: -15px;
  }

  .offer_block {
    padding: 20px 40px 20px 15px;
    background-color: #DFF2FE;
    color: #333;
    width: 100%;
    min-width: 200px;
    font-size: 14px;
    text-transform: uppercase;
  }

  .ob2 {
    background-color: #E6FDF8;
  }

  .product-details-des .like-icon a {
    margin-right: 0px;
  }

  @media screen and (max-width:650px) {
    .hidden-phone {
      display: none;
    }

    .row,
    .col-sm-12 {
      padding: 0px;
    }

    .canvas-container-outer {
      width: 300px !important;
    }
  }
</style>
<!-- breadcrumb area end -->
<div class="container">

  <div class="row">
    <div id="content" class="col-sm-12">
      <div class="row">

        <div style="padding:0px; text-align:left" class="col-sm-2 desktop_slider">
          <ul style="background: none;" class="slider slider-nav">
            <?php if ($thumb) { ?>
              <li style="outline:none"><img style="margin: auto;" class="img-responsive nav-list-li imgth" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
            <?php } ?>
            <?php if ($images) { ?>
              <?php foreach ($images as $image) { ?>
                <li style="margin-top:20px; outline:none"><img class="img-responsive nav-list-li imgth" style="margin: auto" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
              <?php } ?>
            <?php } ?>
          </ul>
        </div>

        <div class="col-lg-5 desktop_slider">
          <?php if ($thumb || $images) { ?>
            <div id="s_wrap">
              <ul style="background: none;" class="slider slider-for">
                <?php if ($thumb) { ?>
                  <li class="zoom">
                    <img style="margin: auto !important;" class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                <?php } ?>
                <?php if ($images) { ?>
                  <?php foreach ($images as $image) { ?>
                    <li class="zoom"><img class="img-responsive" style="margin: auto; margin-right:-5px;" src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                  <?php } ?>
                <?php } ?>
              </ul>
            </div>
          <?php } ?>

        </div>

        <div class="col-lg-5 slider_mob">
          <div class="product-large-slider">
            <?php if ($thumb) { ?>
              <div class="pro-large-img img-zoom">
                <img src="<?php echo $thumb; ?>" alt="product-details" />
              </div>
            <?php } ?>
            <?php if ($images) { ?>
              <?php foreach ($images as $image) { ?>
                <div class="pro-large-img img-zoom">
                  <img src="<?php echo $image['popup']; ?>" alt="product-details" />
                </div>
              <?php } ?>
            <?php } ?>
          </div>
          <div class="pro-nav slick-row-10 slick-arrow-style">
            <?php if ($thumb) { ?>
              <div class="pro-nav-thumb">
                <img src="<?php echo $thumb; ?>" alt="product-details" />
              </div>
            <?php } ?>
            <?php if ($images) { ?>
              <?php foreach ($images as $image) { ?>
                <div class="pro-nav-thumb">
                  <img src="<?php echo $image['popup']; ?>" alt="product-details" />
                </div>
              <?php } ?>
            <?php } ?>


          </div>
        </div>


        <div class="col-lg-4">

          <div class="manufacturer-name">
            <a href="#"><?php echo $subheading; ?></a>
          </div>
          <h3 style="text-transform: uppercase;" class="product-name"><?php echo $heading_title; ?></h3>

          <div class="ratings d-flex">

            <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
            <?php } ?>


            <div class="pro-review">
              <span> <a style="color: #333;" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?>
                </a> /
                <a style="color: #333;" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                </p>
              </span>
            </div>
          </div>

          <div style="padding-top: 0px; margin-top:-10px;" class="price-box">
            <?php if ($price) { ?>

              <?php if (!$special) { ?>

                <h3 class="price-regular"><?php echo $price; ?></h3>

              <?php } else { ?>

                <h6 class="price-old"> <del><?php echo $price; ?></del></h6>
                <h3 class="price-regular"><?php echo $special; ?></h3>

              <?php } ?>
              <?php if ($tax) { ?>
                <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
              <?php } ?>
              <?php if ($points) { ?>
                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
              <?php } ?>
              <?php if ($discounts) { ?>
                <li>
                  <hr>
                </li>
                <?php foreach ($discounts as $discount) { ?>
                  <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
                  </li>
                <?php } ?>
              <?php } ?>

            <?php } ?>
          </div>
          <div style="margin-top: 20px;" class="like-icon">

            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e">
            </script>
            <!-- AddThis Button END -->
          </div>

          <hr>


          <div id="product">
            <?php if ($options) { ?>
              <?php foreach ($options as $option) { ?>
                <?php if ($option['type'] == 'select') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                          <?php if ($option_value['price']) { ?>
                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                          <?php } ?>
                        </option>
                      <?php } ?>
                    </select>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'radio') { ?>
                  <div class="radio_input form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <div class="radio">
                          <label>
                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                            <?php if ($option_value['image']) { ?>
                              <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                            <?php } ?>
                            <?php echo $option_value['name']; ?>
                            <?php if ($option_value['price']) { ?>
                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                            <?php } ?>
                          </label>
                        </div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'checkbox') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                            <?php if ($option_value['image']) { ?>
                              <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                            <?php } ?>
                            <?php echo $option_value['name']; ?>
                            <?php if ($option_value['price']) { ?>
                              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                            <?php } ?>
                          </label>
                        </div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'text') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'textarea') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'file') { ?>
                  <div class="file_input form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <img class="filePreview" style="display:none; max-width: 50px; margin:auto">

                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default upload-btn btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                  </div>

                <?php } ?>
                <?php if ($option['type'] == 'date') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group date">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                      </span></div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'datetime') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group datetime">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'time') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group time">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                  </div>
                <?php } ?>
              <?php } ?>

            <?php } ?>


            <div style="display: inline-block; width:100%; margin-bottom:0px" class="form-group">


              <div id="counter-btn" style="padding: 0px; padding-left:10px; margin-top:-12px; max-width:300px" class="row">
                <div style="cursor: pointer; height: 40px; text-align:center;   border:thin solid #ccc" class="col-sm-2 col-4 minus-icon">
                  <li style=" font-size:12px; margin:auto; line-height:40px; text-align:center" id="less_quantity" class="fa fa-minus"></li>
                </div>
                <div style=" padding-left:0px; height: 40px; padding-right:0px;" class="col-sm-3 col-4">
                  <input name="quantity" type="text" style="box-shadow:none; text-align:center; border-radius:0px; width:100%; height: 40px; background-color: transparent; cursor:default" id="input-quantity" value="1" class="form-control" /></div>
                <div style=" cursor: pointer;  height: 40px; text-align:center; border:thin solid #ccc" class="col-sm-2 col-4 minus-icon">
                  <li style="font-size:12px; height: 50px; line-height:40px; text-align:center" id="add_quantity" class="fa fa-plus"></li>
                </div>
              </div>

              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

              <button type="button" style="margin-top: 20px;" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
              <br /> <br /><br />
              <button style="border:none; padding:10px 0px; margin-top:10px; background:none " type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">ADD TO WISHLIST &nbsp;<i style="color:rgb(185, 130, 123, 0.9)" class="fa fa-heart-o"></i></button>
            </div>
            <div style="padding: 0px;" class="col-sm-12 col-12">

              <hr />
              <p class="sub-heading"><b>SKU:</b> <?php echo $model; ?></p>
              <p class="sub-heading"><b>Metal:</b> <?php echo $isbn; ?></p>
              <p style="color: #EF7776;">Each Piece Is Unique & Handcrafted.</p>
              <p>All Prices Inclusive of GST</p>
              <hr />


              <p>
                <h3>Description</h3>
                <?php echo strip_tags($description, "<br /><br>"); ?>
              </p>
              <div style="text-align: left" class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">


                <div style="display: none;" class="panel panel-default">
                  <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                      <a role="button" style="padding:20px 0px" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseOne">
                        <b> Description</b>
                        <i class="more-less glyphicon glyphicon-plus"></i>
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                      <?php $a = (string)$finer_details;
                      echo strip_tags(html_entity_decode($a), '<br /><ul><li><br>'); ?>
                    </div>
                  </div>
                </div>
                <?php if ($keywords) { ?>
                  <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                      <h4 class="panel-title">
                        <a role="button" style="padding:20px 0px" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                          <b>Product Care</b>
                          <i class="more-less glyphicon glyphicon-plus"></i>
                        </a>
                      </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                      <div id="delivery_d" class="panel-body">
                        <?php $a = (string)$keywords;
                        echo strip_tags(html_entity_decode(htmlspecialchars_decode($a)), '<br><br /><ul><li>'); ?>
                      </div>
                    </div>
                  </div>
                <?php } ?>



              </div><!-- panel-group -->
            </div>
            <?php if ($minimum > 1) { ?>
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>

        </div>
      </div>

      <!-- product details reviews start -->
      <div style="margin: 0px;" class="row">
        <div class="col-sm-12">
          <div class="product-details-reviews section-padding pb-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="product-review-info">
                  <ul class="nav review-tab">
                    <li style="display: none;">
                      <a data-toggle="tab" href="#tab_one">description</a>
                    </li>


			<?php /*esbuygetcombo starts*/ ?>
            <?php if (!empty($jbuygetcombo['jbuygetcombo_info'])) { ?>
              <?php if ($jbuygetcombo['jbuygetcombo_info']['position'] == 'tab_description_inside' ) { ?>
              <li><a href="#tab-jbuygetcombo<?php echo $jbuygetcombo['jbuygetcombo_info']['jbuygetcombo_id']; ?>" data-toggle="tab"><?php echo $jbuygetcombo['text_tab_jbuygetcombo']; ?></a></li>
              <?php } ?>
            <?php } ?>
            <?php /*esbuygetcombo ends*/ ?>
			
                    <?php if ($attribute_groups) { ?>
                      <li>
                        <a data-toggle="tab" href="#tab_two">information</a>
                      </li> <?php } ?>


                    <li>
                      <a class="active" data-toggle="tab" href="#tab_three">reviews </a>
                    </li>
                  </ul>
                  <div class="tab-content reviews-tab">
                    <div style="display: none;" class="tab-pane fade " id="tab_one">
                      <div class="tab-one">
                        <p><?php print_r(strip_tags($description, '<br><hr><br /><hr /><b><p>')); ?></p>
                      </div>
                    </div>


                    <?php if ($attribute_groups) { ?>
                      <div class="tab-pane fade" id="tab_two">
                        <table class="table table-bordered">
                          <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <thead>
                              <tr>
                                <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                              </tr>
                            </thead>
                            <tbody>
                              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <tr>
                                  <td><?php echo $attribute['name']; ?></td>
                                  <td><?php echo $attribute['text']; ?></td>
                                </tr>
                              <?php } ?>
                            </tbody>
                          <?php } ?>
                        </table>
                      </div>
                    <?php } ?>


                    <div class="tab-pane fade show active" id="tab_three">
                      <form class="form-horizontal" id="form-review">
                        <div id="review"></div>
                        <h2><?php echo $text_write; ?></h2>
                        <?php if ($review_guest) { ?>
                          <div class="form-group required">
                            <div class="col-sm-12">
                              <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                              <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group required">
                            <div class="col-sm-12">
                              <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                              <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>

                            </div>
                          </div>
                          <div class="form-group required">
                            <div class="col-sm-12">
                              <label class="control-label"><?php echo $entry_rating; ?></label>

                              <input type="radio" name="rating" value="1" />
                              &nbsp;
                              <input type="radio" name="rating" value="2" />
                              &nbsp;
                              <input type="radio" name="rating" value="3" />
                              &nbsp;
                              <input type="radio" name="rating" value="4" />
                              &nbsp;
                              <input type="radio" name="rating" value="5" />

                            </div>
                            <?php echo $captcha; ?>
                            <div class="buttons clearfix">
                              <div class="pull-right">
                                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                              </div>
                            </div>
                          <?php } else { ?>
                            <?php echo $text_login; ?>
                          <?php } ?>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      <!-- product details reviews end -->



      <?php if ($products) { ?>

        <div style="width:100%" class="row">
          <div class="col-sm-12 text-center"> <br /><br />
            <h2 style="color:#EF7776;"><?php echo $text_related; ?></h2> <br /><br />
          </div>
        </div>


        <div style="width:100%" class="row">
          <?php $i = 0; ?>
          <?php foreach ($products as $product) { ?>

            <div class="col-sm-3 col-6 product-boxes">
              <!-- product grid start -->
              <div class="product-item">
                <figure class="product-thumb">
                  <a href="<?php print_r($product['href']); ?>">
                    <img style="z-index:99999999" src="<?php print_r($product['thumb']); ?>" class="img-responsive">
                  </a>

                </figure>
                <p class="description" style="display: none;">
                  <?php print_r($product['description']); ?>
                  <input type="hidden" class="pid" value="<?php echo $product['product_id']; ?>">
                </p>
                <div class="product-caption text-center">
                  <h6 class="product-name">
                    <a href="<?php print_r($product['href']); ?>">
                      <?php print_r($product['name']); ?>
                    </a>
                  </h6>

                  <?php if ($product['price']) { ?>
                    <?php if ($product['special']) { ?>
                      <div class="price-box">
                        <span class="price-regular"><?php echo $product['special']; ?></span>
                        <span class="price-old"><del><?php echo $product['price']; ?></del></span>
                      </div>
                    <?php } else { ?>
                      <div class="price-box">
                        <span class="price-regular">
                          <?php echo preg_replace('~\.0+$~', '', $product['price']); ?>
                        </span>
                      </div>
                    <?php } ?>
                  <?php } ?>



                </div>

              </div>
              <!-- product grid end -->
            </div>

          <?php } ?>
        </div> <br /><br /> <br /><br />
      <?php } ?>


    </div>

  </div>
</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body text-center">
        <p>Tap to zoom</p>
        <div class="row">

          <div class="col-sm-12 zoom">
            <img class="img-responsive" id="pop-zoom" style="margin: auto; padding:20px" src="" />
          </div>

        </div>
        <br />
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  $("body").on("change", "input[type='radio']", function() {
    var x = $.trim($("input[type='radio']:checked").parent().text());
    if (x == "Upload Now") {
      $(".file_input").fadeIn();
    } else {
      $(".file_input").fadeOut();
    }

  });

  $('select[name=\'recurring_id\'], input[name="quantity"]').change(function() {
    $.ajax({
      url: 'index.php?route=product/product/getRecurringDescription',
      type: 'post',
      data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
      dataType: 'json',
      beforeSend: function() {
        $('#recurring-description').html('');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['success']) {
          $('#recurring-description').html(json['success']);
        }
      }
    });
  });



  var slides_to_show = $(".imgth").length;

  $('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    fade: false,
    asNavFor: '.slider-nav',
    nextArrow: '<button style="width: 30px;height:30px;color:#fff;top: 200px;position: absolute;right: 0px;z-index: 99;" class="btn-round left"><svg style="fill:#fff; margin-top:-3px; width:15px" viewBox="0 0 100 100"><path d="M 20,50 L 60,90 L 60,85 L 25,50  L 60,15 L 60,10 Z" class="arrow" transform="translate(100, 100) rotate(180) "></path></svg></button>',
    prevArrow: '<button style="width: 30px;height:30px;color:#fff;top: 200px;position: absolute;left: 0px;z-index: 99;" class="btn-round right"><svg style="fill:#fff; margin-top:-3px; width:15px" viewBox="0 0 100 100"><path d="M 20,50 L 60,90 L 60,85 L 25,50  L 60,15 L 60,10 Z" class="arrow"></path></svg></button>'

  });

  $('.slider-nav').slick({
    slidesToShow: slides_to_show,
    vertical: true,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    dots: true,
    arrows: true,
    focusOnSelect: true

  });
  $("#add_quantity").click(function() {
    var b = Number($("#input-quantity").val()) + 1;
    $("#input-quantity").val(b);
  })

  $("#less_quantity").click(function() {
    var b = Number($("#input-quantity").val()) - 1;
    if (b < 0) {
      b = 0;
    }
    $("#input-quantity").val(b);
  })
</script>
<script type="text/javascript">
  $('#button-cart').on('click', function() {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-cart').button('loading');
      },
      complete: function() {
        $('#button-cart').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['error']) {
          if (json['error']['option']) {
            for (i in json['error']['option']) {
              var element = $('#input-option' + i.replace('_', '-'));

              if (element.parent().hasClass('input-group')) {
                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              } else {
                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              }
            }
          }

          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }

          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        }

        if (json['success']) {
          // Need to set timeout otherwise it wont update the total
          setTimeout(function() {
            $('#cart_count').html(json['total'][0]);
          }, 100);

          var amount = json['total'].split('-');
          $(".mincart-total").html(amount[1]);

          if (json['total'][0] > 0) {
            $(".minicart-pricing-box").fadeIn();
          }

          $('.minicart-btn').click();
          $(".minicart-button").fadeIn();

          $('#cart > ul').load('index.php?route=common/cart/info #cart li');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });
  //
</script>
<script type="text/javascript">
  $('.date').datetimepicker({
    pickTime: false
  });

  $('.datetime').datetimepicker({
    pickDate: true,
    pickTime: true
  });

  $('.time').datetimepicker({
    pickDate: false
  });

  var ref = '';
  $(document).on('click', '.upload-btn', function() {
    $('.upload-btn').removeClass('acc');
    $(this).addClass('acc');
  })
  $(document).on('change', 'input[name="file"]', function() {
    ref = this;
    if (this.files && this.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {

        $('.acc').siblings('.filePreview').attr('src', e.target.result);
        $('.acc').siblings('.filePreview').fadeIn();
      }

      reader.readAsDataURL(this.files[0]); // convert to base64 string
    }
  });

  $('button[id^=\'button-upload\']').on('click', function() {
    var node = this;

    $('#form-upload').remove();

    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

    $('#form-upload input[name=\'file\']').trigger('click');

    if (typeof timer != 'undefined') {
      clearInterval(timer);
    }

    timer = setInterval(function() {
      if ($('#form-upload input[name=\'file\']').val() != '') {
        clearInterval(timer);

        $.ajax({
          url: 'index.php?route=tool/upload',
          type: 'post',
          dataType: 'json',
          data: new FormData($('#form-upload')[0]),
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            $(node).button('loading');
          },
          complete: function() {
            $(node).button('reset');
          },
          success: function(json) {
            $('.text-danger').remove();

            if (json['error']) {
              $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
            }

            if (json['success']) {
              alert(json['success']);

              $(node).parent().find('input').val(json['code']);
            }
            if (json['error']) {
              ref = '';
              $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
            }


          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    }, 500);
  });


  //
</script>
<script type="text/javascript">
  $('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
  });

  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

  $('#button-review').on('click', function() {
    $.ajax({
      url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: $("#form-review").serialize(),
      beforeSend: function() {
        $('#button-review').button('loading');
      },
      complete: function() {
        $('#button-review').button('reset');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();

        if (json['error']) {
          $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }

        if (json['success']) {
          $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

          $('input[name=\'name\']').val('');
          $('textarea[name=\'text\']').val('');
          $('input[name=\'rating\']:checked').prop('checked', false);
        }
      }
    });
  });

  $(document).ready(function() {
    $('.thumbnails').magnificPopup({
      type: 'image',
      delegate: 'a',
      gallery: {
        enabled: true
      }
    });
  });
  $('.zoom').zoom({
    magnify: '1.3'
  });

  $('#exampleModal').on('shown.bs.modal', function() {

    $("#pop-zoom").attr('src', $(".slick-current img").attr('src'));


  })
</script>
<br /><br />
<?php echo $footer; ?>