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
<div style="width: 100%" class="container">
  <?php if ($error_warning) { ?>
    <style>
      .error_hand {
        border: thin solid #B15153
      }
    </style>
  <?php } ?>


  <div style="margin-top: 40px;" class="row">
    <div class="col-sm-12">

      <br /><br />
      <div style="text-align: center ; background: #f1f1f1; margin-bottom: 50px;padding: 20px;" class="col-sm-4 offset-sm-4">

        <div class="well">


          <h2>Sign in to your account</h2>

          <br />
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

            <div class="form-group">
              <div class="row">
                <div class="col-sm-10 offset-sm-1">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Email *" id="input-email" class="form-control error_hand" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="row">
                <div class="col-sm-10 offset-sm-1">
                  <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Password *" id="input-password" class="form-control error_hand" />

                </div>
              </div>

            </div>
            <div class="row">
              <div class="col-sm-10 offset-sm-1">
                <button style="margin-top:5px; width:100%" class="btn btn-primary" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;LOGIN&nbsp;&nbsp;&nbsp;&nbsp;</button>
              </div>
            </div>

            <br /><a style="color:#333" href="<?php echo $forgotten; ?>"><u>FORGOTTEN YOUR PASSWORD ?</u></a>

            <?php if ($redirect) { ?>

              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

            <?php } ?>
            <p style="text-transform:uppercase;">Don't have an account? <a style="margin-top: 10px; text-decoration:underline; color:#4A4A4A" href="<?php echo $register; ?>">Register Here</a> </p>




            <?php echo $content_bottom; ?>

          </form>

        </div>

      </div>
      <br /><br />
    </div>
    <?php if ($error_warning) { ?>
      <div style="text-align:center; width:100%" class="row">
        <div class="col-sm-6 offset-sm-3">
          <p style="color:#A44446; margin-top:-30px; margin-bottom:50px">Your Email address or password is incorrect or not registered at Poetica</p>

        </div>

      </div>
    <?php } ?>

  </div>
</div>
</div>

<?php echo $footer; ?>