<?php echo $header; ?>
<style>
  .home-banners .slick-dots {
    bottom: 25px;
  }

  #logo1,
  #logo2 {
    filter: brightness(0) invert(1);
  }

  .is-sticky #logo1,
  .is-sticky #logo2 {
    filter: none;
  }

  .header-main-area {
    background: transparent !important;
    z-index: 9999999 !important;
    position: fixed;
    width: 100%;
  }

  .para-div {
    background-color: #D7D5C9;


    text-align: left;

  }


  .main-menu ul.header-style-4>li a {
    color: #fff;
  }

  .header-main-area [class^="pe-7s-"],
  .header-main-area [class*=" pe-7s-"] {
    color: #fff;
  }

  .header-main-area.is-sticky {
    background: #fff !important;
    color: #000;

  }

  .header-main-area.is-sticky .main-menu ul.header-style-4>li a {
    color: #000;
  }

  .header-main-area.is-sticky [class^="pe-7s-"],
  .header-main-area.is-sticky [class*=" pe-7s-"] {
    color: #000;
  }

  .row-grid {
    display: -ms-flexbox;
    /* IE10 */
    display: flex;
    -ms-flex-wrap: wrap;
    /* IE10 */
    flex-wrap: wrap;
    padding: 0 4px;
  }

  .column {
    -ms-flex: 33.33%;
    /* IE10 */
    flex: 33.33%;
    max-width: 33.33%;
    padding: 0 4px;

  }

  .column.c1 {
    -ms-flex: 50%;
    /* IE10 */
    flex: 50%;
    max-width: 50%;
    padding: 0 4px;
    display: inline-block;

  }

  .prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  color:black;
}

  .column.c2,
  .column.c3 {
    -ms-flex: 25%;
    /* IE10 */
    flex: 25%;
    max-width: 25%;
    padding: 0 4px;
    display: inline-block;
  }


  @media screen and (max-width:650px) {
    .column.c1 {
      -ms-flex: 100%;
      /* IE10 */
      flex: 100%;
      max-width: 100%;
      padding: 0 4px;
      display: inline-block;

    }

    .column.c2,
    .column.c3 {
      -ms-flex: 50%;
      /* IE10 */
      flex: 50%;
      max-width: 50%;
      padding: 0 4px;
      display: inline-block;
    }

  }

  .c1 img,
  .c2 img,
  .c3 img {
    margin-top: 8px;
    vertical-align: middle;
    -webkit-filter: grayscale(20%);
    filter: grayscale(20%);
    -webkit-transition: .3s ease-in-out;
    transition: .3s ease-in-out;
    cursor: pointer;
    display: inline-block;
  }

  .c1 img:hover,
  .c2 img:hover,
  .c3 img:hover {
    -webkit-filter: grayscale(80%);
    filter: grayscale(80%);
  }


  .column .caption {
    font-family: wild;
    z-index: 9999;
    font-size: 2.5em;
    display: none;
    color: #fff;
    text-shadow: 1px 1px 1px #333;
    position: absolute;
  }


  .c4 img,
  .c5 img,
  .c6 img {
    margin-top: 8px;
    vertical-align: middle;
    -webkit-filter: grayscale(80%);
    filter: grayscale(80%);
    -webkit-transition: .3s ease-in-out;
    transition: .3s ease-in-out;
    cursor: pointer;
  }

  .c4 img:hover,
  .c5 img:hover,
  .c6 img:hover {
    -webkit-filter: grayscale(0%);
    filter: grayscale(0%);
  }

  .home-banners-desktop {
    display: inline !important;
  }

  .home-banners-mobile {
    display: none !important;
  }

  .story-behind {
    max-width: 450px;
    border: 5px solid #EF7776
  }

  @media screen and (max-width:650px) {
    .home-banners-desktop {
      display: none !important;
    }

    .home-banners-mobile {
      display: inline !important;
    }

    .story-behind {
      max-width: 250px;
      margin: auto;
      margin-top: 20px;
      border: 5px solid #EF7776
    }

  }

  .mobile-header {
    padding: 0px;
    position: absolute;
    top: 0px;
    z-index: 9999;
    width: 100%;
  }

  .testimonial {
    width: 100%;

    display: flex;
    justify-content: center;
    align-items: center;

    color: #3d5a80;
  }

  .testimonial-slide {
    padding: 40px 20px;
  }


  .testimonial_box-top {
    border-radius: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    text-align: center;
    
  }

  .testimonial_box-icon {
   
  }

  .testimonial_box-icon i {
    font-size: 25px;
    color: #14213d;
  }

  .testimonial_box-text {
    padding: 20px 0;
    
  }

  .testimonial_box-text p {
    color: #293241;
    font-size: 14px;
    line-height: 20px;
    margin-bottom: 0;
  }

  .testimonial_box-img {
   
    display: flex;
    justify-content: center;
  }

  .testimonial_box-img img {
    width: 90px;
    height: 90px;
    border-radius: 50px;
    border: 2px solid #e5e5e5;
  }

  .testimonial_box-name {
    padding-top: 10px;
   
  }

  .testimonial_box-name h4 {
    font-size: 20px;
    line-height: 25px;
    color: #293241;
    margin-bottom: 0;
    text-transform: uppercase;
  }

  .testimonial_box-job p {
    color: #293241;
    font-size: 14px;
    text-transform: capitalize;
    letter-spacing: 3px;
    line-height: 20px;
    font-weight: 300;
    margin-bottom: 0;
   
  }
  .testimonial_img {
    
    margin-top: 5px;
  }
  .testimonial_img img{
    margin-left: 2px;
  }
