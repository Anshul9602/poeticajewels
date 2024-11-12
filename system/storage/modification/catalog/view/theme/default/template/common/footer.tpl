<!-- Scroll to top start -->
<div class="float ">
 <a href="https://api.whatsapp.com/send?phone=+9180030 03344&amp;text=HELLO"  style="bottom:115px;right:20px;" target="_blank">
  <i class="fa fa-whatsapp wp-button"></i>
</a>
</div>
<div class="scroll-top not-visible">
  
</div>
<!-- Scroll to Top End -->
<style>
  .ful {
    position: absolute;
    width: 150px;
    right: 0px;
    margin-top: -70px;
  }

  .footer-top {
    margin: auto;
    background-color: transparent;
  }

  footer {
    background-image: url(image/footerbg21.jpg);
    background-size: contain;
    background-repeat: no-repeat;
    background-color: #FFf;
    background-position: bottom;

  }
  .float {
    position: fixed;
    width: 60px;
    height: 60px;
    bottom: 115px;
    right: 60px;
    background-color: #25d366;
    color: #FFF;
    border-radius: 50px;
    text-align: center;
    font-size: 35px;
    box-shadow: 2px 2px 3px #999;
    z-index: 100;
  }

  @media screen and (max-width:650px) {
    footer {
      background-image: url(image/footerbgm.jpg);
    }
  }

  .tag-line {
    font-family: 'Fleur De Leah', cursive;
    font-size: 24px;
    color: #b5b5b5;
    letter-spacing: 1.5px;
  }
</style>
<!-- footer area start -->

<footer class="footer-widget-area">
  <div class="footer-top">
    <div style="max-width: 1250px; margin:auto" class="container">

      <br /><br />
      <div class="row">
        <div class="col-sm-12 text-center">
          <img style="width: 150px;" src="<?php echo $logo; ?>" alt="brand logo">
          <p class="tag-line text-center">you are the poetry</p>
        </div>
      </div>
      <br /> <br />
      <div class="row">
        <div class="col-lg-4 col-md-6">

          <div class="widget-item">
            <h6 class="widget-title"></h6>
            <div class="widget-body">
              <p style="margin-top: -20px;">Each of our jewellery pieces is a work of art with
                a lot of thought going into each design making
                you fall in love with each design as you would
                fall in love with beautiful poetry.</p>
            </div>
            <div class="widget-body social-link">
              <a href="https://www.facebook.com/Poetica-149038950622178"><i class="fa fa-facebook"></i></a>

              <a href="https://www.instagram.com/poeticajewels/"><i class="fa fa-instagram"></i></a>
              <a href="https://twitter.com/poeticajewels"><i class="fa fa-twitter"></i></a>
              <a href="https://in.pinterest.com/poeticajewels/"><i class="fa fa-pinterest"></i></a>

            </div>

          </div>

        </div>

        <div class="col-lg-4 col-md-6">
          <div class="widget-item">

            <div class="widget-body">
              <ul class="info-list">
                <li><a href="index.php?route=common/about">about us</a></li>
                <?php foreach ($informations as $information) { ?>
                  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
                <li><a href="<?php echo $contact; ?>">contact us</a></li>
                <li><a href="<?php echo $sitemap; ?>">site map</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="widget-item">

            <div class="newsletter-wrapper">
              <h6 style="font-weight: 400;" class="widget-title-text">Signup for newsletter</h6>
              <form class="newsletter-inner" id="mc-form">
                <input type="email" class="news-field" id="mc-email" autocomplete="off" placeholder="Enter your email address">
                <button class="news-btn" id="mc-submit">Subscribe</button>
              </form>
              <!-- mailchimp-alerts Start -->
              <div class="mailchimp-alerts">
                <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                <div class="mailchimp-error"></div><!-- mailchimp-error end -->
              </div>
              <!-- mailchimp-alerts end -->
            </div>
          </div>
        </div>
      </div>
      <br /><br />



    </div>

  </div>


</footer>
<!-- footer area end -->




<!-- JS
============================================ -->

<!-- Modernizer JS -->
<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>

<!-- Popper JS -->
<script src="assets/js/vendor/popper.min.js"></script>


<!-- Countdown JS -->
<script src="assets/js/plugins/countdown.min.js"></script>

<!-- jquery UI JS -->
<script src="assets/js/plugins/jqueryui.min.js"></script>
<!-- Image zoom JS -->
<script src="assets/js/plugins/image-zoom.min.js"></script>
<!-- Imagesloaded JS -->
<script src="assets/js/plugins/imagesloaded.pkgd.min.js"></script>
<!-- Instagram feed JS -->
<script src="assets/js/plugins/instagramfeed.min.js"></script>
<!-- mailchimp active js -->
<script src="assets/js/plugins/ajaxchimp.js"></script>
<!-- contact form dynamic js -->
<script src="assets/js/plugins/ajax-mail.js"></script>
<!-- google map api -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfmCVTjRI007pC1Yk2o2d_EhgkjTsFVN8"></script>
<!-- google map active js -->
<script src="assets/js/plugins/google-map.js"></script>
<!-- Main JS -->
<script src="assets/js/main.js"></script>
<!-- jquery UI JS -->
<script src="assets/js/plugins/jqueryui.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/vendor/bootstrap.min.js"></script>

			<?php /*esbuygetcombo starts*/ ?>
			<style type="text/css">
			  .product-layout .product-thumb .image {
			  	position: relative;
			  	overflow: hidden;
			  }
			  .jbuygetcombo-wrap .jbuygetcombo-ribbon{
			  	text-align: center;
			    background: red;
			    color: #fff;
			    padding: 3px 10px;
			    transform: rotate(50deg);
			    font-size: 14px;
			    font-weight: bold;
			    width: 200px;
			    position: absolute;
			    right: -45px;
			    top: 55px;
			    white-space: nowrap;
			  }
			  /*j3*/
			  html[data-jv] .jbuygetcombo-wrap{
			  	right: 0;
			  }
			  /*j3*/
			</style>
			<?php /*esbuygetcombo ends*/ ?>
			
</body>

</html>