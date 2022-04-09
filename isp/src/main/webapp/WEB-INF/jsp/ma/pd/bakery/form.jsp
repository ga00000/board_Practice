<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="bakeryVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="bkSeq" id="bkSeq"/>
		<form:hidden path="bkAtchFileId" id="bkAtchFileId"/>
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
							<input type="text" name="bkTitle" id="bkTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${util:unEscape(bakeryVO.bkTitle) }" />
								
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit">카테고리</strong></th>
						<td>
									<form:select path="bkCategory" id="bkCategory" title="카테고리"   cssClass="w50p" >  
										<form:option value=""					 	label="카테고리 선택 " selected="true" /> 
										<form:option value="베이커리" 	label="베이커리"/> 
										<form:option value="디저트" 		label="디저트"/> 
										<form:option value="케이크" 		label="케이크"/> 
										<form:option value="샐러드" 		label="샐러드"/> 
										<form:option value="잼" 				label="잼"/> 
									</form:select>
						</td>  
						
						<%--  radio : 브랜드 path로 묶음 --%>
						<th scope="row"><strong class="th_tit">브랜드</strong></th>
						<td>
									<label for="bkBrand_emart">		<form:radiobutton path="bkBrand" 		cssClass="radio"  id="bkBrand_emart" value="이마트몰" checked="true"/> 이마트몰</label>
									<label for="bkBrand_traders">		<form:radiobutton path="bkBrand" 		cssClass="radio"  id="bkBrand_traders" value="트레이더스"/> 트레이더스</label>
									<label for="bkBrand_ssg">				<form:radiobutton path="bkBrand"		cssClass="radio"  id="bkBrand_ssg" value="SSG"/> SSG </label>
									<label for="bkBrand_shinsegae"> <form:radiobutton path="bkBrand" 		cssClass="radio"  id="bkBrand_shinsegae" value="신세계"/> 신세계</label>
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit">별점</strong></th>
						<td>
									<form:select path="bkStar" id="bkStar" title="별점" cssClass="w50p" >  
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
								<input type="checkbox"  class="payCheck" id="bkPayment_1"  name="bkPayment"  value="신용카드"  ${fn:indexOf(bakeryVO.bkPayment,'신용카드') ne -1 ? 'checked' : '' } /><label for="bkPayment_1">신용카드</label>
								<input type="checkbox"  class="payCheck" id="bkPayment_2"  name="bkPayment"  value="카카오페이"  ${fn:indexOf(bakeryVO.bkPayment,'카카오페이') ne -1  ? 'checked' : '' }/><label for="bkPayment_2">카카오페이</label>
								<input type="checkbox"  class="payCheck" id="bkPayment_3"  name="bkPayment"  value="네이버페이"  ${fn:indexOf(bakeryVO.bkPayment,'네이버페이') ne -1  ? 'checked' : '' }/><label for="bkPayment_3">네이버페이</label>
								<input type="checkbox"  class="payCheck" id="bkPayment_4"  name="bkPayment"  value="페이코"  ${fn:indexOf(bakeryVO.bkPayment,'페이코') ne -1  ? 'checked' : '' }/><label for="bkPayment_4">페이코</label>
						</td> 
					</tr>
					
					<tr>
						<th scope="row" ><strong class="th_tit" >가격</strong></th>
						<td colspan="3">
							<input type="text" name="bkPrice" id="bkPrice" class="numOnly w30p"   onFocus="this.value=''; return true;" maxlength="20"  placeholder="가격을 입력해주세요." value="${util:unEscape(bakeryVO.bkPrice) }" /> 원
						</td>
					</tr>
				
					<tr>
						<th scope="row"><strong class="th_tit">상품소개</strong></th>
						<td colspan="3">
							<textarea name="bkCont" id="bkCont" class="txt_area w_100p" >${util:unEscape(bakeryVO.bkCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">제품성분</strong></th>
						<td colspan="3">
							<textarea name="bkIngredient" id="bkIngredient" class="txt_area w_100p" maxlength="100" >${util:unEscape(bakeryVO.bkIngredient)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="bkAtchFileIdFrame" id="bkAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${simplemealVO.bkAtchFileId }&fileCnt=5&atchFileIdNm=bkAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
	    elPlaceHolder: "bkCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	
	<%--	유효성검사 메소드 만들어서 코드 줄여보기!!  --%>
	$("#btn_submit").on("click", function(){
		
		if($("#bkTitle").val() == null || $("#bkTitle").val() == "") {
			wrestMsg = "제목을 입력해주세요";
			var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
			$("#bkTitle").parent().append(msgHtml);
			$("#bkTitle").focus();
			return false;
		}
		<%--
		if($("input:checkbox[name='bkPayment']").prop("checked",false)) {
			wrestMsg = "결제수단을 선택해주세요";
			var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
			$(".payCheck").parent().append(msgHtml);
			$(".payCheck").focus();
			return false;
		}   --%>
		
		if($("#bkPrice").val() == 0) {
			wrestMsg = "가격을 입력해주세요";
			var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
			$("#bkPrice").parent().append(msgHtml);
			$("#bkPrice").focus();
			return false;
		}

		
		oEditors.getById["bkCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		if($("#bkCont").val()=='<p>&nbsp;</p>') {
			alert("상품소개를 입력해주세요");
			oEditors.getById["bkCont"].exec("FOCUS"); /* 에디터 */
			return false;
		}
			
		if($("#bkCategory").val() == "" ) {
			alert("카테고리를 선택해주세요");
			$("#bkCategory").focus();
			return false;
		}	
		
		if($("#bkStar").val() == "" ) {
			alert("별점을 선택해주세요");
			$("#bkStar").focus();
			return false;
		}	
		
			fncPageBoard('submit','${searchVO.procType}Proc.do');
			return false;
	}); //btn_submit
		
	$("#btn_returnView").click(function(){
		fncPageBoard('view','view.do');
		});
	
	}); //제이쿼리 마지막

</script>