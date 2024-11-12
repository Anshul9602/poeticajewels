<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-shoppingfeeder" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shoppingfeeder" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-3 control-label" for="input-code"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_apikey); ?>"><?php echo $apikey; ?></span></label>
                        <div class="col-sm-3">
                            <input type="text" name="shoppingfeeder_apikey" rows="5" id="input-apikey" class="form-control" value="<?php echo $shoppingfeeder_apikey; ?>">
                            <?php if ($error_apikey) { ?>
                            <div class="text-danger"><?php echo $error_apikey; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-3 control-label" for="input-code"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_apisecret); ?>"><?php echo $apisecret; ?></span></label>
                        <div class="col-sm-3">
                            <input type="text" name="shoppingfeeder_apisecret" rows="5" id="input-apikey" class="form-control" value="<?php echo $shoppingfeeder_apisecret; ?>">
                            <?php if ($error_apisecret) { ?>
                            <div class="text-danger"><?php echo $error_apisecret; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>