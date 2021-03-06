<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../manage/include.jsp" %>

<html lang="en"><head>
    <title>彩顺网络科技平台</title>
</head>
<body class=" theme-blue">


    <script type="text/javascript">
        
    </script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->


  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
   
  <!--<![endif]-->

    

<div id="loading" class="loading" >Loading pages...</div>  
        <div style="width: 90%; margin: 0px auto; margin-top: 5em; float: none;">
    <div class="panel panel-default">
        <p class="panel-heading no-collapse"><font size="4">接口测试</font></p>
        <div class="panel-body ">

        <form id="loginForm" name="loginForm" class="form-horizontal" action="test/doQuickPay" method="post" >
			<div class="form-group">
				<label for="merchantId" class="col-sm-3 control-label">
					商户编号
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="merchantId"
						name="merchantId" placeholder="请输入商户号" value="yejianwen">
				</div>
			</div>
			
			<div class="form-group">
				<label for="orderAmount" class="col-sm-3 control-label">
					订单金额(分)
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="orderAmount"
						name="orderAmount" placeholder="请输入订单金额" value="1">
				</div>
			</div>
			
			<div class="form-group">
				<label for="cardNo" class="col-sm-3 control-label">
					支付卡号
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="cardNo"
						name="cardNo" placeholder="请输入支付卡号" value="">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-3" for="lunch">
					支付类型
				</label>
				<div class="col-sm-8">
						<select id="tradeSource" name="tradeSource" class="selectpicker" data-live-search="true" title="请选择渠支付类型">
							<option value='6' selected="selected">网银</option>
							<option value='7' selected="selected">快捷</option>
						</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="merchantId" class="col-sm-3 control-label">
					商品描述
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="goodsName"
						name="goodsName" placeholder="请输入商品描述" value="国银测试">
				</div>
			</div>
			
			<div class="form-group">
				<label for="merchantId" class="col-sm-3 control-label">
					异步通知地址
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="notifyUrl"
						name="notifyUrl" placeholder="请输入通知地址" value="http://112.74.25.79:9999/gyprovider/test/notify.do">
				</div>
			</div>
			
			<div class="form-group">
				<label for="callbackUrl" class="col-sm-3 control-label">
					同步跳转地址
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="callbackUrl"
						name="callbackUrl" placeholder="请输入同步跳转地址" value="https://www.baidu.com/">
				</div>
			</div>
			
			<div class="form-group">
				<label for="idcard" class="col-sm-3 control-label">
					收款人身份证
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="idcard"
						name="idcard" placeholder="请输入收款人身份证" value="">
				</div>
			</div>
			
			<div class="form-group">
				<label for="realname" class="col-sm-3 control-label">
					收款姓名
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="realname"
						name="realname" placeholder="请输入收款姓名" value="">
				</div>
			</div>
			
			<div class="form-group">
				<label for="bankname" class="col-sm-3 control-label">
					开户行名称
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="bankname"
						name="bankname" placeholder="请输入开户行名称" value="">
				</div>
			</div>
			
			<div class="form-group">
				<label for="bankcardnum" class="col-sm-3 control-label">
					T0收款卡号
				</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="bankcardnum"
						name="bankcardnum" placeholder="请输入T0收款卡号" value="">
				</div>
			</div>
                <input type="hidden" name="key" id="key" value="e07ce8af7fd34d348a97b2c7023f7c60">
                <input type="submit" value="确认支付" class="btn btn-primary pull-right" >
                <%--<label class="remember-me"><input type="checkbox"> 记住密码</label>
                --%><div class="clearfix"></div>
            </form>
        </div>
    </div>
    <%--<p class="pull-right" style=""><a href="http://www.portnine.com" target="blank" style="font-size: .75em; margin-top: .25em;">Design by Portnine</a></p>
    --%>
</div>

<script type="text/javascript">

$(function() {
	
    var match = document.cookie.match(new RegExp('color=([^;]+)'));
    if(match) var color = match[1];
    if(color) {
        $('body').removeClass(function (index, css) {
            return (css.match (/\btheme-\S+/g) || []).join(' ')
        })
        $('body').addClass('theme-' + color);
    }

//    $('[data-popover="true"]').popover({html: true});
    
    var uls = $('.sidebar-nav > ul > *').clone();
    uls.addClass('visible-xs');
    $('#main-menu').append(uls.clone());
    
    $("#loading").hide();
    
});

//$("[rel=tooltip]").tooltip();

</script>

</body></html>
