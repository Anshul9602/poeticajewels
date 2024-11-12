<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
  <?php } ?>
  <meta name="google-site-verification" content="hIIKiAb62gR7LGx5e95_tdO4GgkNBqDexuzACo6EK1s" />
  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;500;600&display=swap" rel="stylesheet">


  <link href="https://fonts.googleapis.com/css2?family=Fleur+De+Leah&display=swap" rel="stylesheet">
  <meta name="facebook-domain-verification" content="ndnk5xfkxdu8xrsbvdbn518ynvehqr" />
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
  <!-- Pe-icon-7-stroke CSS -->
  <link rel="stylesheet" href="assets/css/vendor/pe-icon-7-stroke.css">
  <!-- Font-awesome CSS -->
  <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
  <!-- Slick slider css -->
  <link rel="stylesheet" href="assets/css/plugins/slick.min.css">
  <link rel="stylesheet" type="text/css" href="assets/css/plugins/slick-theme.css">
  <!-- animate css -->
  <link rel="stylesheet" href="assets/css/plugins/animate.css">
  <!-- Nice Select css -->
  <link rel="stylesheet" href="assets/css/plugins/nice-select.css">
  <!-- jquery UI css -->
  <link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">
  <!-- main style css -->
  <link rel="stylesheet" href="assets/css/style.css">


  <!-- jQuery JS -->
  <script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
  <!-- slick Slider JS -->
  <script src="assets/js/plugins/slick.min.js"></script>

  <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>

  <script src="catalog/view/javascript/common.js?v1.1266563" type="text/javascript"></script>

  <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
  <?php } ?>

  <style>
    @media (min-width: 1140px) {
      .container {
        max-width: 1140px;
      }
    }

    @media (min-width: 1200px) {
      .container {
        max-width: 90%;
      }
    }

    @media (min-width: 1450px) {
      .container {
        max-width: 80%;
      }
    }

    @font-face {
      font-family: vouge;
      src: url(assets/fonts/Vogue.ttf);
    }

    .breadcrumb-wrap {
      padding: 14px 0;
    }

    .breadcrumb-area {
      background-color: #F0EEE2;
      /* display: none; */
    }



    h1,
    h2,
    h3,
    h4,
    h5 {
      font-family: 'Cormorant Garamond',
        serif;
      letter-spacing: 1px;
      font-weight: 500;
    }

    .breadcrumb-area {
      background-color: #F0EEE2;
    }

    .breadcrumb-wrap {
      padding: 7px 0px;
    }
    header{
      border:none;
    }
    .float {
    position: fixed;
    width: 50px;
    height: 50px;
    bottom: 115px;
    right: 20px;
    background-color: #EF7776;
    color: #FFF;
    border-radius: 50px;
    text-align: center;
    font-size: 32px;
    box-shadow: 2px 2px 3px #999;
    z-index: 100;
  }
  </style>


</head>

