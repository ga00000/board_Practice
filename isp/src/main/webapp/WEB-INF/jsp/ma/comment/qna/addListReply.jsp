<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<!-- 답글 시작 ----------------------------------------------------------->
	<!-- insertComments : 답글 입력 -->   
		<c:choose>
			<c:when test="${empty qnaVO.qaCont}">
				<div class="tbl_wrap" >
					<h3 class ="tit_page"> 답글 입력 </h3>
					<table class="tbl_row_type01" > 
						<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:80%;">
						</colgroup> 
						
						<tbody>
							<tr>
								<th scope="row" ><strong  class="th_tit">답글</strong></th>
								<td colspan="3" id="td_reply">
									<textarea name="qaCont" id="qaCont" class="text w100p"   maxlength="200" rows="3" placeholder="답글을 입력해주세요." ></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="btn_area" >
						<a href="javascript:void(0);" id="btn_submit" class="btn btn_sml02 btn_save" onclick="replyInsert();">답글등록</a>
					</div>  
					
				</div> 
			 </c:when>
		<%--  답글 입력 끝 --%>
		
		<%-- selectComments : 답글 1개 조회 --%>
			<c:otherwise>
				<div class="tbl_wrap"  >
					<h3 class ="tit_page"> 답글 조회</h3>
					<table class="tbl_row_type01">
						<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
						<colgroup>
							<col style="width:5%;">
							<col style="width:10%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr> 
								<th scope="row" rowspan="4" ><strong>1</strong></th>
							</tr>
							<tr>
								<th scope="row"><strong>등록자</strong></th>
								<td>
									${qnaVO.qaMaRgstId}
								</td>
			                    <th scope="row"><strong>등록일</strong></th>
								<td>${qnaVO.qaMaRgstDt}</td>
							</tr>
							<tr>
								<th scope="row"><strong>답글 내용</strong></th>
								<td colspan="3" id="td_reply_re">${qnaVO.qaCont}</td>
							</tr>
							
						</tbody>
					</table>
				</div> 
				
				<div class="btn_area">
					<a href="javascript:void(0);" id="btn_Re_update_re"  class="btn btn_sml02 btn_rewrite"  onclick="replyUpdate('${qnaVO.qaReAtchFileId}');"> 답글수정</a> 
					<a href="javascript:void(0);" id="btn_Re_submit_re"  class="btn btn_sml02 btn_save" 	onclick="replyUpdateComplete();"  style="display:none">수정완료</a>
					<a href="javascript:void(0);" id="btn_Re_cancel_re"  class="btn btn_sml02 btn_cancel"   onclick="replyUpdateCancel();"	style="display:none">수정취소</a>
					<a href="javascript:void(0);" id="btn_Re_del_re" 	 class="btn btn_sml02 btn_del"		onclick="replyDelete();" > 답글삭제</a>
				</div>
					
			</c:otherwise> 
		<%--  답글 리스트 조회 끝  --%>
		</c:choose>
		
		<div class="replyInput">  </div>

<script type="text/javascript">

//유효성 검사 함수
function fncMsg(id, wrestMsg){ 
	var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
	$("#"+id).parent().children('strong').remove();
	if(wrestMsg != null && wrestMsg != ""){
		$("#"+id).parent().append(msgHtml);
		$("#"+id).focus();
	}
}

$(document).ready(function(){	
	// 답글 등록 
	replyInsert = function(){
		if($("#qaCont").val() == null || $("#qaCont").val() == "") {  
			fncMsg("qaCont","답글을 입력해주세요");
		}else{
			if(!confirm("답글을 등록하시겠습니까?")){
			}
			 $.ajax({  
				 method: "POST",  
		 		 url: "insertReProc.do",  
		 		 data : $("#defaultFrm").serialize(),  // 쿼리스트링 형식 
		 		 dataType: "html", 
		 		 success: function(data) {
		 			$(".replyInput").html(data);
		 		 }
			 }) 
		}
	 };
	
	
	// 답글 수정 
	replyUpdate = function(btnAtchId){ 
			if(!confirm("답글을 수정하시겠습니까?")){
			} 
			var replyCont = $("#td_reply_re").html(); // 답글 내용 가져오기 
			var	replyHtml = ' ';
				replyHtml +='<textarea id="qaCont_Re" name="qaCont" class="text w100p" maxlength="200" rows="4">'+replyCont+'</textarea>'; 
			$("#td_reply_re").html(replyHtml); // 해당 답글 입력창 변환 + 답글 내용 입력
				
			var replyAtchFileHtml='';
				replyAtchFileHtml +='<iframe name="qaReAtchFileIdFrame" id="qaReAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId='+btnAtchId+'&fileCnt=5&atchFileIdNm=qaReAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" ></iframe>';
			$("#td_atchFile_re").html(replyAtchFileHtml); 
			
			$("#btn_Re_update_re").hide(); // 답글수정 hide
			$("#btn_Re_del_re").hide();    // 답글삭제 hide
			$("#btn_Re_cancel_re").show(); // 수정취소 show    
			$("#btn_Re_submit_re").show(); // 수정완료 show	
		}
	
	// 답글 수정완료   
	replyUpdateComplete = function (){
		if(!confirm("답글을 등록하시겠습니까?")){
		}
		$("#qaCont_Re").val();  
		 $.ajax({  
			 method: "POST",  
	 		 url: "updateReProc.do",  
	 		 data : $("#defaultFrm").serialize(),  // 쿼리스트링 형식 
	 		 dataType: "html", 
	 		 success: function(data) {
	 			$(".replyInput").html(data);
	 		 }
		 })  
	};
	
	// 답글 수정취소
	replyUpdateCancel = function(){
		if($("#qaCont").val() == null || $("#qaCont").val() == "") {  
			if(!confirm("수정 중인 답글이 있습니다. 수정 취소 하시겠습니까? ")){
				return false;
			}
		$.ajax({  
			 method: "POST",  
	 		 url: "updateReProc.do",  
	 		 data : $("#defaultFrm").serialize(),  // 쿼리스트링 형식 
	 		 dataType: "html", 
	 		 success: function(data) {
	 			$(".replyInput").html(data);
	 		 }
		 }) 
		}
	}
	
	// 답글 삭제
	replyDelete = function(){  
		if(!confirm("답글을 삭제하시겠습니까?")){
		}
		 $.ajax({  
			 method: "POST",  
	 		 url: "deleteReProc.do",  
	 		 data : $("#defaultFrm").serialize(),  
	 		 dataType: "html", 
	 		 success: function(data) {
	 			$(".replyInput").html(data);
	 		 }
		 })  
	}
	

});  // document.ready마지막

</script>
	
