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
					{key:"p_baseprice_sel", label:"지역", width: widthStr, align: alignStr, formatter:function() {
						var str =  "<select id=\"area\" name=\"area\">";
						    str += "  <option value=\"\">선택</option>";
						    str += "  <option value=\"1\">서울</option>";
						    str += "  <option value=\"2\">경기도</option>";
						    str += "</select>";
						return str;
					}},
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
				],
				body: {
					onclick: function(){
						
						var axModal = new AXModal();
						axModal.setConfig({
							windowID: "myModal",
							width: 740,
							mediaQuery: {
								mx: {min: 0, max: 767}, dx: {min: 767}
							},
							displayLoading: true,
							scrollLock: true,							
							onclose: function(){
								trace("close bind");
							}						
						});
						
						axModal.open({
							url: "/ax/order/orderDetail",
							method: "GET",
							pars:"pk="+ this.item.pk,
							name:"myModal",
							options:"width=600,height=400,resizable=yes"
						});
						//toast.push({type:"Warning", body: Object.toJSON(this.item)});
						//toast.push({type:"Caution", body: Object.toJSON(this.item)});
					}
				},
				onchangeScroll: function() {
					console.log("1");
					for(var i = this.startIndex; i < this.endIndex+1; i++){
						$("#AXdate_"+i).bindDate({align:"right", valign:"top", 
							onchange:function(){
								trace(this.objID);
								var myi = this.objID.substr(this.objID.lastIndexOf("_").number()+1);
								myGrid.list[myi].createdTS = this.value;
							}
						});
					}
				}
			});
			
			
			


			// DATA SET
			var list = [			
				<c:forEach items="${orderList}" var="item" varStatus="idx">				
				{p_baseprice:'${item.p_baseprice}', p_entrynumber:'${item.p_entrynumber}',p_info:'${item.p_info}', createdTS: '${item.createdTS}', modifiedTS:'${item.modifiedTS}', p_product:'${item.p_product}', p_quantity:'${item.p_quantity}', p_totalprice:'${item.p_totalprice}', p_unit:'${item.p_unit}', accumulationpoint:'${item.accumulationpoint}',usepoint:'${item.usepoint}', usegiftamount:'${item.usegiftamount}', coupondiscountamount: '${item.coupondiscountamount}', accumulationrate: '${item.accumulationrate}',warehousestockquantity:'${item.warehousestockquantity}', lgdamount:'${item.lgdamount}', originalquantity: '${item.originalquantity}',saleyn: '${item.saleyn}'},				
				</c:forEach>
			];
			
			myGrid.setList(list);
		}
	}
	
$(document).ready(function() {
	
	fnObj.pageStart.delay(0,5);
	// Calendar 셋
	var config = {
	    align            :"right", // {String} ("left"|"center"|"right") 달력에서 input text 의 위치
	    valign           :"top",   // {String} ("top"|"middle"|"bottom") 달력에서 input text 의 위치
	    separator        : "yyyy-MM-dd",    // {String} 날짜형식 표시 구분 문자열
	    selectType       : "d",    // {String} ("y"|"m"|"d") 날짜선택범위 y 를 지정하면 년도만 선택됩니다.
	    defaultSelectType: "d",    // {String} ("y"|"m"|"d") 달력컨트롤의 년월일 선택도구 중에 먼저 보이는 도구타입
	    defaultDate      : "",     // {String} ("yyyy[separator]mm[separator]dd") 날짜 형식의 문자열로 빈값의 달력 기준일을 설정합니다. 지정하지 않으면 시스템달력의 오늘을 기준으로 합니다.
	    minDate          : "",     // {String} ("yyyy[separator]mm[separator]dd") 날짜 형식의 문자열로 선택할 수 있는 최소일을 설정합니다.
	    maxDate          : "",     // {String} ("yyyy[separator]mm[separator]dd") 날짜 형식의 문자열로 선택할 수 있는 최대일을 설정합니다.
	    onBeforeShowDay  : {
	    	isEnable: true			    	
	    },      // {Function} 날짜를 보여주기 전에 호출하는 함수. date를 파라미터로 받으며 다음과 같은 형식의 Object를 반환해야 한다. { isEnable: true|false, title:'성탄절', className: 'holyday', style: 'color:red' }
	    onchange: function(){      // {Function} 값이 변경되었을 때 발생하는 이벤트 콜백함수
	        trace(this);
	    }
	};

	$("#AXJ_dateAddS").bindDate(config);
	$("#AXJ_dateAddE").bindDate(config);
});

// Grid 인덱스를 매개 변수로 데이터 조회하기 
function fnDetail(index){
	toast.push({type:"Warning", body: Object.toJSON(myGrid.list[index])});
	console.log('fnDetail', myGrid.list[index]);
}
</script>
</head>
<div id="pageTitle"><h1>주문 목록</h1></div>
<div>
	날짜 검색: 
	<input type="text" name="sDate" id="AXJ_dateAddS" value="" class="AXInput W100" />
	~
	<input type="text" name="eDate" id="AXJ_dateAddE" value="" class="AXInput W100" />
</div>	
<br/>
<div id="AXGridTarget" style="width:100%;height:500px;"></div>
</body>
</html>