<body style="background: url('image/bgsss.jpg');" class="<?php echo $class; ?>">
  <div id="loader" style="position: fixed; top:0px; left:0px; width:100%; text-align:center; height:100vh; z-index:999999999999;
   background:#fff;">
    <img src="gif.gif" style="width: 450px;" alt="">
  </div>
  <!-- Start Header Area -->
  <header style="z-index: 99999999 !important; " class="header-area">
    <!-- main header start -->
    <div class="main-header d-none d-lg-block">


      <!-- header middle area start -->
      <div class="header-main-area main-menu-area sticky">
        <div class="container p-10">
          <div class="row align-items-center ptb-10">
            <!-- start logo area -->
            <div class="col-lg-2">
              <div class="logo text-center">
                <a href="<?php echo $home; ?>">
                  <img id="logo1" style="max-width: 130px;" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                </a>
              </div>
            </div>
            <!-- start logo area -->
            <div class="col-lg-8">
              <div class="">

                <div class="main-menu">
                  <!-- main menu navbar start -->
                  <nav class="desktop-menu">
                    <ul class="justify-content-center header-style-4">
                      <li><a href="index.php?route=common/about">Story</a></li>

                      <?php foreach ($categories as $category) { ?>
                        <?php if (strtolower($category['name']) == "header") { ?>
                          <?php if ($category['children']) { ?>
                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                              <?php foreach ($children as $child) { ?>
                                <li>
                                  <a href="#" onclick="function(){return false;}">
                                    <?php echo $child['name']; ?>
                                  </a>

                                  <?php if ($child['gc']) { ?>
                                    <ul class="dropdown">
                                      <?php foreach ($child['gc'] as $gc) { ?>

                                        <li>
                                          <a href="<?php print_r($gc['href']); ?>">
                                            <?php print_r($gc['name']); ?>
                                          </a>

                                          <?php if ($gc['g_gc']) { ?>
                                            <ul class="dropdown">
                                              <?php foreach ($gc['g_gc'] as $ggc) { ?>
                                                <li><a href="<?php print_r($ggc['href']); ?>">
                                                    <?php print_r($ggc['name']); ?>
                                                  </a></li>
                                              <?php } ?>
                                            </ul>
                                          <?php } ?>

                                        </li>
                                      <?php } ?>
                                    </ul>
                                  <?php } ?>
                                </li>
                              <?php } ?>
                            <?php } ?>
                          <?php } ?>
                        <?php } ?>
                      <?php  } ?>
                      
                      <li><a href="index.php?route=information/contact">Contact</a></li>
                      <li><a href="assets/img/Poetica_Catalogue.pdf" ><i class="fa fa-download"></i>Catalogue</a></li>

                    </ul>
                  </nav>
                  <!-- main menu navbar end -->
                </div>


              </div>
            </div>
            <!-- mini cart area start -->
            <div style="padding: 0px;" class="col-lg-2">
              <div class="header-right d-flex align-items-center justify-content-end">
                <div class="header-configure-area">
                  <ul class="nav justify-content-end">
                    <li class="header-search-container mr-0">
                      <button class="search-trigger d-block">
                        <i class="pe-7s-search"></i>
                      </button>
                      <div class="header-search-box d-none animated fadeInLeft">
                        <input type="text" id="search_top" placeholder="Search" class="header-search-field">
                        <button class="search_icon_top header-search-btn"><i class="pe-7s-search"></i></button>
                      </div>
                    </li>
                    <li class="user-hover">
                      <a href="#">
                        <i class="pe-7s-user"></i>
                      </a>
                      <ul class="dropdown-list">
                        <?php if (!$logged) { ?>

                          <li><a href="index.php?route=account/login">Login</a></li>
                          <li><a href="index.php?route=account/register">Register</a></li>
                        <?php } else { ?>
                          <li><a href="index.php?route=account/account">My account</a></li>
                          <li><a href="index.php?route=account/logout">Logout</a></li>

                        <?php } ?>
                      </ul>
                    </li>
                    <li>
                      <a href="<?php echo $wishlist; ?>">
                        <i class="pe-7s-like"></i>

                      </a>
                    </li>
                    <li>
                      <a style="cursor:pointer;" class="minicart-btn">
                        <i class="pe-7s-shopbag"></i>
                        <div id="cart_count" class="notification"><?php echo $text_items; ?>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- mini cart area end -->
          </div>

        </div>
      </div>
      <!-- header middle area end -->
    </div>
    <!-- main header start -->

    <!-- mobile header start -->
    <!-- mobile header start -->
    <div class="mobile-header d-lg-none d-md-block sticky">

      <!--mobile header top start -->
      <div style="padding: 10px;" class="container-fluid">
        <div class="row align-items-center">
          <div class="col-12">
            <div class="mobile-main-header">
              <div class="mobile-logo">
                <a href="<?php echo $home; ?>">
                  <img src="<?php echo $logo; ?>" id="logo2" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                </a>
              </div>
              <div class="mobile-menu-toggler">
                <div class="mini-cart-wrap">
                  <a style="cursor:pointer;" class="minicart-btn">
                    <i class="pe-7s-shopbag"></i>
                    <div id="cart_count" class="notification"><?php echo $text_items; ?>
                    </div>
                  </a>
                </div>
                <button class="mobile-menu-btn">
                  <span></span>
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- mobile header top start -->
    </div>
    <!-- mobile header end -->
    <!-- mobile header end -->

    <!-- offcanvas mobile menu start -->
    <!-- off-canvas menu start -->
    <aside class="off-canvas-wrapper">
      <div class="off-canvas-overlay"></div>
      <div class="off-canvas-inner-content">
        <div class="btn-close-off-canvas">
          <i class="pe-7s-close"></i>
        </div>

        <div class="off-canvas-inner">
          <!-- search box start -->
          <div class="search-box-offcanvas">
            <input type="text" id="search_top1" placeholder="Search" class="header-search-field">

          </div>
          <!-- search box end -->

          <!-- mobile menu start -->
          <div class="mobile-navigation">

            <!-- mobile menu navigation start -->
            <nav>
              <ul class="mobile-menu">

                <li><a href="index.php?route=common/about">Story</a></li>


                <?php foreach ($categories as $category) { ?>
                  <?php if (strtolower($category['name']) == "header") { ?>
                    <?php if ($category['children']) { ?>
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <?php foreach ($children as $child) { ?>
                          <li class="menu-item-has-children">
                            <a href="#" onclick="function(){return false;}">
                              <?php echo $child['name']; ?>
                            </a>
                            <?php if ($child['gc']) { ?>
                              <ul class="dropdown">
                                <?php foreach ($child['gc'] as $gc) { ?>
                                  <li class="menu-item-has-children ">
                                    <a href="<?php print_r($gc['href']); ?>">
                                      <?php print_r($gc['name']); ?>
                                    </a>
                                    <?php if ($gc['g_gc']) { ?>
                                      <ul class="dropdown">
                                        <?php foreach ($gc['g_gc'] as $ggc) { ?>
                                          <li><a href="<?php print_r($ggc['href']); ?>">
                                              <?php print_r($ggc['name']); ?>
                                            </a></li>
                                        <?php } ?>
                                      </ul>
                                    <?php } ?>

                                  </li>
                                <?php } ?>
                              </ul>
                            <?php } ?>
                          </li>
                        <?php } ?>
                      <?php } ?>
                    <?php } ?>
                  <?php } ?>
                <?php  } ?>
                <li><a style="color:#E66E94" href="valentine-collection"><b>Valentine Store</b></a></li>
                 
                <li><a href="index.php?route=information/contact">Contact</a></li>
                <li><a href="assets/img/Poetica_Catalogue.pdf" download><i class="fa fa-download"></i>Catalogue</a></li>
              </ul>
            </nav>
            <!-- mobile menu navigation end -->
          </div>
          <!-- mobile menu end -->

          <div class="mobile-settings">
            <ul class="nav">

              <li>
                <div class="dropdown mobile-top-dropdown">
                  <a href="#" class="dropdown-toggle" id="myaccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    My Account
                    <i class="fa fa-angle-down"></i>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="myaccount">
                    <?php if (!$logged) { ?>

                      <a class="dropdown-item" href="index.php?route=account/login">Login</a>
                      <a class="dropdown-item" href="index.php?route=account/register">Register</a>
                    <?php } else { ?>
                      <a class="dropdown-item" href="index.php?route=account/account">My account</a>
                      <a class="dropdown-item" href="index.php?route=account/logout">Logout</a>

                    <?php } ?>



                  </div>
                </div>
              </li>
            </ul>
          </div>

          <!-- offcanvas widget area start -->
          <div class="offcanvas-widget-area">
            <div class="off-canvas-contact-widget">
              <ul>
                <li><i class="fa fa-mobile"></i>
                  <a href="#">+91 800300 3344</a>
                </li>
                <li><i class="fa fa-envelope-o"></i>
                  <a href="#">poeticajewels@gmail.com</a>
                </li>
              </ul>
            </div>
            <div class="off-canvas-social-widget">
              <a href="https://www.facebook.com/Poetica-149038950622178"><i class="fa fa-facebook"></i></a>

              <a href="https://www.instagram.com/poeticajewels/"><i class="fa fa-instagram"></i></a>
              <a href="https://twitter.com/poeticajewels"><i class="fa fa-twitter"></i></a>
              <a href="https://in.pinterest.com/poeticajewels/"><i class="fa fa-pinterest"></i></a>
            </div>
          </div>
          <!-- offcanvas widget area end -->
        </div>

      </div>
    </aside>
    <div class="float ">
 <a href="https://api.whatsapp.com/send?phone=+9180030 03344&amp;text=HELLO"  style="bottom:115px;right:20px;" target="_blank">
  <i class="fa fa-whatsapp wp-button" style="color:white;"></i>
</a>
</div>
    <!-- off-canvas menu end -->
    <!-- offcanvas mobile menu end -->
    <?php echo $cart; ?>
  </header>
  <!-- end Header Area -->

  <script>
    $(document).ready(function() {
      setTimeout(function() {
        $('#loader').fadeOut();
      }, 1000)

    })
  </script>
