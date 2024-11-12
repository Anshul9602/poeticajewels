<?php echo $header; ?>
<style>
  @media screen and (max-width:750px) {
    .container {
      padding: 0px;
    }

    .breadcrumb-area {
      display: none;
    }
  }
</style>
<style>
  .product-thumb .price-new {
    font-weight: 600;
    color: darkred;
    font-size: 15px;
  }

  .product-thumb .price-old {
    color: #999;
    text-decoration: line-through;
    margin-left: 10px;
  }

  .flair-badge:after {
    content: "";
    position: absolute;
    top: 10px;
    left: 0;
    float: left;
    width: 4px;
    height: 4px;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
    -moz-box-shadow: -1px -1px 2px #f64d84;
    -webkit-box-shadow: -1px -1px 2px #f64d84;
    box-shadow: -1px -1px 2px #f64d84;
  }

  .size-strip {
    width: 100%;
    position: absolute;
    left: 0px;
    border: 0px;
    bottom: 70px;
    text-align: center;
    color: #fff;
    padding: 5px;
  }

  .row {
    margin: 0px;
  }

  .size-strip p {
    float: left;

  }

  .size-list {
    list-style: none;
    margin: 0;
    padding: 0;
    overflow: auto;
    opacity: 0;
  }

  .size-list li {
    display: inline-block;
    letter-spacing: normal;
    margin: 0 2.5px 0;
    background: #fff;
    width: 25px;
    height: 25px;
    color: #333;
    border-radius: 50%;
    text-align: center;
    line-height: 27.5px;

  }

  @media(hover: hover) and (pointer: fine) {
    .foo:hover img:last-child {
      display: inline-block
    }

  }

  .product-thumb:hover .size-list {
    opacity: 1;
  }



  .cate-caption {
    text-align: center;
    margin-top: -60px;
    text-transform: uppercase;
    font-family: noe;
    color: #fff;
    letter-spacing: 1px;
  }

  .cate-caption {
    font-size: 42px;
    text-transform: uppercase;
    position: absolute;
    width: 100%;
    margin-top: -210px;
  }

  .sold-out {
    padding: 4px;
    background: #EF7776;
    z-index: 1;
    color: #fff;
    margin-top: 15px;
    position: absolute;
    width: 30%;
    font-size: 16px;
    font-weight: 600;
  }

  @media screen and (max-width:750px) {
    .sold-out {
      font-size: 12px;
      padding: 4px;
    background: #EF7776;
    z-index: 1;
    margin-top: 15px;
    position: absolute;
    width: 30%;
    color: #fff;
    font-weight: 600;
    }

    .cate-wrapper {
      margin-top: 100px;
    }

    .cate-caption {
      font-size: 18px;
      text-transform: uppercase;
      position: absolute;
      width: 100%;
      margin-top: -115px;
    }



    .size-strip {
      display: none !important;
    }
  }

  .product_name {
    font-size: 13px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  .foo img:last-child {
    display: none
  }

  .foo:hover img:first-child,
  .foo:active img:first-child,
  .foo:focus img:first-child {
    display: none
  }

  .foo:hover img:last-child,
  .foo:active img:last-child,
  .foo:focus img:last-child {
    display: inline-block
  }

  .price {
    margin-top: -10px;
  }
</style>
<!-- breadcrumb area start -->
<div class="breadcrumb-area">
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
<!-- breadcrumb area end -->
<div class="container">

  <div class="row">
    <div id="content" class="col-sm-12 product-wrapper">

      <?php
      if (!strpos($_SERVER['REQUEST_URI'], 'sort') !== false) {

        shuffle($products);
      }



      ?>


      <?php if ($thumb || $description) { ?>


        <?php if ($description) { ?>
          <div class="row">
            <div class="col-sm-8 offset-sm-2 text-center">
              <br />
              <h2 style="color: #EF7776;"><?php echo $heading_title; ?></h2>
              <br />
              <p style="font-size: 14.5px;">
                <i><?php echo strip_tags($description); ?></i>

              </p>
              <br />
            </div>
          </div>

        <?php } ?>


      <?php } ?>

      <?php if ($products) { ?>
        <div>
          <?php echo $column_right; ?>
        </div>
        <div class="row" style="width: 100%;">



          <div class="col-md-12 col-12">
            <div style="max-width: 200px;float:right; padding-top:5px" class="form-group input-group input-group-sm">
              <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?>&nbsp;&nbsp;</label>
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="filter-open"><i class="fa fa-filter"></i></button>
            </div>
          </div>

        </div>


        <div id="product_box" class="row">
          <?php $k = 0;
          foreach ($products as $product) { ?>
            <?php if ($k < 6) { ?>
              <div style="margin-bottom:20px" class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-6 text-center">
                <div class="product-thumb">
                  <?php if ($product['quantity'] == 0) { ?>
                    <div class="d-flex justify-content-end">
                      <p class="sold-out">Sold Out</p>
                    </div>
                    
                  <?php } ?>
                  <div class="image">
                    <a class="foo" onclick="" href="<?php echo $product['href']; ?>">
                      <img onclick="" style="z-index:99999999" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive pthumb" />
                      <img onclick="" src="<?php print_r($images[$product['product_id']]['popup']); ?>" class="img-responsive" />
                    </a>
                    <span class="size-strip">
                      <ul class="size-list">
                        <?php for ($i = 0; $i < sizeof($product['option']); $i++) {
                          if ($product['option'][$i]['option_id'] == 13) {
                            for ($j = 0; $j < sizeof($product['option'][$i]['product_option_value']); $j++) {
                              echo '<li>' . $product['option'][$i]['product_option_value'][$j]['name'] . '</li>';
                            }
                          }
                        } ?>

                      </ul>
                    </span>
                  </div>
                  <div>


                    <div class="caption">
                      <p style="text-transform: uppercase;" class="product_name"><?php echo $product['name']; ?></p>
                      <?php if ($product['price']) { ?>
                        <p class="price">
                          <?php if (!$product['special']) { ?>
                            <?php echo preg_replace('~\.0+$~', '', $product['price']); ?>
                          <?php } else { ?>

                            <span style="white-space:nowrap" class="price-new"><?php echo $product['special']; ?></span>
                            <span style="white-space:nowrap" class="price-old"><?php echo $product['price']; ?></span>
                          <?php } ?>
                        </p>
                      <?php } ?>
                    </div>

                    
                  </div>
                </div>
              </div>
            <?php } else {
              break;
            } ?>
          <?php $k++;
          } ?>
        </div>


      <?php } ?>


      <?php if (!$categories && !$products) { ?>
        <div class="row" style="min-height: 60vh;">
          <div class="col-sm-12 text-center">
            <br /><br /><br />
            <h3>Products Coming Soon, Stay Tunned!</h3>
            <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
            <br /><br />
          </div>
        </div>

      <?php } ?>
      <div id="reached"></div>
    </div>

  </div>
</div>

<script>
  $(".filter-open").click(function() {

    $(".filter-slider").animate({
      'left': 0
    })
    $(".overlay").fadeIn();
  })

  $(".overlay").click(function() {
    $(".filter-slider").animate({
      'left': -250
    })
    $(".overlay").fadeOut();
  })
  $(document).ready(function(e) {
    $('.pagination li').each(function() {
      if ($(this).text() == '>' || $(this).text() == '<' || $(this).text() == '>|' || $(this).text() ==
        '|<') {
        $(this).css('display', 'none');
      }
    });
    var start_point = 6;
    var chunk = 6;
    var product_data = <?php print_r(json_encode($products)); ?>;
    var imgss = <?php print_r(json_encode($images)); ?>;



    $(window).scroll(function() {
      if ($('#reached').offset().top < $(this).height() + $(this).scrollTop()) {
        var i;
        console.log(start_point);
        if (start_point < product_data.length) {
          for (i = start_point; i < (start_point + chunk); i++) {
            if (typeof product_data[i] === 'undefined') {
              break;
            } else {
              var p =
                '  <div style="margin-bottom:20px" class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-6 text-center">';
              p += '<div class="product-thumb">';
              p += '<div class="d-flex justify-content-end">';
              if (product_data[i]['quantity'] == 0) {
                p += '<p class="sold-out">Sold Out</p>';
              }
              p += '</div>';
              p += ' <div class="image"><a class="foo" href="' + product_data[i]['href'] + '">';
              p += ' <img style="z-index:99999999" src="' + product_data[i]['thumb'] + '" alt="' +
                product_data[i]['name'] + '" title="' + product_data[i]['name'] +
                '" class="img-responsive pthumb" />';
              p += '<img src="' + imgss[product_data[i]['product_id']]['popup'] +
                '" class="img-responsive" /></a>';

              p += '<span class="size-strip"><ul class="size-list">';

              for (j = 0; j < product_data[i]['option'].length; j++) {
                if (product_data[i]['option'][j]['option_id'] == 13) {
                  for (k = 0; k < product_data[i]['option'][j]['product_option_value']
                    .length; k++) {
                    p += '<li>' + product_data[i]['option'][j]['product_option_value'][k][
                      'name'
                    ] + '</li>';
                  }
                }
              }


              p += '</ul></span></div>';
              p += '<div> <div class="caption"><p style="text-transform:uppercase;" class="product_name">' + product_data[i]['name'] +
                '</p>';
              p += '<p class="price">';

              if (!product_data[i]['special']) {
                p += product_data[i]['price'];
              } else {

                p += '<span style="white-space:nowrap" class="price-new">' + product_data[i][
                  'special'
                ] + '</span> <span style="white-space:nowrap" class="price-old">' + product_data[
                  i]['price'] + '</span>';
              }
              p += '</p></div>';

              

              p += '</div>';
              $("#product_box").append(p);
            }

          }
        }

        start_point = start_point + chunk;
      }
    });

  });



  $('body').on("mouseenter", ".foo", function() {
    $(this).find('img').eq(0).css('display', "none");
    $(this).find('img').eq(1).css('display', "inline-block");
  })

  $('body').on("mouseleave", ".foo", function() {
    $(this).find('img').eq(1).css('display', "none");
    $(this).find('img').eq(0).css('display', "inline-block");
  })
</script>


<?php echo $footer; ?>
