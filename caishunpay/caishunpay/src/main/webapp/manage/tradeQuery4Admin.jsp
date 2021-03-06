<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.manage.bean.PageModle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.manage.bean.OprInfo,com.trade.bean.*,com.gy.util.*"%>
<%@ include file="include.jsp" %>

<html lang="en"><head>
    <title>彩顺网络科技平台</title>
    <script type="text/javascript">
    function IFrameResize(){ 
    	//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
    	var obj = parent.document.getElementById("main_iframe"); //取得父页面IFrame对象 
    	obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 
    	} 
	
    </script>
</head>
<body  onload="IFrameResize()" class=" theme-blue" >

<div>
			<div class="header">
				<h1 class="page-title">
					扫码支付查询
				</h1>
			</div>
			
			<%--<iframe width="100%" style="border: 0" height="900px" scrolling="no" src="<%= request.getContextPath()%>/manage/tradeInfo.jsp"></iframe>
			
		--%>
		</div>
		<div class="search-well">
                <form class="form-inline" id="trade_form" name="trade_form" style="margin-top:0px;margin-left: 10px" action="manage/tradeQuery" target="_self">
                	<table >
                		<tr>
                		<td><label>交易时间：</label></td>
                			<td><input id="time_start_begin" name="time_start_begin" size="12" type="text" value="" readonly class="form_datetime">
                			- <input id="time_start_end" name="time_start_end" size="12" type="text" value="" readonly class="form_datetime">
                			</td>
                		<td><span><label class="control-label span_auto_width" for="lunch">商户号：</label></span></td><td>
					        <select id="merchantId" name="merchantId" class="selectpicker" data-live-search="true" title="全部">
						        
						     </select>
                    	</td>
                    	<td><label>订单状态：</label></td><td>
					            <select name="trade_state" id="trade_state" class="form-control">
					              <option value="">全部</option>
                                    <option value="SUCCESS" selected="selected">交易成功</option>
					              <option value="REFUND">转入退款</option>
					              <option value="NOTPAY">未支付</option>
					              <option value="CLOSED">已关闭</option>
					              <option value="PAYERROR">支付失败</option>
					            </select>
					     </td>
                    	</tr>
                		<tr>
                		<td><label>接入订单号：</label></td><td>
                    		<input name="tradeSn" id="tradeSn" class="input-xlarge form-control" placeholder="接入订单号" type="text" ></td>
                    	<td>
            				<label>平台订单号：</label></td><td>
                    		<input name="out_trade_no" id="out_trade_no" class="input-xlarge form-control" placeholder="平台订单号"  type="text">	
          				</td>
          				<td>
            				<label>上游订单号：</label></td><td>
                    		<input name="transaction_id" id="transaction_id" class="input-xlarge form-control" placeholder="平台订单号"  type="text">
          				</td>
          			</tr>
          			<tr>
          				<td>
            				<label>渠道编号：</label></td><td>
					            <select id="channel_id" name="channel_id"
										class="selectpicker" data-live-search="true" title="请选择渠道编号">

										</select>
          				</td>
          				<td>
            				<label>渠道商户号：</label></td><td>
                    		<input name="mch_id" id="mch_id" class="input-xlarge form-control" placeholder="渠道商户号"  type="text">
          				</td>
          			    <td><label>交易来源：</label></td><td>
					            <select name="trade_source" id="trade_source" class="form-control">
					              <option value="">全部</option>
					              <option value="2">微信扫码</option>
					              <option value="21">微信公众号</option>
								  <option value="22">微信H5</option>
					              <option value="1">支付宝</option>
					              <option value="3">百度支付</option>
					              <option value="4">手机QQ支付</option>
					              <option value="5">京东</option>
					            </select></td>
                		<td><input type="hidden" id="pageNum" name="pageNum" value="1"></td><td colspan="1" align="right">
                    		<button class="btn btn-default" type="button" id="trade_query_btn" name="trade_query_btn"><i class="fa fa-search"></i> 查询</button>
                    	</td>
                    	</tr>
                	</table>
                	
                </form>
            </div>
            
			<div class="main-content">
				<div class="btn-toolbar list-toolbar">
					<button class="btn btn-primary" id="exportBtn">
						<i class="fa fa-plus">交易导出</i>
					</button>
					<button class="btn btn-default">
						export
					</button>
					<div class="fa">
						&nbsp;&nbsp;&nbsp;<span id="tradeTotalNum">总笔数:0条</span>&nbsp;&nbsp;&nbsp;<span id="totalAmount">总金额:0元</span>
					</div>
				</div>
				
			</div>
				<div style="width: 99%; overflow-x: scroll;">
					<table class="table" width="1500px" height="auto">
						<thead style="height: 20px">
							<tr style="height: 20px">
								<th style="width: 100px">
									#
								</th>
								<th>
									<span style="width: 80px; display: block;">交易日期</span>
								</th>
								<th>
									<span style="width: 80px; display: block;">交易时间</span>
								</th>
								<th>
									<span style="width: 110px; display: block;">交易金额(元)</span>
								</th>
								<th>
									<span style="width: 80px; display: block;">商户编号</span>
								</th>
								<th>
									<span style="width: 80px; display: block;">商户名称</span>
								</th>
								<th>
									<span style="width: 100px; display: block;">渠道商户号</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">交易状态</span>
								</th>
								<th>
									<span style="width: 80px; display: block;">交易来源</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">接入方订单号</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">平台订单号</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">上游订单号</span>
								</th>
								<th>
									<span style="width: 110px; display: block;">费率(%)</span>
								</th>
								<th>
									<span style="width: 110px; display: block;">手续费(元)</span>
								</th>
								<th>
									<span style="width: 110px; display: block;">清算金额(元)</span>
								</th>
								<%--<th>
									<span style="width: 100px; display: block;">交易渠道</span>
								</th>
								--%><th>
									<span style="width: 90px; display: block;">接口类型</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">应答码</span>
								</th>
								<th>
									<span
										style="width: 120px; display: inline-block; overflow: hidden">应答码描述</span>
								</th>
								<th>
									<span style="width: 100px; display: block;">支付时间</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">操作</span>
								</th>
								<%--
								<th>
									<span style="width: 80px; display: block;">t0应答码</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">t0应答码描述</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">开户行名称</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">收款卡号</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">收款人姓名</span>
								</th>
								<th>
									<span style="width: 110px; display: block;">手续费(分)</span>
								</th>
							--%></tr>
						</thead>

						<tbody id="trade_tbody">
							
						</tbody>
					</table>
				</div>
				
				<ul class="pager">  
          
        <li id="totalNum">总记录条</li>  
        <li>  </li>  
            <li id="firstPage">  
                <a href="javascript:void(0);" onclick="tradeQuery('1')">首页</a>  
            </li>  
            <li >  
                <a id="prePage" href="javascript:void(0);" >上一页</a>  
            </li>  
            <li >  
                <a id="nextPage" href="javascript:void(0);" >下一页</a>  
            </li>  
            <li >  
                <a id="lastPage" href="javascript:void(0);" >尾页</a>  
            </li>  
              
            <li id="currentAndTotal">当前页/</li>  
              
            <li></li>  
            <li><select id="xzPage" name="xzPage" >  
             
            </select></li>  
              
            <li><a href="javascript:void(0);" onclick="tradeQuery(document.getElementById('xzPage').value);">go</a></li>  
        </ul>

				
				
	<script type="text/javascript">
	//交易查询
	function tradeQuery(num){
		if(num != 'undefined'){
			$("#pageNum").val(num);
		}
		$.ajax({
            cache: true,
            type: "POST",
            url:"manage/tradeQuery?r=" + new Date().getTime(),
            data:$('#trade_form').serialize(),// 你的formid
            async: false,
            error: function(request) {
				$("#loading", window.parent.document).hide();
                alert("Connection error");
            },
            success: function(data, textStatus, request) {
            	$("#loading", window.parent.document).hide();
            	var sessionstatus = request.getResponseHeader("sessionstatus"); // 通过XMLHttpRequest取得响应头，sessionstatus，  
				if (sessionstatus == "timeout") {  
                    alert("登录超时，请重新登录");  
                    var locationURL = request.getResponseHeader("locationURL"); // 通过XMLHttpRequest取得响应头，转向登陆页面locationURL，  
                     // 如果超时就处理 ，指定要跳转的页面  
                    //window.location.href = locationURL;  
                    window.open (locationURL,'_top')
                 }
                 
            	if(data==""){
                	return;
                }
            	
	            $("#totalNum").html("总记录" + data.totalNum + "条");
	            $("#tradeTotalNum").html("总笔数:" + data.totalNum + "条");
	            $("#totalAmount").html("总金额:" + data.totalAmount + "元");
	            
	            var prePage = data.currentPage <=1 ? 1: (Number(data.currentPage) -1);
	            $("#prePage").attr("onclick","tradeQuery('" + prePage +"')");
	            var next = data.currentPage >=data.totalPage ? data.currentPage: (Number(data.currentPage) + 1);
	            $("#nextPage").attr("onclick","tradeQuery('" + next + "')");
	            $("#lastPage").attr("onclick","tradeQuery('" + data.totalPage + "')");
	            $("#currentAndTotal").html(data.currentPage + "/" + data.totalPage);
	            var pageSelect;
	            for(var p = 1; p<=data.totalPage; p++){
					if(p == data.currentPage){
						pageSelect += '<option selected>' + p + '</option>';
					}else{
						pageSelect += '<option>' + p + '</option>';
					}
		        }
	            $("#xzPage").html(pageSelect);
	           
                $("#trade_tbody").html("");
                var html = "";

                for(var i=0; i<data.data.length; i++){
                	var item = data.data[i];
                	if(i%2 == 0) {
                		html += '<tr class="active">';
                	}
                	else {
                		html += '<tr>';
                	}
                	html = html +  '<td>' + (i+1+(Number(data.currentPage)-1)*10) + '</td><td>' + 
                	item.time_start.substring(0,8) + '</td><td>' +
                	item.time_start.substring(8,14) + '</td><td>' +
                	item.total_fee + '</td><td>' +
                	item.gymchtId + '</td><td>' +
                	'<span class="span_auto_width">' + item.mchtName + '</span></td><td>' +
                	item.mcht_id + '</td><td>';

                	//交易状态
                	if(item.trade_state == 'SUCCESS') {
	                	html += '<span class="text_green">' ;
	                }
                	else {
                		html += '<span class="text_red">';
	                }
	                html += tradeStateTrans(item.trade_state) + '</span></td><td>';
	                html += '<span class="span_auto_width">' + tradeResourceTrans(item.trade_source) + '</span></td><td>';
	                
	                html = html + '<span class="span_auto_width">' + item.tradeSn + '</span></td><td>' +
                	item.out_trade_no + '</td><td>' +
                	item.transaction_id + '</td><td>' +
                	item.mcht_rate + '</td><td>' +
                	item.rate_fee + '</td><td>' +
                	item.settle_fee + '</td><td>' +
                	//item.channel_id + '</td><td>' +
                	item.service + '</td><td>';

                	//应答码
                	if(item.result_code == '0' || item.result_code == '00' || item.result_code == '0000' || item.result_code == '00000' || item.result_code == '000000') {
	                	html += '<span class="text_green span_auto_width">' + item.result_code + '</span></td><td>';
	                	html += '<span class="text_green span_auto_width">' + item.message + '</span></td><td>';
	                }
                	else {
                		html += '<span class="text_red span_auto_width">' + item.result_code + '</span></td><td>';
                		html += '<span class="text_red span_auto_width">' + item.message + '</span></td><td>';
	                }

                	
                	html += '<span class="span_auto_width">' + item.time_end + '</span></td><td>';

                	if(item.trade_state == 'SUCCESS') {
                		html += '<a href="javascript:void(0);" onclick="reNotifyTrade(\'' + item.out_trade_no + '\')"><span class="text_blue span_auto_width">通知补发</span></a>&nbsp;&nbsp';
	                }
                	else {
                        html += '<a href="javascript:void(0);" onclick="reQueryTrade(\'' + item.out_trade_no + '\')"><span class="text_red span_auto_width">同步状态</span></a>&nbsp;&nbsp';
	                }
					
                	<%--if(item.t0RespCode == '00') {
	                	html += '<span class="text_green">' + item.t0RespCode + '</span></td><td>';
	                	html += '<span class="text_green">' + item.t0RespDesc + '</span></td><td>';
	                }
                	else{
                		html += '<span class="text_red span_auto_width">' + item.t0RespCode + '</span></td><td>';
                		html += '<span class="text_red span_auto_width">' + item.t0RespDesc + '</span></td><td>';
	                }
                	

                	html += '<span class="span_auto_width">' + item.bankname + '</span></td><td>' + 
                	'<span class="span_auto_width">' + item.bankcardnum + '</span></td><td>' +
                	'<span class="span_auto_width">' + item.realname + '</span></td><td>' +
                	'<span class="span_auto_width">' + item.free + '</span></td>';--%>

                	html += '</td></tr>';

                }
                $("#trade_tbody").html(html);
                
                }
				
        });
	}

	function reload(){
		
	}

	//交易导出
	function tradeExport(){

		//toastr.error("您好，暂不允许导出交易");
    	//return ;
    	
		var time_start_begin = $("#time_start_begin").val();
		var time_start_end = $("#time_start_end").val();
		//alert(time_start_end);
		if(daysBetween(dateFormat(time_start_begin), dateFormat(time_start_end)) > 10) {
			//toastr.error("交易时间范围不能大于10天");
        	//return ;
		}
		$("#loading", window.parent.document).show();
		setTimeout(function(){
			$.ajax({
	            cache: true,
	            type: "POST",
	            timeout: 10000,
	            url:"manage/tradeExport?r=" + new Date().getTime(),
	            data:$('#trade_form').serialize(),// 你的formid
	            dataType : "text",
	            async: false,
	            error: function(request) {
					$("#loading", window.parent.document).hide();
	                alert("Connection error");
	            },
	            success: function(returneddata) {
	            	$("#loading", window.parent.document).hide();
	            	var data = $.parseJSON(returneddata);
	                if('00' == data.code) {
	                	window.location.href = "<%= request.getContextPath()%>" + '/manage/ajaxDownLoad?path='+ data.data ;
	                 }
	                else {
	                	toastr.error(data.message);
	                }
	            }
	        });
		},300);
		
	}

	//同步交易状态
	function reQueryTrade(tradeSn, merchantId) {
		$("#loading", window.parent.document).show();
		setTimeout(function(){
			$.ajax({
	            cache: true,
	            type: "POST",
	            timeout: 10000,
	            url:"manage/reQueryTrade?r=" + new Date().getTime(),
	            data:{"tradeSn": tradeSn, "merchantId": merchantId},// 你的formid
	            dataType : "text",
	            async: false,
	            error: function(request) {
					$("#loading", window.parent.document).hide();
	                alert("Connection error");
	            },
	            success: function(returneddata) {
	            	$("#loading", window.parent.document).hide();
	            	var data = $.parseJSON(returneddata);
	                if('00' == data.code) {
	                	toastr.success(data.message);
	                 }
	                else {
	                	toastr.error(data.message);
	                }
	            }
	        });
		},300);
		
	}
	//通知补发
	function reNotifyTrade(outTradeNo) {
		$("#loading", window.parent.document).show();
		setTimeout(function(){
			$.ajax({
	            cache: true,
	            type: "POST",
	            timeout: 10000,
	            url:"manage/reNotifyTrade?r=" + new Date().getTime(),
	            data:{"outTradeNo": outTradeNo},// 你的formid
	            dataType : "text",
	            async: false,
	            error: function(request) {
					$("#loading", window.parent.document).hide();
	                alert("Connection error");
	            },
	            success: function(returneddata) {
	            	$("#loading", window.parent.document).hide();
	            	var data = $.parseJSON(returneddata);
	                if('00' == data.code) {
	                	toastr.success(data.message);
	                 }
	                else {
	                	toastr.error(data.message);
	                }
	            }
	        });
		},300);
	}
	
	$(function() {
		$("#loading", window.parent.document).hide();
		//控制日期或时间的显示格式
//		this.DateTimePicker1.CustomFormat = "yyyy-MM-dd HH:mm:ss";
//		//使用自定义格式
//		this.DateTimePicker1.Format = DateTimePickerFormat.Custom;
//		//时间控件的启用
//		this.DateTimePicker1.ShowUpDown = True;
		
		$("#time_start_begin").datetimepicker( {
			format : 'yyyymmddhhii',
			minView : 'hour',
			language : 'zh-CN',
			autoclose : true,
			forceParse: false,
			todayHighlight : true,
			startDate: getDateAfter(-90,'yyyy-MM-dd'),
			endDate : new Date(),
			initialDate: getDateAfter(0,'yyyy-MM-dd')
		})
		.val(getDateAfter(0,'yyyyMMdd'));
		//$('#time_start_begin').datetimepicker('update', new Date());
		 
		$("#time_start_end").datetimepicker( {
			format : 'yyyymmddhhii',
			minView : 'hour',
			language : 'zh-CN',
			autoclose : true,
			forceParse: false,
			todayHighlight : true,
			startDate: getDateAfter(-90,'yyyy-MM-dd'),
			endDate : new Date(),
			initialDate: getDateAfter(0,'yyyy-MM-dd')
		})
		.val(getDateAfter(0,'yyyyMMdd'));

		SelectOptionsDWR.getComboData('MCHT_INFO', function(ret) {

			$("#merchantId").html("");
			var mchtHtml = "<option value=''>全部</option>";
			if(ret.indexOf("没有找到可选内容") == -1) {
				var mchtInfos = jQuery.parseJSON(ret).data;
				//var mchtInfos = ret.data;
				mchtInfos.forEach(function(item,index){
					mchtHtml += "<option value='" + item.valueField + "'>" + item.displayField + "</option>"
				});
			}
			$("#merchantId").html(mchtHtml);
			$(".selectpicker").selectpicker('refresh');

		});

		SelectOptionsDWR.getComboData('CHANNEL_ID',function(ret) {
			$("#channel_id").html("");
			var mchtInfos = jQuery.parseJSON(ret).data;
			var mchtHtml = "<option value=''>全部</option>";
			mchtInfos.forEach(function(item,index){
				
				mchtHtml += "<option value='" + item.valueField + "'>" + item.displayField + "</option>"
			});
			$("#channel_id").html(mchtHtml);
			$("#channel_id").selectpicker('refresh');
		});
		
		//查询交易
		$("#trade_query_btn").click(function(){
			$("#loading", window.parent.document).show();
			setTimeout('tradeQuery()',300);
			
		});
		//交易导出
		$("#exportBtn").click(function(){
			//$("#loading", window.parent.document).show();
			//setTimeout('',300);
			tradeExport();
			
		});
		
		//tradeQuery();
		$("#trade_query_btn").click();
	});
	
	</script>

</body></html>