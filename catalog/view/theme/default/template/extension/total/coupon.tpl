<h3 style="color:#006A4E" class="old-money">
	<?php echo $heading_title; ?>
</h3>
<br />
<div class="input-group">
	<input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
	<br />

	<span class="input-group-btn">
		<button style="padding:0px 17.5px; margin-top:0px; height:40px" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">
			Apply
		</button>
	</span>
</div>
<p class="invalid-code" style="color:maroon; font-size:13px"></p>
<div class="panel panel-default">
	<div class="panel-heading">
	</div>
	<div id="collapse-coupon" style="margin-top:-10px;" class="panel-collapse collapse in">
		<div class="panel-body">

			<script type="text/javascript">
				$('#button-coupon').on('click', function() {
					$.ajax({
						url: 'index.php?route=extension/total/coupon/coupon',
						type: 'post',
						data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
						dataType: 'json',
						beforeSend: function() {
							$('#button-coupon').button('loading');
						},
						complete: function() {
							$('#button-coupon').button('reset');
						},
						success: function(json) {
							$('.alert').remove();

							if (json['error']) {
								$(".invalid-code").text('Invalid Coupon Code!');
								$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

								$('html, body').animate({
									scrollTop: 0
								}, 'slow');
							}

							if (json['redirect']) {
								location = json['redirect'];
							}
						}
					});
				});
				//
			</script>
		</div>
	</div>
</div>