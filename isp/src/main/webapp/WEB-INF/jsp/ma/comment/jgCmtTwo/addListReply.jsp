<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<!-- 댓글 시작 ----------------------------------------------------------->
	<!-- insertComments : 댓글 입력 -->   
		<c:choose>
			<c:when test="${empty jgCmtTwoVO.jgCont}">
				<div class="tbl_wrap" >
					<h3 class ="tit_page"> 댓글 입력 </h3>
					<table class="tbl_row_type01" > 
						<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:80%;">
						</colgroup> 
						
						<tbody>
							<tr>
								<th scope="row" ><strong  class="th_tit">댓글</strong></th>
								<td colspan="3" id="td_reply">
									<textarea name="jgCont" id="jgCont" class="text w100p"   maxlength="200" rows="3" placeholder="댓글을 입력해주세요." ></textarea>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><strong >첨부파일</strong></th>
								<td colspan="3" id ="td_atchFile">
									<iframe name="jgReAtchFileIdFrame" id="jgReAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
								</td>
							</tr> 
						</tbody>
					</table>
<!-- 					댓글유무 구분값 도전  -->
<%-- 					<input type = "hidden"  id ="jgReplyUseYn" name = "jgReplyUseYn" value = "${jgCmtTwoVO.jgReplyUseYn}" }" >  --%>
					<div class="btn_area" >
						<a href="javascript:void(0);" id="btn_submit" class="btn btn_sml02 btn_save" onclick="replyInsert();">댓글등록</a>
					</div>  
					
				</div> 
			 </c:when>
		<%--  댓글 입력 끝 --%>
		
		<%-- selectComments : 댓글 1개 조회 --%>
			<c:otherwise>
				<div class="tbl_wrap"  >
					<h3 class ="tit_page"> 댓글 조회</h3>
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
									${jgCmtTwoVO.jgRgstId}
								</td>
			                    <th scope="row"><strong>등록일</strong></th>
								<td>${jgCmtTwoVO.jgRgstDt}</td>
							</tr>
							<tr>
								<th scope="row"><strong>댓글 내용</strong></th>
								<td colspan="3" id="td_reply_re">${jgCmtTwoVO.jgCont}</td>
							</tr>
							<tr>
								<th scope="row"><strong>첨부파일</strong></th>
								<td colspan="3" id ="td_atchFile_re">
									<iframe name="jgReAtchFileId" id="jgReAtchFileId" src="/atch/fileUpload.do?atchFileId=${jgCmtTwoVO.jgReAtchFileId}&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=view" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div> 
				
				<div class="btn_area">
					<a href="javascript:void(0);" id="btn_Re_update_re"  class="btn btn_sml02 btn_rewrite"  onclick="replyUpdate('${jgCmtTwoVO.jgReAtchFileId}');"> 댓글수정</a> 
					<a href="javascript:void(0);" id="btn_Re_submit_re"  class="btn btn_sml02 btn_save" 	onclick="replyUpdateComplete();"  style="display:none">수정완료</a>
					<a href="javascript:void(0);" id="btn_Re_cancel_re"  class="btn btn_sml02 btn_cancel"   onclick="replyUpdateCancel();"	style="display:none">수정취소</a>
					<a href="javascript:void(0);" id="btn_Re_del_re" 	 class="btn btn_sml02 btn_del"		onclick="replyDelete();" > 댓글삭제</a>
				</div>
					
			</c:otherwise> 
		<%--  댓글 리스트 조회 끝  --%>
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
	// 댓글 등록 
	replyInsert = function(){
		if($("#jgCont").val() == null || $("#jgCont").val() == "") {  
			fncMsg("jgCont","댓글을 입력해주세요");
		}else{
			if(!confirm("댓글을 등록하시겠습니까?")){
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
	
	
	// 댓글 수정 
	replyUpdate = function(btnAtchId){ 
			if(!confirm("댓글을 수정하시겠습니까?")){
			} 
			var replyCont = $("#td_reply_re").html(); // 댓글 내용 가져오기 
			var	replyHtml = ' ';
				replyHtml +='<textarea id="jgCont_Re" name="jgCont" class="text w100p" maxlength="200" rows="4">'+replyCont+'</textarea>'; 
			$("#td_reply_re").html(replyHtml); // 해당 댓글 입력창 변환 + 댓글 내용 입력
				
			var replyAtchFileHtml='';
				replyAtchFileHtml +='<iframe name="jgReAtchFileIdFrame" id="jgReAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId='+btnAtchId+'&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" ></iframe>';
			$("#td_atchFile_re").html(replyAtchFileHtml); 
			
			$("#btn_Re_update_re").hide(); // 댓글수정 hide
			$("#btn_Re_del_re").hide();    // 댓글삭제 hide
			$("#btn_Re_cancel_re").show(); // 수정취소 show    
			$("#btn_Re_submit_re").show(); // 수정완료 show	
		}
	
	// 댓글 수정완료   
	replyUpdateComplete = function (){
		if(!confirm("댓글을 등록하시겠습니까?")){
		}
		$("#jgCont_Re").val();  
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
	
	// 댓글 수정취소
	replyUpdateCancel = function(){
		if($("#jgCont").val() == null || $("#jgCont").val() == "") {  
			if(!confirm("수정 중인 댓글이 있습니다. 수정 취소 하시겠습니까? ")){
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
	
	// 댓글 삭제
	replyDelete = function(){  
		if(!confirm("댓글을 삭제하시겠습니까?")){
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
	
