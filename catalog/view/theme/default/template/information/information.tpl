<?php echo $header; ?>
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
<br />
<div class="container">

  <div class="row">
    <div id="content" class="col-sm-10 offset-sm-1"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <br />
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>