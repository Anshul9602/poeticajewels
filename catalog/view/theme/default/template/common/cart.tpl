<style>
  .minicart-inner {
    z-index: 999999999;
  }
</style>
<!-- offcanvas mini cart start -->
<div class="offcanvas-minicart-wrapper">
  <div class="minicart-inner">
    <div class="offcanvas-overlay"></div>
    <div class="minicart-inner-content">
      <div class="minicart-close">
        <i class="pe-7s-close"></i>

      </div>


      <div class="minicart-content-box">
        <div class="minicart-item-wrapper" id="cart">
          <?php if ($products || $vouchers) { ?>
            <ul class="here">

              <?php foreach ($products as $product) { ?>
                <li class="minicart-item">
                  <div class="minicart-thumb">
                    <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="product">
                    </a>
                  </div>
                  <div class="minicart-content">
                    <h3 style="font-size:20px" class="product-name">
                      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </h3>
                    <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                        <br />
                        - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                      <?php } ?>
                    <?php } ?>
                    <p>
                      <span class="cart-quantity"><?php echo $product['quantity']; ?> <strong>&times;</strong></span>
                      <span class="cart-price"><?php echo $product['price']; ?></span>
                    </p>
                  </div>
                  <button onclick="cart.remove('<?php echo $product['cart_id']; ?>');" class="minicart-remove"><i class="pe-7s-close"></i></button>
                </li>
              <?php } ?>
            </ul>
        </div>


      </div>
    <?php } else { ?>
      <ul class="here">
        <li class="emty">Cart Is Empty</li>
      </ul>
    </div>
    <div style="position: absolute; width:80%; bottom:120px" class="minicart-pricing-box">
      <ul>

      </ul>
    </div>

  <?php } ?>

  <div style="position: absolute; 
    <?php if (preg_replace('/[^0-9]/', '', $totals[sizeof($totals) - 1]['text']) == 0) { ?>
    display:none; 
    <?php } else { ?>
      display:inline; 
    <?php } ?>
    width:80%; padding-top:0px; padding-bottom:5px; bottom:0px; border:none" class="minicart-pricing-box">
    <ul>

      <li class="total">
        <span><?php echo $totals[sizeof($totals) - 1]['title']; ?></span>
        <span><strong class="mincart-total"><?php echo $totals[sizeof($totals) - 1]['text']; ?></strong></span>
      </li>
    </ul>
    <br />
    <div class="minicart-button">
      <a href="<?php echo $cart; ?>"><i class="fa fa-shopping-cart"></i> View Cart & Checkout</a>
    </div>
  </div>
  </div>
</div>
</div>
<!-- offcanvas mini cart end -->