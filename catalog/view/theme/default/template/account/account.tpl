<?php echo $header; ?>

<style>
  .ac_menu .col-sm-4 {
    padding: 20px;
    margin: 0px;
    text-align: center;
  }

  .ac_menu .col-sm-4 .col-sm-12 {
    border: thin solid #ccc;
    padding: 10px;
    height: 228px
  }

  .col-sm-12 a {
    font-size: 18px;
    color: #525252
  }

  .ac_description {
    margin-top: 12px;
    font-weight: 300 !important;
    color: #333
  }
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- breadcrumb area start -->
<div style="background:#f1f1f1; border-bottom:thin solid #fff" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.php?route=common/home"><i class="fa fa-home"></i></a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">account</li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- breadcrumb area end -->


<div style=" width:100%; min-height: 600px;" class="container">

  <div style="margin:60px 0px" class="row text-center">
    <br /><br /> <br /><br /> <br /><br />
    <h1 style="text-align: center; margin: auto;" class="big">My Account</h1>


  </div>



  <div class="row">
    <div id="content" class="col-sm-12">

      <?php echo $content_top; ?>



      <div class="row ac_menu">




        <div class="col-sm-4">
          <div class="col-sm-12">
            <img width="120" src="image/icons/Icon1.png" /><br />
            <a href="index.php?route=account/address/edit&address_id=<?php echo $address_id; ?>">Account
              Details</a>
            <p class="ac_description">Review your personal information.</p> <br />
          </div>
        </div>


        <div class="col-sm-4">
          <div class="col-sm-12">
            <img width="120" src="image/icons/Icon3.png" /><br />
            <a href="<?php echo $wishlist; ?>">Wishlist</a>
            <p class="ac_description">Don't lose sight of the articles you like most, access your wishlist here.
            </p>
          </div>
        </div>


        <div class="col-sm-4">
          <div class="col-sm-12">
            <img width="120" src="image/icons/Icon2.png" /><br />
            <a href="<?php echo $order; ?>">Order History</a>
            <p class="ac_description">Check the history and current status of your orders.</p>

          </div>

        </div>







      </div>






    </div>
  </div>

</div>
<?php echo $footer; ?>