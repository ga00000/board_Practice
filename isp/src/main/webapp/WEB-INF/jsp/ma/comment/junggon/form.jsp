<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="junggonVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="jgSeq" id="jgSeq"/>
		<form:hidden path="jgAtchFileId" id="jgAtchFileId"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="tbl_row_type01"> 
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup> 
				<tbody>
					<tr>
						<th scope="row" ><strong class="th_tit" > 게시글 등록 </strong></th>
						<td colspan="3">
							<input type="text" name="jgTitle" id="jgTitle" class="text w100p"   maxlength="20"  placeholder="물품 이름을 입력해주세요." value="${util:unEscape(junggonVO.jgTitle) }" />
								
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="jgAtchFileIdFrame" id="jgAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${junggonVO.jgAtchFileId }&fileCnt=5&atchFileIdNm=jgAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
					 
				</tbody>
			</table>
		</div>
		
		<div class="btn_area">
			<a href="javascript:void(0);" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit"">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
</div>


<script type="text/javascript">
$(document).ready(function(){	
	$("#btn_submit").on("click", function(){
			fncPageBoard('submit','${searchVO.procType}Proc.do');
			return false;
	}); //btn_submit 끝 

	
	$("#btn_returnView").click(function(){
		fncPageBoard('view','view.do');
		});
});	
	
	
</script>