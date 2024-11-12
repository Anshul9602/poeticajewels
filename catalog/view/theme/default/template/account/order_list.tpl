<?php echo $header; ?>
<!-- breadcrumb area start -->
<div style="background:#f1f1f1; border-bottom:thin solid #fff" class="breadcrumb-area">
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
<div style="min-height:80vh; margin-top:50px" class="container">

  <div class="row">
    <div id="content" class="col-sm-10 offset-sm-1">
      <h2><?php echo $heading_title; ?></h2>
      <br />
      <?php if ($orders) { ?>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right"><?php echo $column_order_id; ?></td>
                <td class="text-left"><?php echo $column_customer; ?></td>
                <td class="text-right"><?php echo $column_product; ?></td>
                <td class="text-left"><?php echo $column_status; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
                <td class="text-left"><?php echo $column_date_added; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-right">#<?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['name']; ?></td>
                  <td class="text-right"><?php echo $order['products']; ?></td>
                  <td class="text-left"><?php echo $order['status']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-right">
                    <a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info">
                      View Details</a></td>
                </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-hero">
            <?php echo $button_continue; ?></a>
          &nbsp;&nbsp;
          <a href="index.php?route=account/return" class="btn btn-hero">Returns</a>
        </div>


      </div>
      <?php echo $content_bottom; ?>
    </div>

  </div>
</div>
<?php echo $footer; ?>