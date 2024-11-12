<?php if (!isset($redirect)) { ?>

  <style>
    @media screen and (max-width:650px) {

      #cssk table {
        display: inherit
      }
    }

    tr td,
    a,
    span {
      font-size: 14px;
    }
  </style>

  <div style="padding:20px 10px 20px 10px" id="cssk" class="row">
    <table class="table ">

      <tr>
        <td colspan="2"><b>Product Detail</b></td>
        <td><b>Qty</b></td>
        <td><b>Price</b></td>
        <td><b>Total</b></td>
      </tr>



      <?php foreach ($products as $product) { ?>

        <tr>
          <td width="60"> <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>

          <td>
            <a style="color:#333; " href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php foreach ($product['option'] as $option) { ?>
              <br />
              &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
              <br />
              <span class="label label-info"><?php echo $text_recurring_item; ?></span>
              <small><?php echo $product['recurring']; ?></small>
            <?php } ?>

          </td>
          <td style="">
            <br />
            <?php echo $product['quantity']; ?>
          </td>

          <td style="">
            <br />
            <?php echo $product['price']; ?>

          </td>
          <td style="">
            <br />
            <?php echo $product['total']; ?>

          </td>
        </tr>



      <?php } ?>

      <?php foreach ($totals as $total) { ?>
        <tr style="border-top:thin solid #f1f1f1">
          <td style="border:none" colspan="4" class="text-right"><strong><?php echo $total['title']; ?></strong></td>
          <td style="border:none" class="text-right"><?php echo $total['text']; ?></td>
        </tr>
      <?php } ?>
    </table>
    

    <?php echo $payment; ?>

  </div>



<?php } else { ?>
  <script type="text/javascript">
    <!--
    location = '<?php echo $redirect; ?>';
    //
    -->
  </script>
<?php } ?>