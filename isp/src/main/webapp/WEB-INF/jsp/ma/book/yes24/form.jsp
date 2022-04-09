<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="yes24VO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="yesSeq" id="yesSeq"/>
		<form:hidden path="yesAtchFileId" id="yesAtchFileId"/>
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
						<th scope="row" ><strong class="th_tit" >책이름</strong></th>
						<td colspan="3">
							<input type="text" name="yesTitle" id="yesTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${util:unEscape(yes24VO.yesTitle) }" />
								
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit ">카테고리</strong></th>
						<td>
									<form:select path="yesCategory" id="yesCategory" title="카테고리"   cssClass="w50p cursor" >  
										<form:option value=""				label="카테고리 선택 " selected="true" /> 
										<form:option value="인문학" 		label="인문학"	/> 
										<form:option value="경영경제" 		label="경영경제"	/> 
										<form:option value="자기계발" 	 	label="자기계발"	/> 
										<form:option value="현대문학" 		label="현대문학"	/> 
										<form:option value="고전문학" 		label="고전문학"	/> 
									</form:select>
						</td>  
						
						<%--  radio : 브랜드 path로 묶음 --%>
						<th scope="row"><strong class="th_tit">출판사</strong></th>
						<td id="label" class="cursor">
									<label for="yesBrand_minumsap"><form:radiobutton path="yesBrand" 	name="yesBrand" 	cssClass="radio cursor"  class="brandCheck" id="yesBrand_minumsap" value="민음사" /> 민음사</label>
									<label for="yesBrand_golden">		<form:radiobutton path="yesBrand" 	name="yesBrand" 	cssClass="radio cursor"  class="brandCheck" id="yesBrand_golden" value="황금가지"/> 황금가지</label>
									<label for="yesBrand_science">		<form:radiobutton path="yesBrand"	name="yesBrand" 	cssClass="radio cursor"   class="brandCheck" id="yesBrand_science" value="사이언스북스"/> 사이언스북스 </label>
									<label for="yesBrand_person">		 <form:radiobutton path="yesBrand" 	name="yesBrand" 	cssClass="radio cursor"  class="brandCheck" id="yesBrand_person" value="민음인"/> 민음인</label>
						</td> 
					</tr>
					
					<tr> 
					<%--  Select : 별점 숫자로 수정할것 !    --%>
						 <th scope="row"><strong class="th_tit">별점</strong></th>
						<td>
									<form:select path="yesStar" id="yesStar" title="별점" cssClass="w50p cursor" >  
									<form:option value=""  label="별점 선택" selected="true" /> 
									<form:option value="1"  			label="★"/> 
									<form:option value="2" 			label="★★"/> 
									<form:option value="3" 			label="★★★"/> 
									<form:option value="4" 			label="★★★★"/> 
									<form:option value="5" 			label="★★★★★"/> 
									</form:select>
						</td> 
					<%--  Checkbox : 결제수단    --%>
						 <th scope="row"><strong class="th_tit">결제수단</strong></th>
						<td cssClass="check_box w50p" >
								<input type="checkbox"  class="payCheck cursor" id="yesPayment_1"  name="yesPayment"  value="신용카드"  ${fn:indexOf(yes24VO.yesPayment,'신용카드') ne -1 ? 'checked' : '' } /><label for="yesPayment_1">신용카드</label>
								<input type="checkbox"  class="payCheck cursor" id="yesPayment_2"  name="yesPayment"  value="카카오페이"  ${fn:indexOf(yes24VO.yesPayment,'카카오페이') ne -1  ? 'checked' : '' }/><label for="yesPayment_2">카카오페이</label>
								<input type="checkbox"  class="payCheck cursor" id="yesPayment_3"  name="yesPayment"  value="네이버페이"  ${fn:indexOf(yes24VO.yesPayment,'네이버페이') ne -1  ? 'checked' : '' }/><label for="yesPayment_3">네이버페이</label>
								<input type="checkbox"  class="payCheck cursor" id="yesPayment_4"  name="yesPayment"  value="페이코"  ${fn:indexOf(yes24VO.yesPayment,'페이코') ne -1  ? 'checked' : '' }/><label for="yesPayment_4">페이코</label>
						</td> 
					</tr>
					
					<tr>
						<th scope="row" ><strong class="th_tit" >가격</strong></th>
						<td colspan="3">
							<input type="text" name="yesPrice" id="yesPrice" class="numOnly w20p"   onFocus="this.value=''; return true;" maxlength="20"  placeholder="가격을 입력해주세요." value="${util:unEscape(yes24VO.yesPrice) }" /> 원
						</td>
					</tr>
				
					<tr>
						<th scope="row"><strong class="th_tit">책 소개</strong></th>
						<td colspan="3">
							<textarea name="yesCont" id="yesCont" class="txt_area w_100p" >${util:unEscape(yes24VO.yesCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">출판사 서평</strong></th>
						<td colspan="3">
							<textarea name="yesIngredient" id="yesIngredient" class="txt_area w_100p" maxlength="190" >${util:unEscape(yes24VO.yesIngredient)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="yesAtchFileIdFrame" id="yesAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${yes24VO.yesAtchFileId }&fileCnt=5&atchFileIdNm=yesAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
	    elPlaceHolder: "yesCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});  // 에디터 끝 
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "yesIngredient",
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
	var count = 0;
	if($("#yesTitle").val() == null || $("#yesTitle").val() == "") {  
		fncMsg("yesTitle","책이름을 입력해주세요");
		count++;
	}else {
		fncMsg("yesTitle");
	}
	
	if($("#yesCategory").val() == "") {  
		fncMsg("yesCategory","카테고리를 선택해주세요");
		count++;
	}else {
		fncMsg("yesCategory");
	}
	
	if($("#yesStar").val() == "") {  
		fncMsg("yesStar","별점을 선택해주세요");
		count++;
	}else {
		fncMsg("yesStar");
	}
	
	if($("[id^='yesBrand_']:checked").length == 0) {
		fncMsg("yesBrand_person"," 출판사를 체크해주세요");
		count++;
	}else {
		fncMsg("yesBrand_person");
	} 	
	
	if($("[id^='yesPayment_']:checked").length == 0) {
		fncMsg("yesPayment_1","결제수단을 1개 이상 체크해주세요");
		count++;
	}else {
		fncMsg("yesPayment_1");
	}  
	
	if($("#yesPrice").val() == 0) {  
		fncMsg("yesPrice","가격을 입력해주세요");
		count++;
	}else {
		fncMsg("yesPrice");
	}

	oEditors.getById["yesCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#yesCont").val()=='<p>&nbsp;</p>') {
		fncMsg("yesCont", "책 소개를 입력해주세요");
		count++;
	}else {
		fncMsg("yesCont");
	} 
	
	oEditors.getById["yesIngredient"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#yesIngredient").val() =='<p>&nbsp;</p>') {  
		fncMsg("yesIngredient","출판서 서평을 입력해주세요");
		count++;
	}else {
		fncMsg("yesIngredient");
	}
	if(count>0) {
		return false;
	}
		
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
}); //btn_submit 끝 
	
$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
	});
	
}); //제이쿼리 마지막
</script>