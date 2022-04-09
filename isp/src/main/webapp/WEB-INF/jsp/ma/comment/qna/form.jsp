<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="qnaVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="qaSeq" id="qaSeq"/>
		<form:hidden path="qaAtchFileId" id="qaAtchFileId"/>
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
						<th scope="row" ><strong class="th_tit" > 게시글 제목 </strong></th>
						<td colspan="3">
							<input type="text" name="qaTitle" id="qaTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${qnaVO.qaTitle}" />
								
						</td>
					</tr>
					
					<tr>
						
						<th scope="row" ><strong class="th_tit" > 카테고리 </strong></th>
						<td class="cursor">
							<select name ="qaCategory" id = "qaCategory" name = "qaCategory" class=" cursor" style="width:100%;">
								<option value =""  selected >카테고리선택</option> 
								<option value ="주문문의" >주문문의</option> 
								<option value ="배송문의">배송문의</option> 
								<option value ="결제문의">결제문의</option> 
							</select>
						</td>
					</tr>
					
					
					
					<tr>
						<th scope="row"><strong class="th_tit">게시글 내용</strong></th>
						<td colspan="3">
							<textarea name="qaCont" id="qaCont" class="txt_area w_100p" maxlength="200" >${util:unEscape(qnaVO.qaCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="qaAtchFileIdFrame" id="qaAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${qnaVO.qaAtchFileId}&fileCnt=5&atchFileIdNm=qaAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
					 
				</tbody>
			</table>
		</div>
		
		<div class="btn_area">
			<a href="javascript:void(0);" class="btn btn_mdl btn_save" id="btn_submit" onclick="btnSubmit();">등록</a>
			<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list" onclick="btnCancel();">취소</a>
		</div>
	</form:form>
</div>

<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "qaCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});  // 에디터 끝 
	
	function fncMsg(id, wrestMsg){ 
		var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
		$("#"+id).parent().children('strong').remove();
		if(wrestMsg != null && wrestMsg != ""){
			$("#"+id).parent().append(msgHtml);
			$("#"+id).focus();
		}
	} // 유효성 함수 끝 
	
	
	// 게시글 등록 
	btnSubmit = function(){
		var count=0;
		// 제목 
		if($("#qaTitle").val() == "" || $("#qaTitle").val() == null) {
			fncMsg("qaTitle","제목을 입력해주세요.");
			$("#qaTitle").focus();
			count++;
		}
		// 내용
		oEditors.getById["qaCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		if($("#qaCont").val() == '<p>&nbsp;</p>') {
			fncMsg("qaCont","내용을 입력해주세요.");
			count++;
		}	
		// 카테고리
		if($("#qaCategory").val()==""){
			fncMsg("qaCategory", "카테고리를 선택해주세요.")
			count++;
		} 
		
		
		
		if(count>0){
			return false;
		}
	
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	};	
	
	// 게시글 취소
	btnCancel = function(){	
		$("#boardSeq").val($("#boardGrpSeq").val());
		fncPageBoard('view','view.do');
	}
	
	


});


	
	
</script>