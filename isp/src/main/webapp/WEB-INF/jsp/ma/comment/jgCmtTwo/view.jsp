<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type="hidden" name="jgSeq" id="jgSeq" value="${jgCmtTwoVO.jgSeq }"/>
		<input type="hidden" name="jgGroupSeq" id="jgGroupSeq" value="${jgCmtTwoVO.jgGroupSeq }"/>
		<input type="hidden" id="jgAtchFileId" name="jgAtchFileId" value="${jgCmtTwoVO.jgAtchFileId }"/>
		<input type="hidden" id="jgReAtchFileId" name="jgReAtchFileId" value="${jgCmtTwoVO.jgReAtchFileId }"/>
		
		
<!-- tbl 게시글 -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
				
					<tr>
						<th scope="row"><strong >등록자</strong></th>
						<td>${jgCmtTwoVO.jgRgstId }</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${jgCmtTwoVO.jgRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong >댓글여부</strong></th>
						<td colspan="3"> ${jgCmtTwoVO.jgReplyUseYn eq  'N' ? '부' : '여'}</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >게시글 제목</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${jgCmtTwoVO.jgTitle}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong>게시글 내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${jgCmtTwoVO.jgCont}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong >첨부파일</strong></th>
						<td colspan="3">
							<iframe name="jgAtchFileIdFrame" id="jgAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${jgCmtTwoVO.jgAtchFileId }&fileCnt=5&atchFileIdNm=jgAtchFileId&updateType=view" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div> 
		
		<div class="btn_area">
			<a href="javascript:void(0);" id="btn_update" 	class="btn btn_mdl btn_rewrite" >수정</a> 
			<a href="javascript:void(0);" id="btn_del" 		class="btn btn_mdl btn_del" >삭제</a>
			<a href="javascript:void(0);" id="btn_list"		class="btn btn_mdl btn_list" >목록</a>
		</div>	
<!-- 게시글 끝 ----------------------------------------------------------->
	<div class="replyInput">  </div>

	</form:form>
</div>

<script type="text/javascript">

$(document).ready(function(){	
	// 댓글 입력 
	 $.ajax({  
		 method: "POST",  
   		 url: "addListReply.do",  
   		 data : $("#defaultFrm").serialize(),  // 쿼리스트링 형식 
   		 dataType: "html", 
   		 success: function(data) {
  			$(".replyInput").html(data);
   		 	}
		});//목록호출
	
	
});  // document.ready마지막



















</script>
	
	
