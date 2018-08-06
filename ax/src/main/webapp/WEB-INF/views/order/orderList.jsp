<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/arongi/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/arongi/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/bulldog/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/cocker/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/flybasket/AXJ.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/axisj/axisj/master/ui/kakao/AXJ.min.css">
<script type="text/javascript" src="/ax/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXJ.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXSelect.js"></script>
<script type="text/javascript" src="/ax/resources/js/ax/AXGrid.js"></script>
<script type="text/javascript">
var myGrid = new AXGrid();
var alignStr = "center";
var widthStr = "100";
var fnObj = {
		pageStart: function() {
			myGrid.setConfig({
				targetID: "AXGridTarget",
				colGroup: [					
					{key:"p_baseprice", label:"원가", width: widthStr, align: alignStr },
					{key:"p_entrynumber", label:"주문번호", width: widthStr, align: alignStr },
					{key:"p_info", label:"기타", width: widthStr, align: alignStr },
					{key:"createdTS", label:"주문일", width: widthStr, align: alignStr },
					{key:"modifiedTS", label:"수정일", width: widthStr, align: alignStr },
					{key:"p_product", label:"주문상품정보", width: widthStr, align: alignStr },
					{key:"p_quantity", label:"수량", width: widthStr, align: alignStr },
					{key:"p_totalprice", label:"총판매금액", width: widthStr, align: alignStr },
					{key:"p_unit", label:"단위", width: widthStr, align: alignStr },
					{key:"accumulationpoint", label:"포인트", width: widthStr, align: alignStr },
					{key:"usepoint", label:"사용포인트", width: widthStr, align: alignStr },
					{key:"usegiftamount", label:"기프트카드", width: widthStr, align: alignStr },
					{key:"coupondiscountamount", label:"쿠폰하린", width: widthStr, align: alignStr },
					{key:"accumulationrate", label:"비율", width: widthStr, align: alignStr },
					{key:"warehousestockquantity", label:"창고재고수량", width: widthStr, align: alignStr },
					{key:"lgdamount", label:"데이콘수량", width: widthStr, align: alignStr },
					{key:"originalquantity", label:"원부누수량", width: widthStr, align: alignStr },
					{key:"saleyn", label:"할인", width: widthStr, align: alignStr }
				],				
				body: {
					onclick: function(){
						toast.push(Object.toJSON(this.item));
					}
				}
			});
			//
			// DATA SET
			var list = [			
				<c:forEach items="${orderList}" var="item" varStatus="idx">				
				{p_baseprice:'${item.p_baseprice}', p_entrynumber:'${item.p_entrynumber}',p_info:'${item.p_info}', createdTS: '${item.createdTS}', modifiedTS:'${item.modifiedTS}', p_product:'${item.p_product}', p_quantity:'${item.p_quantity}', p_totalprice:'${item.p_totalprice}', p_unit:'${item.p_unit}', accumulationpoint:'${item.accumulationpoint}',usepoint:'${item.usepoint}', usegiftamount:'${item.usegiftamount}', coupondiscountamount: '${item.coupondiscountamount}', accumulationrate: '${item.accumulationrate}',warehousestockquantity:'${item.warehousestockquantity}', lgdamount:'${item.lgdamount}', originalquantity: '${item.originalquantity}',saleyn: '${item.saleyn}'},				
				</c:forEach>
			];
			
			myGrid.setList(list);
		}
	}
$(document).ready(fnObj.pageStart);
</script>
</head>
<div id="AXGridTarget" style="width:100%;height:500px;"></div>
</body>
</html>