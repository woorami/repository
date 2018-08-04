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
<script type="text/javascript">
var myGrid = new AXGrid();
var fnObj = {
		pageStart: function() {
			myGrid.setConfig({
				targetID: "AXGridTarget",
				colGroup: [
					{key:"no", label:"번호", width:"100", align:"center"},
					{key:"id", label:"아이디", width:"200", align:"center"},
					{key:"name", label:"이름", width:"200", align:"center"},
					{key:"createdts", label:"가입일", width:"200", align:"center"}
				],				
				body: {
					onclick: function(){
						toast.push(Objedct.toJSON(this.item));
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
</script>
</head>
<body>
<table>
<div id="AXGridTarget" style="height:500px;"></div>
</table>
</body>
</html>