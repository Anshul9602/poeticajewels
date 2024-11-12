<?php echo $header; ?>
<div class="container">
  <section id="top-cate">
    <div class="container text-center">
      <br /><br />
      <h1 class="old-money" style="color: #006A4E; margin-bottom:25px;"><?php echo $heading_title; ?></h1>
      <div class="row justify-content-center" style="margin:0;">

      </div>
    </div>
  </section>
  <div class="row">


    <div id="content" class="col-sm-12"><?php echo $content_top; ?>


      <div style="display: none;" class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
              <?php if ($category_1['category_id'] == $category_id) { ?>
                <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
              <?php } ?>
              <?php foreach ($category_1['children'] as $category_2) { ?>
                <?php if ($category_2['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                <?php } ?>
                <?php foreach ($category_2['children'] as $category_3) { ?>
                  <?php if ($category_3['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
              <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
              <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p style="display: none;">
        <label class="checkbox-inline">
          <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input style="display: none;" type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <h2 style="display: none;"><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
        <div style="display: none;" class="row">
          <div class="col-md-2 col-sm-6 hidden-xs">
            <div class="btn-group btn-group-sm">
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            </div>
          </div>
          <div class="col-md-3 col-sm-6">
            <div class="form-group">
              <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
            </div>
          </div>
          <div class="col-md-4 col-xs-6">
            <div class="form-group input-group input-group-sm">
              <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-3 col-xs-6">
            <div class="form-group input-group input-group-sm">
              <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
              <select id="input-limit" class="form-control" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                    <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
        </div>


        <div class="row">
          <?php foreach ($products as $product) { ?>
            <div style="margin-bottom:20px" class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-6 text-center">
              <div class="product-thumb">
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
                    <p class="product_name"><?php echo $product['name']; ?></p>
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
          <?php } ?>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script type="text/javascript">
  $('#button-search').bind('click', function() {
    url = 'index.php?route=product/search';

    var search = $('#content input[name=\'search\']').prop('value');

    if (search) {
      url += '&search=' + encodeURIComponent(search);
    }

    var category_id = $('#content select[name=\'category_id\']').prop('value');

    if (category_id > 0) {
      url += '&category_id=' + encodeURIComponent(category_id);
    }

    var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

    if (sub_category) {
      url += '&sub_category=true';
    }

    var filter_description = $('#content input[name=\'description\']:checked').prop('value');

    if (filter_description) {
      url += '&description=true';
    }

    location = url;
  });

  $('#content input[name=\'search\']').bind('keydown', function(e) {
    if (e.keyCode == 13) {
      $('#button-search').trigger('click');
    }
  });

  $('select[name=\'category_id\']').on('change', function() {
    if (this.value == '0') {
      $('input[name=\'sub_category\']').prop('disabled', true);
    } else {
      $('input[name=\'sub_category\']').prop('disabled', false);
    }
  });

  $('select[name=\'category_id\']').trigger('change');
</script>
<?php echo $footer; ?>