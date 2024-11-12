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

  <!-- google fonts -->
  <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900" rel="stylesheet">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
  <!-- Pe-icon-7-stroke CSS -->
  <link rel="stylesheet" href="assets/css/vendor/pe-icon-7-stroke.css">
  <!-- Font-awesome CSS -->
  <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
  <!-- Slick slider css -->
  <link rel="stylesheet" href="assets/css/plugins/slick.min.css">
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


  <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>

  <script src="catalog/view/javascript/common.js" type="text/javascript"></script>

  <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
  <?php } ?>
</head>

<body class="<?php echo $class; ?>">
  <!-- Start Header Area -->
  <header class="header-area">
    <!-- main header start -->
    <div class="main-header d-none d-lg-block">
      <nav id="top">
        <div class="container">
          <div class="row">
            <div class="col-sm-4">
              <span id="donate-msg">
                <a style="color:#fff; text-transform: initial" href="mailto:info@novaltykart.com">
                  <li class="fa fa-envelope"></li> &nbsp;Info@novaltykart.com
                </a>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <span>
                  <li class="fa fa-phone"></li> +91 949 123 6910
                </span>

              </span>

            </div>
            <div class="col-sm-4 text-center">

            </div>
            <div class="col-sm-4 workshop-link">

              <div style="border: none; padding:0px; margin:0px" class="mobile-settings">
                <span id="donate-msg">
                  <?php if (!$logged) { ?>
                    <a style="color:#fff" href="index.php?route=account/register">
                      Hello, There!
                    </a>
                  <?php } else { ?>
                    <a style="color:#fff" href="index.php?route=account/account">
                      Hello, <?php echo $text_customer_name; ?>!
                    </a>
                  <?php } ?>
                </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <ul style="float: right;" class="nav">
                  <li>
                    <div class="dropdown mobile-top-dropdown">
                      <a href="#" style="color:#fff; font-size:11px" class="dropdown-toggle" id="currency" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Currency
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="currency">
                        <a class="dropdown-item" href="#">$ USD</a>
                        <a class="dropdown-item" href="#">$ EURO</a>
                      </div>
                    </div>
                  </li>

                </ul>
              </div>
            </div>
          </div>
        </div>
      </nav>

      <!-- header middle area start -->
      <div class="header-main-area">
        <div class="container">
          <div class="row align-items-center ptb-10">
            <!-- header social area start -->
            <div class="col-lg-4">
              <div class="header-social-link">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-youtube-play"></i></a>
              </div>
            </div>
            <!-- header social area end -->

            <!-- start logo area -->
            <div class="col-lg-4">
              <div class="logo text-center">
                <a href="<?php echo $home; ?>">
                  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                </a>
              </div>
            </div>
            <!-- start logo area -->

            <!-- mini cart area start -->
            <div class="col-lg-4">
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
          <div class="row">
            <!-- main menu area start -->
            <div class="col-12">
              <div class="main-menu-area sticky">

                <div class="main-menu">
                  <!-- main menu navbar start -->
                  <nav class="desktop-menu">
                    <ul class="justify-content-center header-style-4">
                      <li><a href="index.php?route=common/home">Home</a></li>

                      <?php foreach ($categories as $category) { ?>
                        <?php if (strtolower($category['name']) == "header") { ?>
                          <?php if ($category['children']) { ?>
                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                              <?php foreach ($children as $child) { ?>
                                <li>
                                  <a href="<?php echo $child['href']; ?>">
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


                    </ul>
                  </nav>
                  <!-- main menu navbar end -->
                </div>


              </div>
            </div>
            <!-- main menu area end -->
          </div>
        </div>
      </div>
      <!-- header middle area end -->
    </div>
    <!-- main header start -->

    <!-- mobile header start -->
    <!-- mobile header start -->
    <div style="padding: 0px;" class="mobile-header d-lg-none d-md-block sticky">
      <nav id="top">
        <div class="container">
          <div class="row">
            <div class="col-6">
              <span id="donate-msg">
                <a style="color:#fff; text-transform: initial" href="mailto:info@novaltykart.com">
                  <li class="fa fa-envelope"></li> &nbsp;Info@novaltykart.com
                </a>
              </span>

            </div>

            <div class="col-6 workshop-link">

              <div style="border: none; padding:0px; margin:0px" class="mobile-settings">
                <span id="donate-msg">
                  <?php if (!$logged) { ?>
                    <a style="color:#fff" href="index.php?route=account/register">
                      Hello, There!
                    </a>
                  <?php } else { ?>
                    <a style="color:#fff" href="index.php?route=account/account">
                      Hello, <?php echo $text_customer_name; ?>!
                    </a>
                  <?php } ?>
                </span>

              </div>
            </div>
          </div>
        </div>
      </nav>
      <!--mobile header top start -->
      <div style="padding: 10px;" class="container-fluid">
        <div class="row align-items-center">
          <div class="col-12">
            <div class="mobile-main-header">
              <div class="mobile-logo">
                <a href="<?php echo $home; ?>">
                  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
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

                <li><a href="index.php?route=common/home">Home</a></li>


                <?php foreach ($categories as $category) { ?>
                  <?php if (strtolower($category['name']) == "header") { ?>
                    <?php if ($category['children']) { ?>
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <?php foreach ($children as $child) { ?>
                          <li class="menu-item-has-children">
                            <a href="<?php echo $child['href']; ?>">
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



                <li><a href="index.php?route=information/contact">Contact</a></li>
              </ul>
            </nav>
            <!-- mobile menu navigation end -->
          </div>
          <!-- mobile menu end -->

          <div class="mobile-settings">
            <ul class="nav">
              <li>
                <div class="dropdown mobile-top-dropdown">
                  <a href="#" class="dropdown-toggle" id="currency" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Currency
                    <i class="fa fa-angle-down"></i>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="currency">
                    <a class="dropdown-item" href="#">$ USD</a>
                    <a class="dropdown-item" href="#">$ EURO</a>
                  </div>
                </div>
              </li>
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
                  <a href="#">0123456789</a>
                </li>
                <li><i class="fa fa-envelope-o"></i>
                  <a href="#">info@yourdomain.com</a>
                </li>
              </ul>
            </div>
            <div class="off-canvas-social-widget">
              <a href="#"><i class="fa fa-facebook"></i></a>
              <a href="#"><i class="fa fa-twitter"></i></a>
              <a href="#"><i class="fa fa-pinterest-p"></i></a>
              <a href="#"><i class="fa fa-linkedin"></i></a>
              <a href="#"><i class="fa fa-youtube-play"></i></a>
            </div>
          </div>
          <!-- offcanvas widget area end -->
        </div>

      </div>
    </aside>
    <!-- off-canvas menu end -->
    <!-- offcanvas mobile menu end -->
    <?php echo $cart; ?>
  </header>
  <!-- end Header Area -->