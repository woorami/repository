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
				passiveMode: true,
				colGroup: [
					{key:"seq", label:"CHECK", width: widthStr, align: alignStr, formatter:"checkbox", displayLabel:true, checked:function() { // displayLabel:true => 헤드란에 체크박스를 표시할지 여부
						//return this.index, this.item, this.list, (this.index %2 == 0);
						return false;
					}},
					{key:"status", label:"상태", width: widthStr, align: alignStr, formatter:function(){
						if( this.item._CUD == "C" ){
							return "신규";
						} else if( this.item._CUD == "U" ){
							return "수정";
						} else if( this.item._CUD == "D" ){
							return "삭제";
						}
					}},
					{key:"seq", label:"고유번호", width: widthStr, align: alignStr},
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
					addClass: function() {
						if( this.item._CUD == "C" ){
							return "blue";
						} else if( this.item._CUD == "D" ){
							return "red";
						} else if( this.item._CUD == "U" ){
							return "green";
						} else {
							return "";
						}							
					},
					onclick: function() {
						// 그리드 추가/삭제
						myGrid.setEditor(this.item, this.index);
					},
					ondblclick: function() {
						//http://jdoc.axisj.com/document/AXModal.html
						var axModal = new AXModal();
						axModal.setConfig({
							windowID: "myModal",
							width: 740,
							mediaQuery: {
								mx: {min: 0, max: 767}, dx: {min: 767}
							},
							displayLoading: true,
							scrollLock: true,
							closeButton: true, // 모달창 닫기버튼 노출 여부
							onclose: function(){
								alert("good bye!!");
							}						
						});						
						console.log(this.item);
						axModal.open({
							url: "/ax/order/orderDetail",
							pars: ("seq="+ this.item.seq).queryToObject(),
							method: "get",
							name:"myModal",
							options:"width=600,height=400,resizable=yes"
						}); 	
					},
					oncheck: function() {
						// 사용 가능한 변수
						//this.itemIndex;
						//this.target;
						//this.checked;
						//this.r;
						//this.c;
						//this.list;
						//this.item;
						trace(this.checked);
					}
						//toast.push({type:"Warning", body: Object.toJSON(this.item)});
						//toast.push({type:"Caution", body: Object.toJSON(this.item)});				
				},
				page:{
					paging: true
				},
				editor:{
					rows: [
						[
							{colSeq:0, align:"center", valign:"middle", formatter: function() {
								return "";
								}
							},
							{key: "status", align:"center", valign:"middle", form:{
								type:"hidden", value:"itemValue"}
							},
							{colSeq:2, align:"center", valign:"middle", form:{
								type:"hidden", value:"itemValue"}
							},
							{colseq:3, align:"center", valign:"top", form:{
								type:"text", value:function() {
									console.log("this.value::"+ this.value);
									//return this.value.dec();
									return this.value;
								},
								validate:function() {
									if( this.value == ""){
										alert("필수 입력값 입니다");
										return false;
									}
								}
							},
							AXBind:{type:"selector", config:{
								apendable: true,
								ajaxUrl:"selectorData.txt",
								ajaxPars:"",
								onChange: function() {
									if( this.selectedOption){
										myGrid.setEditorForm({
											key:"Writer",
											position:[0,4], // editor rows 적용할 대상의 배열 포지션(다르면 적용되지 않음)
											value: this.selectedOption.optionText
										});
									}
								}								
							}
							}								
							},
							{colSeq:4, align:"left", valign:"top", form:{
								type:"text",
								value:"itemValue"}
							},
							{colSeq:5, align:"left", valign:"top", form:{
								type:"text",
								value:"itemValue"},
								AXBind:{type:"date"}
							},
							{colSeq:6, align:"left", valign:"top", form:{
								type:"text",
								value:"itemValue"} ,
								AXBind:{type:"money"}
							},
							{colSeq:7, align:"left", valign:"top", form:{
								type:"text",
								value:"itemValue"},
								AXBind:{type:"number", config:{min:1, max:100}}
							},
							{colSeq:8, align:"right", valign:"top"},			
							{colSeq:9, align:"left", valign:"top", form:{
								type:"select", value:"itemText",
								isspace:true, isspaceTitle:"ABCD",
								options:[
									{value:1, optionText:"TEST"},
									{value:2, text:"text"}
							],
							onChange: function(){
								AXUtil.alert(this);
							}
						}
					}
					]
				],
				//request:{ajaxUrl:"saveGrid.asp", ajaxPars:"param1=1&param2=2"},
				response: function() { // ajax 응답에 대해 예외 처리 필요시 response 구현
				
				}
				},
				contextMenu: {
					theme:"AXContextMenu",// 선택항목
					width:"150", // 선택항목
					menu:[
						{
						userType:1, label:"추가하기", className:"plus", onclick:function() {
							myGrid.appendList(item);
							// myGrid.appendList(item, index);
							/*
								var removeList = [];
							removeList.push({no: this.seneObj.item.no});
							myGrid.removeList(removeList); // 전달한 개체와 비교하여 일치하는 대사을 제거합니다. 이때 고유한 값이 아닌 항목을 전달 할 때에는 에러가 발생할 수 있습니다.
							
							*/
							}
						},
						{ 
							userType:1, label:"삭제하기", className:"minus", onclick:function() {
								if(this.sendObj) {
									if(!confirm("정말 삭제하시겠습니까?")) return;
									var removeList = [];
									removeList.push({ index:this.sendObj.index});
									myGrid.removeListIndex(removeList); // 전달한 객체와 비교하여 일치하는 대상을 제거. 이때 고유한 값이 아닌 항목을 전달할 경우 에러 발생
								}
							}
						},
						{
							userType:1, label:"수정하기", className:"edit", onclick:function() {
								if(this.sendObj) {
									myGrid.setEditor(this.sendObj.item, this.sendObj.index);
								}
							}
						}
					],
					filter:function(id) {
						return true;
					}
				}
			});
			// DATA SET
			var list = [			
				<c:forEach items="${orderList}" var="item" varStatus="idx">				
				{seq: '${item.seq}',p_baseprice:'${item.p_baseprice}', p_entrynumber:'${item.p_entrynumber}',p_info:'${item.p_info}', createdTS: '${item.createdTS}', modifiedTS:'${item.modifiedTS}', p_product:'${item.p_product}', p_quantity:'${item.p_quantity}', p_totalprice:'${item.p_totalprice}', p_unit:'${item.p_unit}', accumulationpoint:'${item.accumulationpoint}',usepoint:'${item.usepoint}', usegiftamount:'${item.usegiftamount}', coupondiscountamount: '${item.coupondiscountamount}', accumulationrate: '${item.accumulationrate}',warehousestockquantity:'${item.warehousestockquantity}', lgdamount:'${item.lgdamount}', originalquantity: '${item.originalquantity}',saleyn: '${item.saleyn}'},				
				</c:forEach>
			];			
			myGrid.setList(list);
		},
		appendGrid: function(index){
			var item = {};
			if(index) {
				myGrid.appendList(item, index);
			} else {
				myGrid.appendList(item);
			}
		},
		removeList: function(){
			var checkedList = myGrid.getCheckedListWithIndex(0); // 0: colSeq
			if(checkedList.length == 0){
				alert("선택된 목록이 없습니다. 삭제하려는 목록을 체크하세요");
				return;
			}
			trace(checkedList);
			myGrid.removeListIndex(checkedList);
		},
		restoreList: function() {
			var checkedList = myGrid.getCheckedList(0);
			if( checkedList.length == 0){
				alert("선택된 목록이 없습니다.");
				return;
			}
			
			var removeList = [];
			$.each(checkedList, function() {
				removeList.push({no:this.no});
			});
			
			trace(removeList);
			myGrid.restoreList(removeList);
		}
};
			
				/* onchangeScroll: function() {
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
				} */
			
			
			
			



	
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
<!-- view-source:http://dev.axisj.com/samples/AXGrid/passive.html -->
<div style="padding:10px 0px;">
	<input type="button" value="추가하기" class="AXButton Red" onclick="fnObj.appendGrid();" />
	<input type="button" value="삭제하기" class="AXButton Red" onclick="fnObj.removeList();" />
	<input type="button" value="삭제취소" class="AXButton Red" onclick="fnObj.restoreList();" />
	<input type="button" value="새로고침" class="AXButton Red" onclick="fnObj.reloadList();" />
	
	
</div>	
</body>
</html>