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

  <div class="row"><?php echo $column_left; ?>

    <div id="content" class="col-12 text-center"><?php echo $content_top; ?>
      <br /><br />
      <img src="image/icons/sucssess.gif" style="max-width: 230px;" alt="" class="img-responsive">
      <h3>Congratulation<br /><?php echo $heading_title; ?></h3>

      <div class="buttons">
        <div>
          <a href="index.php?route=account/account">
            <button class="btn btn-hero"><?php echo $button_continue; ?></button></div>

        </a>
        <br /><br /><br /><br />
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>