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

<div class="container">

  <div class="row">
    <div id="content" style="min-height: 40vh;" class="col-12 text-center"><?php echo $content_top; ?>
      <br /><br />
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-center">
          <button href="<?php echo $continue; ?>" class="btn btn-hero">
            <?php echo $button_continue; ?>
          </button></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>