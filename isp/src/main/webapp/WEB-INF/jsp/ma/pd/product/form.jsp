<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="productVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="pdSeq" id="pdSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="pdAtchFileId" id="pdAtchFileId"/>
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
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<input type="text" name="pdTitle" id="pdTitle" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(productVO.pdTitle) }" />
							<form:errors path="pdTitle" cssClass="error" cssStyle="color:#ff0000" /> 
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="pdCont" id="pdCont" class="txt_area w_100p" >${util:unEscape(productVO.pdCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="pdAtchFileIdFrame" id="pdAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${productVO.pdAtchFileId }&fileCnt=5&atchFileIdNm=pdAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="javascript:void(0);" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
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
var oEditors = [];
$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "pdCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	$("#btn_submit").bind("click", function(){
		if($("#pdTitle").val() == "" || $("#pdTitle").val() == null) {
			alert("제목을 입력해주세요");
			$("#pdTitle").focus();
			return false;
		}
			oEditors.getById["pdCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
			
		if($("#pdCont").val()=='<p>&nbsp;</p>') {
			alert("내용을 입력해주세요");
			oEditors.getById["pdCont"].exec("FOCUS"); /* 에디터 */
			return false;
		}
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	});
	
	$("#btn_returnView").click(function(){
		fncPageBoard('view','view.do');
	});
	
});
</script>