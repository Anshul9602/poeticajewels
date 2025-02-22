<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>" />
    <h4 class="text-success hidden" id="text-redirect"><?php echo $text_redirect; ?></h4>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		dataType: "json",
		url: 'index.php?route=extension/payment/cashfree/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},
		success: function(response) {
            if (response.status == 1) {
            	$('#button-confirm').hide();
            	$('#text-redirect').removeClass("hidden");
               	location.href = response.redirect;
            } else {
            	alert(response.message);
            }
		}
	});
});
//--></script>