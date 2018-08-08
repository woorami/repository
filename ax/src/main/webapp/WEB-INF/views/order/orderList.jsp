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
var widthStr = "150";
var fnObj = {
		pageStart: function() {
			myGrid.setConfig({
				targetID: "AXGridTarget",
				colGroup: [
					{key:"p_baseprice_sel", label:"����", width: widthStr, align: alignStr, formatter:function() {
						var str =  "<select id=\"area\" name=\"area\">";
						    str += "  <option value=\"\">����</option>";
						    str += "  <option value=\"1\">����</option>";
						    str += "  <option value=\"2\">��⵵</option>";
						    str += "</select>";
						return str;						
					}},
					{key:"p_baseprice", label:"����", width: widthStr, align: alignStr, formatter:function() {
						return "<input type=\"text\" id=\"baseprice\" name=\"baseprice\" value=\""+ this.item.p_baseprice.money() +"\" style=\"width:100px;\"/>";
					}},
					{key:"p_entrynumber", label:"�ֹ���ȣ", width: widthStr, align: alignStr, formatter:"number" },
					{key:"p_info", label:"��Ÿ", width: widthStr, align: alignStr },
					{key:"createdTS", label:"�ֹ���", width: widthStr, align: alignStr, formatter:function() {
						return this.item.createdTS.substr(0,4) +"-"+ this.item.createdTS.substr(5,2) +"-"+ this.item.createdTS.substr(8,2);
					}},
					{key:"modifiedTS", label:"������", width: widthStr, align: alignStr },
					{key:"p_product", label:"�ֹ���ǰ����", width: widthStr, align: alignStr },
					{key:"p_quantity", label:"����", width: widthStr, align: alignStr, formatter:function(){
						return this.item.p_quantity.number();	
					}},
					{key:"p_totalprice", label:"���Ǹűݾ�", width: widthStr, align: alignStr, formatter:function(){
						return this.item.p_totalprice.money() +" ��";	
					}},
					{key:"p_unit", label:"����", width: widthStr, align: alignStr },
					{key:"accumulationpoint", label:"����Ʈ", width: widthStr, align: alignStr },
					{key:"usepoint", label:"�������Ʈ", width: widthStr, align: alignStr },
					{key:"usegiftamount", label:"����Ʈī��", width: widthStr, align: alignStr, formatter:function(){
						return "<input type=\"text\" id=\"usegiftamount\" name=\"usegiftamount\" value=\""+ (this.item.usegiftamount).number() +"\" style=\"width:100px;\"/>";
					}},
					{key:"coupondiscountamount", label:"�����ϸ�", width: widthStr, align: alignStr },
					{key:"accumulationrate", label:"����", width: widthStr, align: alignStr },
					{key:"warehousestockquantity", label:"â��������", width: widthStr, align: alignStr },
					{key:"lgdamount", label:"�����ܼ���", width: widthStr, align: alignStr },
					{key:"originalquantity", label:"���δ�����", width: widthStr, align: alignStr },
					{key:"saleyn", label:"����", width: widthStr, align: alignStr }
				],
				body: {
					onclick: function(){
						//toast.push({type:"Warning", body: Object.toJSON(this.item)});
						toast.push({type:"Caution", body: Object.toJSON(this.item)});
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