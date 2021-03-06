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
    	//alert(obj.height); //弹出父页面中IFrame中设置的高度 
    	obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 
    	} 
	
    </script>
</head>
<body  onload="IFrameResize()" class=" theme-blue" >

<div>
			<div class="header">
				<h1 class="page-title">
					通道商户查询
				</h1>
			</div>
			
			<%--<iframe width="100%" style="border: 0" height="900px" scrolling="no" src="<%= request.getContextPath()%>/manage/tradeInfo.jsp"></iframe>
			
		--%>
		</div>
		<div class="search-well">
                <form class="form-inline" id="channel_form" name="channel_form" style="margin-top:0px;margin-left: 10px" action="manage/channelQuery" target="_self">
                	<table >
                		<tr>
                		<td><span><label class="control-label span_auto_width" for="channel_mcht_no">通道编号：</label></span></td><td>
					        <select id="channel_id" name="channel_id" class="selectpicker" data-live-search="true" title="全部">
						        
						     </select>
                    	</td>
                		<td><span><label class="control-label span_auto_width" for="channel_mcht_no">通道商户号：</label></span></td><td>
					        <select id="channel_mcht_no" name="channel_mcht_no" class="selectpicker" data-live-search="true" title="全部">
						        
						     </select>
                    	</td>
                		<td><input type="hidden" id="pageNum" name="pageNum" value="1"></td><td colspan="3" align="right">
                    		<button class="btn btn-default" type="button" id="trade_query_btn" name="trade_query_btn"><i class="fa fa-search"></i> 查询</button>
                    	</td>
                    	</tr>
                	</table>
                	
                </form>
            </div>
            
			<div class="main-content">
				<div class="btn-toolbar list-toolbar">
					<button class="btn btn-primary" id="exportBtn">
						<i class="fa fa-plus"></i>导出
					</button>
					<button class="btn btn-default">
						export
					</button>
					<div class="btn-group">
					</div>
				</div>
				
			</div>
				<div style="width: 99%; overflow-x: scroll;">
					<table class="table" width="1500px" height="auto">
						<thead style="height: 20px">
							<tr style="height: 20px">
								<th style="width: 40px">
									#
								</th>
								<th>
									<span style="width: 120px; display: block;">通道商户编号</span>
								</th>
								<th>
									<span style="width: 160px; display: inline-block; overflow: hidden">通道商户名称</span>
								</th>
								<th>
									<span style="width: 100px; display: block;">通道编号</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">通道机构号</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">状态</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">注册时间</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">审核内容</span>
								</th>
								<th>
									<span style="width: 90px; display: block;">审核时间</span>
								</th>
								<th>
									<span style="width: 120px; display: block;">操作</span>
								</th>
								</tr>
						</thead>

						<tbody id="mcht_tbody">
							
						</tbody>
					</table>
				</div>
				
				<ul class="pager">  
          
        <li id="totalNum">总记录条</li>  
        <li>  </li>  
            <li id="firstPage">  
                <a href="javascript:void(0);" onclick="channelQuery('1')">首页</a>  
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
              
            <li><a href="javascript:void(0);" onclick="channelQuery(document.getElementById('xzPage').value);">go</a></li>  
        </ul>

				
				
	<script type="text/javascript">
	//交易查询
	function channelQuery(num){
		if(num != 'undefined'){
			$("#pageNum").val(num);
		}
		$.ajax({
            cache: true,
            type: "POST",
            url:"manage/channelQuery?r=" + new Date().getTime(),
            data:$('#channel_form').serialize(),// 你的formid
            async: false,
            error: function(request) {
				$("#loading", window.parent.document).hide();
                alert("Connection error");
            },
            success: function(data) {
            	$("#loading", window.parent.document).hide();
            	if(data==""){
                	return;
                }
	            $("#totalNum").html("总记录" + data.totalNum + "条");
	            var prePage = data.currentPage <=1 ? 1: (Number(data.currentPage) -1);
	            $("#prePage").attr("onclick","channelQuery('" + prePage +"')");
	            var next = data.currentPage >=data.totalPage ? data.currentPage: (Number(data.currentPage) + 1);
	            $("#nextPage").attr("onclick","channelQuery('" + next + "')");
	            $("#lastPage").attr("onclick","channelQuery('" + data.totalPage + "')");
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
	           
                $("#mcht_tbody").html("");
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
                	item.channel_mcht_no + '</td><td>' +
                	'<span style="display: inline-block; overflow: hidden;white-space:nowrap;" >' + item.channel_name + '</span></td><td>' +
                	item.channel_id + '</td><td>' +
                	'<span class="span_auto_width">' + item.agtId + '</span></td><td>' +
                	channelStatusTrans(item.status) + '</td><td>' +
                	'<span class="span_auto_width">' + timeFormatStandard(item.crt_time) + '</span></td><td>' + 
                	'<span class="span_auto_width">' + item.check_message + '</span></td><td>' + 
                	'<span class="span_auto_width">' + timeFormatStandard(item.check_time) + '</span></td><td>';
                	if("00"==item.status) {
                		html = html + '<a href="javascript:void(0)" onclick="channelMchtFreeze(\'' + item.channel_mcht_no + '\',\'' + item.channel_id + '\')"><span class="text_red span_auto_width">冻结</span></a>';
                    }
                	else if("02"==item.status){
                		html = html + '<a href="javascript:void(0)" onclick="channelMchtRecover(\'' + item.channel_mcht_no + '\',\'' + item.channel_id + '\')"><span class="text_green span_auto_width">恢复</span></a>'
                    }
                	html += '</td></tr>';

                }
                $("#mcht_tbody").html(html);
                
                }
				
        });
	}

	//商户导出
	function tradeExport(){

		toastr.error("亲，暂不支持导出");
	}

	switchChannelMcht();

	function switchChannelMcht() {
		SelectOptionsDWR.getComboDataWithParameter('CHANNEL_MCHT_NO',$("#channel_id").val(), function(ret) {

			$("#channel_mcht_no").html("");
			var mchtInfos = jQuery.parseJSON(ret).data;
			var mchtHtml = "<option value=''>全部</option>";
			mchtInfos.forEach(function(item,index){
				mchtHtml += "<option value='" + item.valueField + "'>" + item.displayField + "</option>"
			});
			$("#channel_mcht_no").html(mchtHtml);
			$("#channel_mcht_no").selectpicker('refresh');
      		
		});
	}

	$("#channel_id").change(function(){
		switchChannelMcht();
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
	
	function channelMchtFreeze(channel_mcht_no, channel_id){

		window.parent.wxc.xcConfirm("确认冻结通道商户?", window.parent.wxc.xcConfirm.typeEnum.confirm, {
			onOk:function(v){
			$.ajax({
	            cache: true,
	            type: "POST",
	            timeout: 10000,
	            url:"manage/channelMchtFreeze?r=" + new Date().getTime(),
	            data:{"channel_mcht_no": channel_mcht_no, "channel_id": channel_id},
	            async: true,
	            error: function(request) {
					//$("#loading", window.parent.document).hide();
	                alert("Connection error");
	            },
	            success: function(data) {
	            	if(data=="00000") {
	            		toastr.success("通道商户冻结成功!");
	            		channelQuery();
			        }
		            else {
		            	toastr.error(data);
			        }
	            }
	        });
			}
		});
	}

	function channelMchtRecover(channel_mcht_no, channel_id){

		window.parent.wxc.xcConfirm("确认恢复通道商户?", window.parent.wxc.xcConfirm.typeEnum.confirm, {
			onOk:function(v){
			$.ajax({
	            cache: true,
	            type: "POST",
	            timeout: 10000,
	            url:"manage/channelMchtRecover?r=" + new Date().getTime(),
	            data:{"channel_mcht_no": channel_mcht_no, "channel_id": channel_id},
	            async: true,
	            error: function(request) {
					//$("#loading", window.parent.document).hide();
	                alert("Connection error");
	            },
	            success: function(data) {
	            	if(data=="00000") {
	            		toastr.success("通道商户恢复成功!");
	            		channelQuery();
			        }
		            else {
		            	toastr.error(data);
			        }
	            	
	            }
	        });
			}
		});
	}

	
	$(function() {
		$("#loading", window.parent.document).hide();

		
		//商户导出
		$("#exportBtn").click(function(){
			//$("#loading", window.parent.document).show();
			//setTimeout('',300);
			tradeExport();
			
		});

		//查询交易
		$("#trade_query_btn").click(function(){
			$("#loading", window.parent.document).show();
			setTimeout('channelQuery()',300);
			
		});
		
		//channelQuery();
		$("#trade_query_btn").click();
	});
	
	</script>

</body></html>