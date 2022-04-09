<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type="text" name="seSeq" id="seSeq" value="${secretVO.seSeq }"/>
		<input type="text" id="seAtchFileId" name="seAtchFileId" value="${secretVO.seAtchFileId }"/>
		
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
<!-- tbl 게시글-->
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
						<td>
							${secretVO.seRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${secretVO.seRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong >비밀글 여부</strong></th>
						<td colspan="3"> ${secretVO.seSecretYn eq  'N' ? '부' : '여'}</td>
					</tr>
					
					<tr>
						<th scope="row"><strong >게시글 제목</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${secretVO.seTitle}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong>게시글 내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(secretVO.seCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong class=>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="seAtchFileIdFrame" id="seAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${secretVO.seAtchFileId }&fileCnt=5&atchFileIdNm=seAtchFileId&updateType=view" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
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
<!-- 게시판 끝 ----------------------------------------------------------->
<!--  댓글 ajax -->
		

	</form:form>
</div>

<script type="text/javascript">




$(document).ready(function(){

		
		
  
	
	

});  // document.ready마지막


</script>
	
	
