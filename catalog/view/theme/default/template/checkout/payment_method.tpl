<?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
  <br />
  <p class="checkout_heading">Payment Method</p>

  <p><strong><?php echo $text_comments; ?></strong></p>
  <?php foreach ($payment_methods as $payment_method) { ?>
    <div class="radio">
      <label>
        <?php if ($payment_method['code'] == $code || !$code) { ?>
          <?php $code = $payment_method['code']; ?>
          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
        <?php } else { ?>
          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
        <?php } ?>
        <?php echo $payment_method['title']; ?>
        <?php if ($payment_method['terms']) { ?>
          (<?php echo $payment_method['terms']; ?>)
        <?php } ?>
      </label>
    </div>
  <?php } ?>
<?php } ?>

<p>
  <textarea name="comment" rows="8" class="form-control" style="display: none;"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
  <div style="display: none;" class="buttons">
    <div class="pull-right"><?php echo $text_agree; ?>
      <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
      <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
      <?php } ?>
      &nbsp;
      <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
  </div>
<?php } else { ?>
  <div style="display: none;" class="buttons">
    <div class="pull-right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-hero" />
    </div>
  </div>
<?php } ?>

<script>
  $(document).ready(function() {
    $('body').on('click', "input[name='prod_opt']", function() {
      $("#button-payment-method").click();
      location.reload();
    })
  })
</script>