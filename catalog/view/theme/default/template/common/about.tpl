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
                <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>">
                    <?php echo $breadcrumb['text']; ?></a></li>

              <?php } ?>
            </ul>

          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<style>
  p {
    text-align: justify;
  }
</style>
<div class="banner">
  <img src="banner.jpg" alt="" class="img-responsive">
</div>

<br /><br />
<div style=" width:100%; min-height: 600px;" class="container">

  <div class="row" style="display:flex; align-items:center;">
    <div class="col-xs-12 col-sm-5">
      <img src="image/story.jpg" alt="" class="img-responsive">
    </div>
    <div class="col-xs-12 col-sm-7">

      <p style="font-size:14px; font-weight: 400; color:#4e4e4e;">At Poetica, we bring the nuances of art in jewellery with
        purity and craftsmanship.<br />
        Poetica is not just a jewellery brand, it is a form of expression
        for the modern women of today, from all walks of life.<br /><br />
        We do not limit ourselves to societal norms and with our
        radiant presence we can light up a dark room. This is our
        journey for all things jewellery and we are here to share the
        joy of affordable luxury.<br /><br />
        Poetica Jewellery is the truest expression of yourself,
        reflecting your personality when you carry it making a
        powerful style statement.</p>

    </div>
  </div><br /><br />
  <div class="row" style="display:flex; align-items:center; margin-top:50px;">

    <div class="col-xs-12 col-sm-6">
      <h4 style="font-weight: 400;">About Poetica</h4><br />
      <p style="font-size:14px; font-weight: 400; color:#4e4e4e;">Sharing the joy of wearing beautiful jewellery, Poetica
        works to create exquisite statement pieces.
        We create jewellery in 92.5 <span style="color:#EF7776 ;"><b>Sterling Silver</b></span> and a variety
        of the best quality semi-precious stones for pieces that
        make you shine and stand out.
        <br /><br />
        Our rich heritage in jewellery making encourages us to
        carry on the legacy of this fine craft with skilled
        artisans working with us with their expertise.
        Expressing yourself with jewellery need not be an
        expensive affair. Poetica pieces are priced to bring you
        joy and to make luxurious jewellery available to the
        modern women of today.</p>

    </div>
    <div class="col-xs-12 col-sm-6">
      <img src="image/abou.jpg?v1.1" alt="" class="img-responsive">
    </div>
  </div>

</div>
<br /><br />
<div style="background: url('image/aboutbg.jpg') center no-repeat; display:flex; align-items:center; background-size:cover; min-height:60vh; padding:50px 0px" class="section">
  <div class="row">
    <div class="col-sm-8 offset-sm-2 text-center">
      <h2 style="color: #fff;">Daffodil Flower
      </h2>
      <br />
      <P style="text-align: justify; font-size:16px; color: #fff;">

      After long cold waters Daffodils are first to bloom announcing the onset of
      spring and the arrival of sunny days. These flowers are sweet reminders that
      no tough times last forever. Embark upon your journey when you are ready for
      it because the best time to start anything is when you are ready to take that first step.
      Rebirth, renewal, good luck, happiness, austerity, purity, creativity, joy, cheerfulness, happiness, inner reflection,
      and inspiration are all symbolic of the ideology that drives us at Poetica Jewels.
      </P>
    </div>
  </div>
</div>

<?php echo $footer; ?>
