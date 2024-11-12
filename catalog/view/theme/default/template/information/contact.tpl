<?php echo $header; ?>
<!-- breadcrumb area start -->
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                  <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
              </ul>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- breadcrumb area end -->
<style>
  .contact-message form input,
  .contact-message form textarea {
    background-color: #F0EEE2;
  }
</style>
<div class="container">
  <!-- contact area start -->
  <div class="contact-area section-padding pt-20">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="contact-message">
            <h4 class="contact-title">Tell Us Your Requirements</h4>
            <form id="contact-form" action="" method="post" class="contact-form">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <input name="first_name" placeholder="Name *" id="name" type="text" required>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <input name="phone" placeholder="Phone *" type="text" required>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <input name="email_address" placeholder="Email *" id="email" type="email" required>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <input name="contact_subject" placeholder="Subject *" type="text">
                </div>
                <div class="col-12">
                  <div class="contact2-textarea text-center">
                    <textarea placeholder="Message *" name="message" id="message" class="form-control2" required=""></textarea>
                  </div>
                  <div class="contact-btn">
                    <button class="btn btn-hero" style="margin-top: 0px;" id="send_con" type="submit">Send Message</button>
                  </div>
                </div>
                <div class="col-12 d-flex justify-content-center">
                  <p class="form-messege"></p>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="contact-info">
            <h4 class="contact-title">Contact Us</h4>

            <ul>

              <li><i class="fa fa-envelope-o"></i> E-mail: poeticajewels@gmail.com</li>
              <li><i class="fa fa-phone"></i> +91 80030 03344</li>
              <li><i class="fa fa-whatsapp"></i> +91 964933 7733</li>
            </ul>
            <div class="working-time">
              <h6>Working Hours</h6>
              <p><span>Monday – Saturday:</span>08 AM – 08 PM</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- contact area end -->
  <br /><br />
</div>


<script>
  $(document).ready(function(e) {
    function isEmail(email) {
      var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      return regex.test(email);
    }

    $("#send_con").click(function(e) {
      e.preventDefault();
      if ($("#email").val() != "" && $("#name").val() != "" && $("#message").val() != "") {
        if (!isEmail($("#email").val())) {
          alert('Invalid Email');
          return false;
        }
        $.ajax({
          url: 'index.php?route=information/contact/send_email',
          method: 'POST',
          data: {
            "email": $("#email").val(),
            "phone": $("#phone").val(),
            "name": $("#name").val(),
            "message": $("#message").val(),
            "subject": $("#subject").val()
          },

          beforeSend: function() {
            $("#send_con").attr('disabled', true);
            $("#send_con").text('Sednig Email . .');
          },

          success: function(data) {

            alert("Thank you for your Message, we will be in touch!");
            $("#email").val("");
            $("#name").val("");
            $("#message").val("");
            $("#phone").val("");
            $("#subject").val("");

            $("#send_con").attr('disabled', false);
            $("#send_con").text('Send Email');
          }

        })
      } else {
        alert("Please fill the form completely");
      }


    })
  });
</script>

<?php echo $footer; ?>
