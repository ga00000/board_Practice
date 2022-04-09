<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="minumsapVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="miSeq" id="miSeq"/>
		<form:hidden path="miAtchFileId" id="miAtchFileId"/>
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
							<input type="text" name="miTitle" id="miTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${util:unEscape(minumsapVO.miTitle) }" />
								
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit ">카테고리</strong></th>
						<td>
									<form:select path="miCategory" id="miCategory" title="카테고리"   cssClass="w50p cursor" >  
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
									<label for="miBrand_minumsap">	<form:radiobutton path="miBrand" 	name="miBrand" 	cssClass="radio cursor"  class="brandCheck" id="miBrand_minumsap" value="민음사" /> 민음사</label>
									<label for="miBrand_golden">  	<form:radiobutton path="miBrand" 	name="miBrand" 	cssClass="radio cursor"  class="brandCheck" id="miBrand_golden" value="황금가지"/> 황금가지</label>
									<label for="miBrand_science">	<form:radiobutton path="miBrand"	name="miBrand" 	cssClass="radio cursor"   class="brandCheck" id="miBrand_science" value="사이언스북스"/> 사이언스북스 </label>
									<label for="miBrand_person">	<form:radiobutton path="miBrand" 	name="miBrand" 	cssClass="radio cursor"  class="brandCheck" id="miBrand_person" value="민음인"/> 민음인</label>
						</td> 
					</tr>
					
					<tr> 
					<%--  Select : 별점 숫자로 수정할것 !    --%>
						 <th scope="row"><strong class="th_tit">별점</strong></th>
						<td>
								<select name="miStar" id="miStar" value=" ${minumsapVO.miStar}" title="별점" cssClass="w50p cursor" >  
									<option value=""  label="별점 선택" selected="true" /> 
									<option value="1"  label="★" 		${minumsapVO.miStar eq '1' ? 'selected="selected"' : ''}> </option> 
									<option value="2"  label="★★" 		${minumsapVO.miStar eq '2' ? 'selected="selected"' : ''}> </option> 
									<option value="3"  label="★★★" 		${minumsapVO.miStar eq '3' ? 'selected="selected"' : ''}> </option> 
									<option value="4"  label="★★★★" 	${minumsapVO.miStar eq '4' ? 'selected="selected"' : ''}> </option> 
									<option value="5"  label="★★★★★" 	${minumsapVO.miStar eq '5' ? 'selected="selected"' : ''}> </option> 
								</select>
						</td> 
					<%--  Checkbox : 결제수단    --%>
						 <th scope="row"><strong class="th_tit">결제수단</strong></th>
						<td cssClass="check_box w50p" >
								<input type="checkbox"  class="payCheck cursor" id="miPayment_1"  name="miPayment"  value="신용카드"  ${fn:indexOf(minumsapVO.miPayment,'신용카드') ne -1 ? 'checked' : '' } /><label for="miPayment_1">신용카드</label>
								<input type="checkbox"  class="payCheck cursor" id="miPayment_2"  name="miPayment"  value="카카오페이"  ${fn:indexOf(minumsapVO.miPayment,'카카오페이') ne -1  ? 'checked' : '' }/><label for="miPayment_2">카카오페이</label>
								<input type="checkbox"  class="payCheck cursor" id="miPayment_3"  name="miPayment"  value="네이버페이"  ${fn:indexOf(minumsapVO.miPayment,'네이버페이') ne -1  ? 'checked' : '' }/><label for="miPayment_3">네이버페이</label>
								<input type="checkbox"  class="payCheck cursor" id="miPayment_4"  name="miPayment"  value="페이코"  ${fn:indexOf(minumsapVO.miPayment,'페이코') ne -1  ? 'checked' : '' }/><label for="miPayment_4">페이코</label>
						</td> 
					</tr>
					
					<tr>
						<th scope="row" ><strong class="th_tit" >가격</strong></th>
						<td colspan="3">
							<input type="text" name="miPrice" id="miPrice" class="numOnly w20p"   onFocus="this.value=''; return true;" maxlength="20"  placeholder="가격을 입력해주세요." value="${util:unEscape(minumsapVO.miPrice) }" /> 원
						</td>
					</tr>
				
					<tr>
						<th scope="row"><strong class="th_tit">책 소개</strong></th>
						<td colspan="3">
							<textarea name="miCont" id="miCont" class="txt_area w_100p" >${util:unEscape(minumsapVO.miCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">출판사 서평</strong></th>
						<td colspan="3">
							<textarea name="miIngredient" id="miIngredient" class="txt_area w_100p" maxlength="190" >${util:unEscape(minumsapVO.miIngredient)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="miAtchFileIdFrame" id="miAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${minumsapVO.miAtchFileId }&fileCnt=5&atchFileIdNm=miAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
	    elPlaceHolder: "miCont",
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
		if($("#miTitle").val() == null || $("#miTitle").val() == "") {  
			fncMsg("miTitle","책 이름을 입력해주세요");
			count++;
		}else {
			fncMsg("miTitle");
		}
		
		if($("#miCategory").val() == "") {  
			fncMsg("miCategory","카테고리를 선택해주세요");
			count++;
		}else {
			fncMsg("miCategory");
		}
		
		if($("#miStar").val() == "") {  
			fncMsg("miStar","별점을 선택해주세요");
			count++;
		}else {
			fncMsg("miStar");
		}
		
		if($("[id^='miBrand_']:checked").length == 0) {
			fncMsg("miBrand_person"," 출판사를 체크해주세요");
			count++;
		}else {
			fncMsg("miBrand_person");
		} 	
	 
		
		if($("[id^='miPayment_']:checked").length == 0) {
			fncMsg("miPayment_1","결제수단을 하나이상 체크해주세요");
			count++;
		}else {
			fncMsg("miPayment_1");
		}  
		
		if($("#miPrice").val() == 0) {  
			fncMsg("miPrice","가격을 입력해주세요");
			count++;
		}else {
			fncMsg("miPrice");
		}
	
		oEditors.getById["miCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		if($("#miCont").val()=='<p>&nbsp;</p>') {
			fncMsg("miCont", "책 소개를 입력해주세요");
			count++;
		}else {
			fncMsg("miCont");
		} 
		
		if($("#miIngredient").val() == null || $("#miIngredient").val() == "") {  
			fncMsg("miIngredient","출판서 서평을 입력해주세요");
			count++;
		}else {
			fncMsg("miIngredient");
		}
		
		if(count>0) {
			return false;
		} // 유효성검사 all check 끝 
			
			fncPageBoard('submit','${searchVO.procType}Proc.do');
			return false;
	}); //btn_submit 끝 
	
	$("#btn_returnView").click(function(){
		fncPageBoard('view','view.do');
		});
	
}); //제이쿼리 마지막
</script>