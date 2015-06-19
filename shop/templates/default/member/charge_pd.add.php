<?php defined('InShopNC') or exit('Access Invalid!');?>
<div class="wrap">
  <div class="tabmenu">
    <?php include template('layout/submenu');?>
  </div>
  <div class="ncu-form-style">
    <form method="post" id="recharge_form" action="index.php">
      <input type="hidden" name="form_submit" value="ok" />
      <input type="hidden" name="act" value="charge" />
      <input type="hidden" name="op" value="add" />
      <dl>
        <dt class="required"><em class="pngFix"></em><?php echo $lang['predeposit_recharge_price'].$lang['nc_colon']; ?></dt>
        <dd>
          <select name="pdr_amount">
            <option value="100.00">100.00</option>
            <option value="200.00">200.00</option>
            <option value="300.00">300.00</option>
          </select>
          <?php echo $lang['currency_zh'];?> 注:充值成功后成为正式会员</dd>
      </dl>
      <dl class="bottom">
        <dt>&nbsp; </dt>
        <dd>
          <input type="submit" class="submit" value="<?php echo $lang['nc_submit']; ?>" />
        </dd>
      </dl>
    </form>
  </div>
</div>
<script type="text/javascript">
$(function(){
	$('#recharge_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        rules : {
        	pdr_amount      : {
	        	required  : true,
	            number    : true,
	            min       : 0.01
            }
        },
        messages : {
        	pdr_amount		: {
            	required  :'<?php echo $lang['predeposit_recharge_add_pricenull_error']; ?>',
            	number    :'<?php echo $lang['predeposit_recharge_add_pricemin_error']; ?>',
                min    	  :'<?php echo $lang['predeposit_recharge_add_pricemin_error']; ?>'
            }
        }
    });
});
</script>