</style>
<section class="home-banners-desktop">
  <div class="home-banner">
    <?php foreach ($banners as $banner) { ?>
    <div
      style=" height:100vh; background: linear-gradient(rgba(0,0,0,0.1),rgba(0,0,0,0.1)), url('image/<?php echo $banner['image']; ?>'); background-position:top; background-size:cover; background-repeat: no-repeat;">

    </div>
    <?php } ?>
  </div>
</section>
<section class="home-banners-mobile">
  <div class="home-banner">
    <?php foreach ($banners2 as $banner) { ?>
    <div
      style=" height:100vh; background: linear-gradient(rgba(0,0,0,0.1),rgba(0,0,0,0.1)), url('image/<?php echo $banner['image']; ?>'); background-position:bottom; background-size:cover; background-repeat: no-repeat;">

    </div>
    <?php } ?>
  </div>
</section>




<div class="section about_grid">

  <div style="text-align:center;" class="row">


    <div class="col-sm-12">
      <br /> <br />
      <h2 style="color:#EF7776;  text-transform:capitalize">Explore Our Jewellery</h2>
      <p style="font-size:18px; font-weight:200; letter-spacing:2px; font-family:Lato">Poetry in jewellery</p>
      <br /> <br />
    </div>
  </div>

  <div style="padding-bottom:80px; margin-top:60px " class="row">
    <div class="col-sm-10 offset-sm-1 text-center">

      <div style="max-width: 1000px; margin:auto" class="row-grid">
        <div class="column c1">

          <span class="img-wrapper">

            <a href="index.php?route=product/category&amp;path=73">
              <img src="image/categorybanners/4.jpg?v1.1" style="width:100%">
            </a>
          </span>

        </div>

        <div class="column c2">

          <span class="img-wrapper">
            <a href="index.php?route=product/category&amp;path=73">
              <img src="image/categorybanners/2.jpg?v1.1" style="width:100%">
            </a>
          </span>

          <span class="img-wrapper">
            <a href="index.php?route=product/category&amp;path=73">
              <img src="image/categorybanners/3.jpg?v1.1" style="width:100%">
            </a>
          </span>

        </div>

        <div class="column c3">

          <span class="img-wrapper">
            <a href="index.php?route=product/category&amp;path=73">
              <img src="image/categorybanners/1.jpg?v1.1" style="width:100%">
            </a>
          </span>

          <span class="img-wrapper">
            <a href="index.php?route=product/category&amp;path=73">
              <img src="image/categorybanners/5.jpg?v1.1" style="width:100%">

            </a>
          </span>
        </div>
      </div>
      <br />
      <a href="index.php?route=product/category&path=82">
        <button class="btn btn-primary">View All Products</button>
      </a>


    </div>

  </div>
  <br /><br /><br />
</div>


<section style="padding:40px 0; background:#D7D5C9">
  <div class="container">
    <div class="row" style="display:flex; align-items:center">
      <div class="col-sm-1"></div>
      <div class="col-sm-5">
        <h1 style="color:#178088; font-size:27px; font-family: big;">The Story Behind</h1><br>
        <p style="text-align: justify; font-size:16px; color:#000"> At Poetica, we bring the nuances of art in jewellery
          with purity and craftsmanship.
          Poetica is not just a jewellery brand, it is a form of expression for the modern women of today, from all
          walks of life.</p>
        <a href="index.php?route=common/about">
          <button class="btn btn-primary">Learn More</button>
        </a>
      </div>
      <div class="col-sm-6">
        <img src="image/abouts.jpg" class="img-fluid story-behind" />
      </div>
    </div>
  </div>
</section>

