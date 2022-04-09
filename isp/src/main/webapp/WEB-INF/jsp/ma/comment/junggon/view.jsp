<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="jgSeq" id="jgSeq"/>
		<input type="hidden" id="jgCAtchFileId" name="jgCAtchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
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
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${junggonVO.jgRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${junggonVO.jgRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong>댓글 내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(junggonVO.jgTitle)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="jgAtchFileIdFrame" id="jgAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${junggonVO.jgAtchFileId }&fileCnt=5&atchFileIdNm=jgAtchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div> <!-- 게시판 뷰 끝 -->
		
	<div class="btn_area">
		<a href="javascript:void(0);" id="btn_update" 	class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0);" id="btn_del" 		class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0);" id="btn_list"		class="btn btn_mdl btn_list" >목록</a>
	</div>	
<!-- 게시판 끝 ----------------------------------------------------------->
<!-- 댓글 시작 ----------------------------------------------------------->
 	
<!-- insertComments : 댓글 입력 폼 [선] 시퀀스/내용/등록일/등록자/첨부파일아이디-->
	<c:choose>
	<c:when test="${empty junggonVO.jgCCont}">
		
		<div class="tbl_wrap" >
		<h3 class ="tit_page"> 댓글 입력 </h3>
				<table class="tbl_row_type01" > 
					<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:85;">
					</colgroup> 
					
					<tbody>
						<tr>
							<th scope="row" ><strong class="th_tit" >댓글</strong></th>
							<td colspan="3" id="td_reply">
								<input type="text" name="jgCCont" id="jgCCont" class="text w100p"   maxlength="100"  placeholder="댓글을 입력해주세요." />
									
							</td>
						</tr>
						
						<tr>
							<th scope="row"><strong>첨부파일</strong></th>
							<td colspan="3">
								<iframe name="jgCAtchFileIdFrame" id="jgCAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=2&atchFileIdNm=jgCAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							</td>
						</tr> 
						 
					</tbody>
				</table>
			</div> 
			
			<div class="btn_area">
				<a href="javascript:void(0);" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '댓글등록'}</a>
				<c:if test="${searchVO.procType eq  'update'}">
					<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_returnView">등록취소</a>
				</c:if>
				<c:if test="${searchVO.procType ne  'update'}">
					<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_listCancel">등록취소</a>
				</c:if>
			</div> 
	</c:when> 
<%--  	댓글 입력 끝 --%>
		
	<c:otherwise>
<%-- selectContents : 댓글 상세내역 조회(view) [선] 등록자/내용/등록일/첨부파일아이디 --%>
		<div class="tbl_wrap"  >
		<h3 class ="tit_page"> 댓글 조회 </h3>
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
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${junggonVO.jgCRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${junggonVO.jgCRgstDt }</td>
					</tr>
					<tr>
						<th scope="row"><strong>댓글 내용</strong></th>
						<td colspan="3" id="td_reply">
							${junggonVO.jgCCont }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="jgCAtchFileIdFrame" id="jgCAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${junggonVO.jgCAtchFileId }&fileCnt=2&atchFileIdNm=jgCAtchFileId&updateType=view" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div> 
		
		<div class="btn_area">
		<a href="javascript:void(0);" id="btn_Re_update" 	class="btn btn_mdl btn_rewrite" >댓글수정</a> 
		<a href="javascript:void(0);" id="btn_Re_del" 		class="btn btn_mdl btn_del" >댓글삭제</a>
		</div>
		</c:otherwise> 
<%-- 		댓글 상세내역 끝  --%>
</c:choose>
		</form:form>
	</div>

<script type="text/javascript">
$(document).ready(function(){	
	// 댓글 등록 
	$("#btn_submit").on("click", function(){
		if(!confirm("댓글을 등록하시겠습니까?")){
			return false;
		}
		fncPageBoard('update','updateReProc.do'); // controller 로 요청 
		return false;
	});
	
	// 댓글 등록 취소 : 값 empty
	$("#btn_listCancel").on("click", function(){
		$("#jgCCont").val("");
		});
	
	// 댓글 수정 
	$("#btn_Re_update").on("click", function(){
		var replyCont = "${junggonVO.jgCCont }";
		var replyHtml = '';
			replyHtml += '<input type="text" id="jgCCont" name="jgCCont" value="'+replyCont+'"/>';
		$("#td_reply").html(replyHtml);	
		$("#btn_Re_update").remove();
		$("#btn_Re_del").parent().prepend('<a href="javascript:void(0);" id="btn_Re_Success" class="btn btn_mdl btn_rewrite" >댓글등록</a> ').on("click", function(){
			
			fncPageBoard('update','updateReProc.do'); // controller 로 요청 
			
		});return false;
		
	});
	
	
	//댓글 삭제
	$("#btn_Re_del").click(function(){
		fncPageBoard('del','deleteReProc.do');
	});
	


}); // document.ready마지막
</script>
	
	
