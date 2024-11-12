<?php echo $header; ?>
<div class="container">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
    <div id="content" class="col-sm-10 col-sm-offset-1"><?php echo $content_top; ?>
      <br />
      <div class="row">
      <div style="text-align:center" class="col-sm-12">
      <h3 style="text-transform:uppercase"><?php echo $heading_title; ?></h3>
      </div>
      </div>
      <div style="margin-top:30px" class="row">
      <div class="col-sm-6 col-sm-offset-3">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group required">
            <div class="col-sm-10 col-sm-offset-1">
              <input type="email" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
      
            </div>
            <div style="margin-top:30px" class="col-sm-10 col-sm-offset-1">
              <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-primary">&nbsp;back&nbsp;</a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      
            </div>
            
            <?php if(isset($success_password)){?>
            <div class="col-sm-10 col-sm-offset-1">
            <p><?php echo $success_password;?><a href="http://etre.in/index.php?route=account/login">Login again</a></p>
            </div>
            <?php }?>
          </div>
        </fieldset>
       </form>  
      </div>
      </div>
    
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>