<section style="padding:40px 0;">
  <div class="container">
    <div style="text-align:center; font-family: big" class="row">


      <div class="col-sm-12">

        <h2 style="color:#EF7776; text-transform:capitalize">Most Loved Products</h2>
        <p style="font-size:18px; font-weight:200; letter-spacing:2px; font-family:Lato">Our Exclusive Picks</p>
        <br /> <br />
      </div>
    </div>
    <div class="row">
      <?php shuffle($most_loved); ?>
      <?php for ($i = 0; $i < 4; $i++) { ?>

      <div class="col-xs-12 col-sm-6 col-md-3">
        <a class="plain-link" href="<?php echo $most_loved[$i]['href']  ?>">
          <div
            style="background-image: url('image/<?php echo  $most_loved[$i]['thumb']; ?>'); padding-top:132%; position:relative; background-size:cover;">

          </div>
          <p style="font-size: 14px; color:#4e4e4e; margin:15px 0; text-align:center;">
            <?php echo $most_loved[$i]['name']; ?> <span style="font-size:12px;"> <br />
              <?php echo $most_loved[$i]['price']; ?>
            </span>
          </p>
        </a>
      </div>
      <?php } ?>
    </div>
  </div>
</section>
<section style="padding:40px 0 0 0;    background: white;">
  <div class="container">
    <div style="text-align:center; font-family: big" class="row">
      <div class="col-sm-12">
        <h2 style="color:#EF7776; text-transform:capitalize">Testimonials</h2>
        <p style="font-size:18px; font-weight:200; letter-spacing:2px; font-family:Lato;text-transform:capitalize; margin-bottom: 55px;;">What our client Says</p>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="testimonial" >
    <div class="container d-flex justify-content-center">
      <div class="testimonial__inner" style="max-width: 50%;">
        <div class="testimonial-slider">
          <div class="testimonial-slide">
            <div class="testimonial_box">
              <div class="testimonial_box-inner">
                <div class="testimonial_box-top">
                  
                 
                  <div class="testimonial_box-name">
                    <h4 >Alisha Raut</h4>
                  </div>
                  <div class="testimonial_box-job">
                    <p>Image Stylist</p>
                  </div>
                  <div class="testimonial_box-text">
                    <p> Your customer service is outstanding, your packaging is beautiful and the
                       products I have received so far are wonderful - great quality!
                    </p>
                    <br>
                    <div class="d-flex justify-content-center testimonial_img">
                      <img src="assets/img/star_solid.png" width="20"alt="">
                      <img src="assets/img/star_solid.png" width="20"alt="">
                      <img src="assets/img/star_solid.png" width="20"alt="">
                      <img src="assets/img/star_solid.png" width="20"alt="">
                      <img src="assets/img/star_solid.png" width="20"alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="testimonial-slide">
            <div class="testimonial_box">
              <div class="testimonial_box-inner">
                <div class="testimonial_box-top">

                 
                 
                  <div class="testimonial_box-name">
                    <h4>Jessica Soni </h4>
                  </div>
                  <div class="testimonial_box-job">
                    <p>Social Worker</p>
                  </div>
                  <div class="testimonial_box-text">
                    <p>Everything I have received so far has been wonderful. Kudos to the team for the great 
                      designs and hard work.
                      <br>
                      <div class="d-flex justify-content-center testimonial_img">
                        <img src="assets/img/star_solid.png" width="20"alt="">
                        <img src="assets/img/star_solid.png" width="20"alt="">
                        <img src="assets/img/star_solid.png" width="20"alt="">
                        <img src="assets/img/star_solid.png" width="20"alt="">
                        <img src="assets/img/star_solid.png" width="20"alt="">
                      </div>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="testimonial-slide">
            <div class="testimonial_box">
              <div class="testimonial_box-inner">
                <div class="testimonial_box-top">

                  
                     
                  <div class="testimonial_box-name">
                    <h4>Rahul Sharma</h4>
                  </div>
                  <div class="testimonial_box-job">
                    <p>Hotelier</p>
                  </div>
                  <div class="testimonial_box-text text-center">
                    <p>The ring I ordered lastYour customer service is outstanding,week was totally beautiful.
                       My wife absolutely loves it, and I wanted to take a moment to thank you for your help
                        in guiding me through the process and the honest information. Have a great day! </p>
                  <br>
                  <div class="d-flex justify-content-center testimonial_img">
                  <img src="assets/img/star_solid.png" width="20"alt="">
                  <img src="assets/img/star_solid.png" width="20"alt="">
                  <img src="assets/img/star_solid.png" width="20"alt="">
                  <img src="assets/img/star_solid.png" width="20"alt="">
                  <img src="assets/img/star_solid.png" width="20"alt="">
                </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
</section>
<script>
 
  $('.home-banner').slick({
    autoplay: true,
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    dots: true,
    fade: true,
    cssEase: 'linear',
    autoplaySpeed: 5000
  });
  $(document).ready(function () {
    
    $('.testimonial-slider').slick({
      autoplay: true,
      autoplaySpeed: 5000,
      speed: 600,
      draggable: true,
      infinite: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      dots: false,
      responsive: [
        {
          breakpoint: 991,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
          }
        },
        {
          breakpoint: 575,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
          }
        }
      ]
    });
  }); 
</script>
<?php echo $footer; ?>