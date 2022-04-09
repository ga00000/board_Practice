<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<style>
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.25); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}


</style>

<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:5%">
			<col>
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">비밀글</th>				
				<th scope="col" class="subject  lengthCut"  >제목</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
				
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) gt 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<c:choose>
							<c:when test="${empty result.seSecretPw }">
								<tr class="cursor" onclick="fncPageBoard('view','view.do','${result.seSeq}','seSeq')">
							</c:when>
							
							<c:otherwise>
								<tr class="cursor" onclick="titleClick('${result.seSecretYn}', ${result.seSeq});">
							</c:otherwise>
						</c:choose>
								<td>${paginationInfo.totalRecordCount+1- ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}</td>
								<td> ${result.seSecretYn eq "N" ? '부' : '여'}</td>
								<td class="subject"><a href="#open-modal" class="lengthCut" >
						<c:choose>
							<c:when test="${!empty result.seSecretPw }">&#128274;</c:when>
						</c:choose>
								${result.seTitle }</a></td>
							<td>${result.seRgstId }</td>
							<td>${result.seRgstDt }</td>
						</tr>
						
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
<!-- 	모달창 -->
	<div class="modal">
	  <div class="modal_content" title="비밀번호 확인 모달창">
	    <div> 비밀글입니다. 비밀번호를 입력해주세요.</div><br>
	    <span> 비밀번호: </span> &nbsp; <input type="password" id ='sePw' name = 'sePw'/> 
	    <input type = "hidden" id="deliverSeq" name = "deliverSeq">
	    
	    <input type = "button" id ='modalBtn' onclick="modalOpen();" value="확인"/> 
	    <input type = "button" id ='modalCancel'onclick="modalExit();" value="취소"/>
	  </div>
	</div>
	
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>


<script type="text/javascript">

function fncMsg(id, wrestMsg){ 
	var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
	$("#"+id).parent().children('strong').remove();
	if(wrestMsg != null && wrestMsg != ""){
		$("#"+id).parent().append(msgHtml);
		$("#"+id).focus();
	}
} // 유효성 함수 끝 

$(document).ready(function(){	
	// 게시글 비밀글이면 모달창 띄우기 
	titleClick = function(seSecretYn,seSeq){
		if(seSecretYn=='Y'){  // 비밀글 o
			$("#deliverSeq").attr("value","");
			$(".modal").fadeIn();
			$("#deliverSeq").attr("value",seSeq);
		}
	};
	
	// 모달창 비밀번호 확인
	modalOpen = function(seSeq){
		$.ajax({  
			 method: "POST", 
	 		 url: "checkPw.do", 
	 		 data : {"seSeq":$("#deliverSeq").val(),"seSecretPw":$("#sePw").val()},  // 쿼리스트링 형식 
	 		 dataType: "JSON", 
	 		 success: function(data) {
	 			 if(data){
	 				fncPageBoard('view','view.do',$("#deliverSeq").val(),'seSeq');
	 				modalExit();
	 			 }else{
	 			fncMsg("sePw", "비밀번호가 틀렸습니다.");
	 				$("#sePw").val("");
	 			 }
	 		 }
		 })
	};
		
	// 모달창 취소 
	modalExit = function(){
		 $(".modal").fadeOut();
	};
	
	
});


</script>
