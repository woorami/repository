<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/arongi/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/bulldog/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/cocker/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/flybasket/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/kakao/AXJ.min.css">

<script type="text/javascript" src="/ax/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXJ.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXSelect.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXInput.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXGrid.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXModal.js"></script>

<script type="text/javascript">
var myGrid = new AXGrid();

var alignStr = "center";
var widthStr = "150";
var fnObj = {
		pageStart: function() {			
			myGrid.setConfig({
				targetID: "AXGridTarget",
				colGroup: [
					{key:"p_baseprice", label:"원가", width: widthStr, align: alignStr, formatter:function() {
						return "<input type=\"text\" id=\"baseprice\" name=\"baseprice\" value=\""+ this.item.p_baseprice.money() +"\" style=\"width:100px;\"/>";
					}},
					{key:"createdTS", label:"주문일", width: widthStr, align: alignStr, formatter:function() {
						return "<input type=\"text\" name=\"\" id=\"AXdate_"+ this.index +"\" class=\"AXInput W100 AXdate\" value=\""+ this.value +"\"/>";
						
						//return this.item.createdTS.substr(0,4) +"-"+ this.item.createdTS.substr(5,2) +"-"+ this.item.createdTS.substr(8,2);
					}},
					{key:"modifiedTS", label:"수정일", width: widthStr, align: alignStr },
					{key:"p_product", label:"주문상품정보", width: widthStr, align: alignStr, formatter:function() {
						return "<a href=\"javascript:fnDetail('"+ this.index +"');\">"+ this.item.p_product +"</a>";
					}},
					{key:"p_quantity", label:"수량", width: widthStr, align: alignStr, formatter:function(){
						return this.item.p_quantity.number();	
					}},
					{key:"p_totalprice", label:"총판매금액", width: widthStr, align: "right", formatter:function(){
						return this.item.p_totalprice.money() +" 원";	
					}},
					{key:"p_unit", label:"단위", width: widthStr, align: alignStr },
					{key:"accumulationpoint", label:"포인트", width: widthStr, align: "right", formatter:"money" },
					{key:"usepoint", label:"사용포인트", width: widthStr, align: "right", formatter:"money" },
					{key:"usegiftamount", label:"기프트카드", width: widthStr, align: alignStr, formatter:function(){
						return "<input type=\"text\" id=\"usegiftamount\" name=\"usegiftamount\" value=\""+ (this.item.usegiftamount).number() +"\" style=\"width:100px;\"/>";
					}},
					{key:"coupondiscountamount", label:"쿠폰할인", width: widthStr, align: alignStr },
					{key:"accumulationrate", label:"비율", width: widthStr, align: alignStr },
					{key:"warehousestockquantity", label:"창고재고수량", width: widthStr, align: alignStr },
					{key:"lgdamount", label:"데이콤수량", width: widthStr, align: alignStr },
					{key:"originalquantity", label:"원주문수량", width: widthStr, align: alignStr },
					{key:"saleyn", label:"할인", width: widthStr, align: alignStr },
					{key:"p_info", label:"기타", width: widthStr, align: alignStr, onclick:function() {
						//return toast.push({type:"Info", body: Object.toJSON(this.item.value)});
					}}
				]				
			});
			// DATA SET
			var list = [		
				{	p_baseprice:'${detail.p_baseprice}', 
					p_entrynumber:'${detail.p_entrynumber}',
					p_info:'${detail.p_info}', 
					createdTS: '${detail.createdTS}',
					modifiedTS:'${detail.modifiedTS}', 
					p_product:'${detail.p_product}', 
					p_quantity:'${detail.p_quantity}', 
					p_totalprice:'${detail.p_totalprice}', 
					p_unit:'${detail.p_unit}', 
					accumulationpoint:'${detail.accumulationpoint}',
					usepoint:'${detail.usepoint}', 
					usegiftamount:'${detail.usegiftamount}', 
					coupondiscountamount: '${detail.coupondiscountamount}', 
					accumulationrate: '${detail.accumulationrate}',
					warehousestockquantity:'${detail.warehousestockquantity}', 
					lgdamount:'${detail.lgdamount}',
					originalquantity: '${detail.originalquantity}',
					saleyn: '${detail.saleyn}'}
			];
			
			myGrid.setList(list);
		}
	}
	
$(document).ready(function() {	
	fnObj.pageStart.delay(0,5);	
});
</script>
</head>
<div id="pageTitle"><h1>주문 상세</h1></div>
<br/>
<div id="AXGridTarget" style="width:100%;height:500px;"></div>
</body>
</html>