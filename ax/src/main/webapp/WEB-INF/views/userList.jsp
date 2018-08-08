<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<script type="text/javascript" src="/ax/resources/js/ax/AXModal.js"></script>
<script type="text/javascript">
var myGrid = new AXGrid();
var fnObj = {
		pageStart: function() {
			myGrid.setConfig({
				targetID: "AXGridTarget",
				sort: true,
				viewMode: "grid", // grid, icon, mobile
				colGroup: [
					{key:"no", label:"��ȣ", width:"100", align:"center"},
					{key:"id", label:"���̵�", width:"200", align:"center"},
					{key:"name", label:"�̸�", width:"200", align:"center"},
					{key:"createdts", label:"������", width:"200", align:"center"}
				],				
				body: {
					onclick: function(){
						var itemHtml  = "<table width=\"200\">";
						    itemHtml += "<tr><td>��ȣ:</td>";
						    itemHtml += "<td>"+ this.item.no +"</td>";
						    itemHtml += "</tr>";
						    itemHtml += "<tr>";
						    itemHtml += "<td>���̵�</td>";
						    itemHtml += "<td>"+ this.item.id +"</td>";
						    itemHtml += "</tr>";
						    itemHtml += "</table>";
						//toast.push(Object.toJSON(this.item));
						toast.push(itemHtml);
					}
				}
			});
			
			// DATA SET
			var list = [			
				<c:forEach items="${list}" var="userList" varStatus="idx">
				{  no:"${idx.index}", id:"${userList.p_uid}", name: "${userList.p_name}", createdts: "${userList.createdts}" },
				</c:forEach>
			];
			
			myGrid.setList(list);
		}
	}
$(document).ready(fnObj.pageStart);

(function(){
	var myModal = new AXModal();
	myModal.setConfig({
		windowID: "myModalCT", width: 740, mediaQuery: { // ���â ������ ���� - �ʼ����� �ƴ�
			mx:{min:0, max:767}, dx:{min:767}
		},
		displayLoading: true, // �ε��� ǥ�� ����
		scrollLock: true, // ���â�� ������ �� ������ ��ũ�� ���� �ɼ�
		onclose: function(){
			toast.push("���â �ݱ�");
		}
	});

	$("#ui-modal-iframe-open").click(function() {
		console.log("1");
		myModal.open({
			method: "GET",
			url:"/order/orderList",
			pars:"",
			closeByEscKey: true // ���â�� �������� ESCŰ�� ���â �ݱ� �ɼ�
		});
	});
})()
</script>
</head>
<body>
<table>
<div id="AXGridTarget" style="height:500px;"></div>

<div class="target-result">
	<button class="AxButton" id="ui-modal-iframe-open">���â ����</button>
</div>
</table>
</body>
</html>