<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="noodleVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="ndSeq" id="ndSeq"/>
		<form:hidden path="ndAtchFileId" id="ndAtchFileId"/>
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
						<th scope="row" ><strong class="th_tit" >제목</strong></th>
						<td colspan="3">
							<input type="text" name="ndTitle" id="ndTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${util:unEscape(noodleVO.ndTitle) }" />
								
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit">카테고리</strong></th>
						<td>
									<form:select path="ndCategory" id="ndCategory" title="카테고리"   cssClass="w50p cursor" >  
										<form:option value=""					 			label="카테고리 선택 " selected="true" /> 
										<form:option value="파스타" 				label="파스타"/> 
										<form:option value="라면" 					label="라면"/> 
										<form:option value="우동" 					label="우동"/> 
										<form:option value="짜장면" 				label="짜장면"/> 
										<form:option value="짬뽕" 					label="짬뽕"/> 
									</form:select>
						</td>  
						
						<%--  radio : 브랜드 path로 묶음 --%>
						<th scope="row"><strong class="th_tit">브랜드</strong></th>
						<td id="label">
									<label for="">									<form:radiobutton path="ndBrand" 	name="ndBrand" 	cssClass="radio cursor"  class="brandCheck" id="" value="이마트몰" /> 이마트몰</label>
									<label for="ndBrand_traders">		<form:radiobutton path="ndBrand" 	name="ndBrand" 	cssClass="radio cursor"  class="brandCheck" id="ndBrand_traders" value="트레이더스"/> 트레이더스</label>
									<label for="ndBrand_ssg">				<form:radiobutton path="ndBrand"	name="ndBrand" 	cssClass="radio cursor"  class="brandCheck" id="ndBrand_ssg" value="SSG"/> SSG </label>
									<label for="ndBrand_shinsegae"> <form:radiobutton path="ndBrand" 	name="ndBrand" 	cssClass="radio cursor"  class="brandCheck" id="ndBrand_shinsegae" value="신세계"/> 신세계</label>
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 별점 숫자로 수정할것 !    --%>
						 <th scope="row"><strong class="th_tit">별점</strong></th>
						<td>
									<form:select path="ndStar" id="ndStar" title="별점" cssClass="w50p cursor" >  
									<form:option value=""  label="별점 선택" selected="true" /> 
									<form:option value="★"  			label="★"/> 
									<form:option value="★★" 			label="★★"/> 
									<form:option value="★★★" 		label="★★★"/> 
									<form:option value="★★★★" 	label="★★★★"/> 
									<form:option value="★★★★★" label="★★★★★"/> 
									</form:select>
						</td> 
					<%--  Checkbox : 결제수단    --%>
						 <th scope="row"><strong class="th_tit">결제수단</strong></th>
						<td cssClass="check_box w50p" >
								<input type="checkbox"  class="payCheck cursor" id="ndPayment_1"  name="ndPayment"  value="신용카드"  ${fn:indexOf(noodleVO.ndPayment,'신용카드') ne -1 ? 'checked' : '' } /><label for="ndPayment_1">신용카드</label>
								<input type="checkbox"  class="payCheck cursor" id="ndPayment_2"  name="ndPayment"  value="카카오페이"  ${fn:indexOf(noodleVO.ndPayment,'카카오페이') ne -1  ? 'checked' : '' }/><label for="ndPayment_2">카카오페이</label>
								<input type="checkbox"  class="payCheck cursor" id="ndPayment_3"  name="ndPayment"  value="네이버페이"  ${fn:indexOf(noodleVO.ndPayment,'네이버페이') ne -1  ? 'checked' : '' }/><label for="ndPayment_3">네이버페이</label>
								<input type="checkbox"  class="payCheck cursor" id="ndPayment_4"  name="ndPayment"  value="페이코"  ${fn:indexOf(noodleVO.ndPayment,'페이코') ne -1  ? 'checked' : '' }/><label for="ndPayment_4">페이코</label>
						</td> 
					</tr>
					
					<tr>
						<th scope="row" ><strong class="th_tit" >가격</strong></th>
						<td colspan="3">
							<input type="text" name="ndPrice" id="ndPrice" class="numOnly w30p"   onFocus="this.value=''; return true;" maxlength="20"  placeholder="가격을 입력해주세요." value="${util:unEscape(noodleVO.ndPrice) }" /> 원
						</td>
					</tr>
				
					<tr>
						<th scope="row"><strong class="th_tit">상품소개</strong></th>
						<td colspan="3">
							<textarea name="ndCont" id="ndCont" class="txt_area w_100p" >${util:unEscape(noodleVO.ndCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">제품성분</strong></th>
						<td colspan="3">
							<textarea name="ndIngredient" id="ndIngredient" class="txt_area w_100p" maxlength="100" >${util:unEscape(noodleVO.ndIngredient)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="ndAtchFileIdFrame" id="ndAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${simplemealVO.ndAtchFileId }&fileCnt=5&atchFileIdNm=ndAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
var oEditors = [];
$(document).ready(function(){	

	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ndCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});  // 에디터 끝 


	<%-- 유효성 검사 -------------------------------------------------------------------------------%>	
function fncMsg(id, wrestMsg){ 
	var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
	$("#"+id).parent().children('strong').remove();
	if(wrestMsg != null && wrestMsg != ""){
		$("#"+id).parent().append(msgHtml);
		$("#"+id).focus();
	}
}

$("#btn_submit").on("click", function(){
	
	if($("#ndTitle").val() == null || $("#ndTitle").val() == "") {  
		fncMsg("ndTitle","제목을 입력해주세요");
		return false;
	}else {
		fncMsg("ndTitle");
	}
	
	if($("#ndCategory").val() == "") {  
		fncMsg("ndCategory","카테고리를 선택해주세요");
		return false;
	}else {
		fncMsg("ndCategory");
	}
	
	if($("#ndStar").val() == "") {  
		fncMsg("ndStar","별점을 선택해주세요");
		return false;
	}else {
		fncMsg("ndStar");
	}
	
	<%--  --%>
	if($("[id^='ndBrand_']:checked").length == 0) {
		fncMsg("ndBrand_shinsegae","브랜드를 체크해주세요");
		return false;
	}else {
		fncMsg("ndBrand_shinsegae");
	} 	
 
	
	if($("[id^='ndPayment_']:checked").length == 0) {
		fncMsg("ndPayment_1","결제수단을 하나이상 체크해주세요");
		return false;
	}else {
		fncMsg("ndPayment_1");
	}  
	
	if($("#ndPrice").val() == 0) {  
		fncMsg("ndPrice","가격을 입력해주세요");
		return false;
	}else {
		fncMsg("ndPrice");
	}

	oEditors.getById["ndCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#ndCont").val()=='<p>&nbsp;</p>') {
		fncMsg("ndCont", "상품소개를 입력해주세요");
		return false;
	}else {
		fncMsg("ndCont");
	} 
	
	if($("#ndIngredient").val() == null || $("#ndIngredient").val() == "") {  
		fncMsg("ndIngredient","재품성분을 입력해주세요");
		return false;
	}else {
		fncMsg("ndIngredient");
	}
		
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
}); //btn_submit 끝 
	
$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
	});
	
}); //제이쿼리 마지막
</script>