<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="aladdinVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="alSeq" id="alSeq"/>
		<form:hidden path="alAtchFileId" id="alAtchFileId"/>
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
							<input type="text" name="alTitle" id="alTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${util:unEscape(aladdinVO.alTitle) }" />
						</td>
					</tr>
					
					<tr> 
						 <th scope="row"><strong class="th_tit ">카테고리</strong></th>
						<td>
									<form:select path="alCategory" id="alCategory" title="카테고리"   cssClass="w50p cursor" >  
										<form:option value=""					 			label="카테고리 선택 " selected="true" /> 
										<form:option value="인문/교양" 			label="인문/교양"/> 
										<form:option value="고전" 					label="고전"/> 
										<form:option value="과학/SF" 				label="과학/SF"/> 
										<form:option value="심리학" 				label="심리학"/> 
										<form:option value="문학" 					label="문학"/> 
									</form:select>
						</td>  
						
						<th scope="row" ><strong class="th_tit" >작가</strong></th>
							<td>
							<input type="text" name="alWriter" id="alWriter" class="text w100p"   maxlength="100"  placeholder="작가를 입력해주세요." value="${util:unEscape(aladdinVO.alWriter) }" />
							</td>
					</tr>
					
					
					<tr> 
						<th scope="row"><strong class="th_tit">출판사</strong></th>
						<td id="label" class="cursor">
									<label for="alPublishing_Minumsa ">			<form:radiobutton path="alPublishing" 	name="alPublishing" 	cssClass="radio cursor"  class="brandCheck" id="alPublishing_Minumsa" value="민음사" /> 민음사</label>
									<label for="alPublishing_opens">					<form:radiobutton path="alPublishing" 	name="alPublishing" 	cssClass="radio cursor"  class="brandCheck" id="alPublishing_opens" 		value="열린책들"/> 열린책들</label>
									<label for="alPublishing_neighborhood">	<form:radiobutton path="alPublishing"	name="alPublishing" 	cssClass="radio cursor"  class="brandCheck" id="alPublishing_neighborhood" value="문학동네"/> 문학동네 </label>
									<label for="alPublishing_classic"> 				<form:radiobutton path="alPublishing" 	name="alPublishing" 	cssClass="radio cursor"  class="brandCheck" id="alPublishing_classic" 		value="더클래식"/> 더클래식</label>
						</td>
						
						<th scope="row" ><strong class="th_tit" >출판일</strong></th>
							<td>
							<input type="text" name="alPublDt" id="alPublDt" class="date w50p "  placeholder="출판일을 선택해주세요." value="${util:unEscape(aladdinVO.alPublDt) }" />
							</td>
					</tr>
						
					<tr>
						 <th scope="row"><strong class="th_tit">결제수단</strong></th>
					 	<td cssClass="check_box w50p" >
								<input type="checkbox"  class="payCheck cursor" id="alPayment_1"  name="alPayment"  value="신용카드"  		${fn:indexOf(aladdinVO.alPayment,'신용카드') ne -1 ? 'checked' : '' } /><label for="alPayment_1">신용카드</label>
								<input type="checkbox"  class="payCheck cursor" id="alPayment_2"  name="alPayment"  value="카카오페이"  	${fn:indexOf(aladdinVO.alPayment,'카카오페이') ne -1  ? 'checked' : '' }/><label for="alPayment_2">카카오페이</label>
								<input type="checkbox"  class="payCheck cursor" id="alPayment_3"  name="alPayment"  value="네이버페이" 	${fn:indexOf(aladdinVO.alPayment,'네이버페이') ne -1  ? 'checked' : '' }/><label for="alPayment_3">네이버페이</label>
								<input type="checkbox"  class="payCheck cursor" id="alPayment_4"  name="alPayment"  value="페이코"  			${fn:indexOf(aladdinVO.alPayment,'페이코') ne -1  ? 'checked' : '' }/><label for="alPayment_4">페이코</label>
						</td> 
						<th scope="row" ><strong class="th_tit" >가격</strong></th>
							<td>
							<input type="text" name="alPrice" id="alPrice" class="numOnly w50p"   maxlength="20"  placeholder="가격을 입력해주세요." value="${util:unEscape(aladdinVO.alPrice) }" /> 원
							</td>
							
					</tr>	
						
					<tr> 
						<th scope="row" ><strong class="th_tit" >좋아요</strong></th>
							<td>
							<input type="number" min="0" name="alLike" id="alLike" class="numOnly w50p"    placeholder="카운트." value="${util:unEscape(aladdinVO.alLike) }" /> 개
							</td>
					<%--  Select : 별점 숫자로 수정할것 !    --%>
						 <th scope="row"><strong class="th_tit">별점</strong></th>
						<td>
									<form:select path="alStar" id="alStar" title="별점" cssClass="w50p cursor" >  
									<form:option value=""  label="별점 선택" selected="true" /> 
									<form:option value="1"  				label="★"/> 
									<form:option value="2" 				label="★★"/> 
									<form:option value="3" 				label="★★★"/> 
									<form:option value="4" 				label="★★★★"/> 
									<form:option value="5"		 		label="★★★★★"/> 
									</form:select>
						</td> 
						
					</tr>	
						
					<tr> 
						<th scope="row" ><strong class="th_tit" > 전자책유무 </strong></th>
							<td id="label" class="cursor">
									<label for="alEbookYn_Y">	 <form:radiobutton path="alEbookYn" 	name="alEbookYn" 	cssClass="radio cursor"  class="EbookCheck" id="alEbookYn_Y" 	 value="Y" /> 유</label>
									<label for="alEbookYn_N"> <form:radiobutton path="alEbookYn" 	name="alEbookYn" 	cssClass="radio cursor"  class="EbookCheck" id="alEbookYn_N"  value="N" /> 무</label>
							</td>
						
						<th scope="row" ><strong class="th_tit" >품절여부</strong></th>
							<td id="label" class="cursor">
									<label for="alSoldoutYn_Y">	<form:radiobutton path="alSoldoutYn" 	name="alSoldoutYn" 	cssClass="radio cursor"  class="SoldoutCheck" id="alSoldoutYn_Y"  value="Y" /> 여</label>
									<label for="alSoldoutYn_N">	<form:radiobutton path="alSoldoutYn" 	name="alSoldoutYn" 	cssClass="radio cursor"  class="SoldoutCheck" id="alSoldoutYn_N"  value="N" /> 부</label>
							</td>
					</tr>	
						
				
					<tr>
						<th scope="row"><strong class="th_tit">서적설명</strong></th>
						<td colspan="3">
							<textarea name="alCont" id="alCont" class="txt_area w_100p" >${util:unEscape(aladdinVO.alCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">출판사서평</strong></th>
						<td colspan="3">
							<textarea name="alReviewP" id="alReviewP" class="txt_area w_100p" maxlength="100" >${util:unEscape(aladdinVO.alReviewP)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">책표지</strong></th>
						<td colspan="3">
							<textarea name="alCover" id="alCover" class="txt_area w_100p" maxlength="100" >${util:unEscape(aladdinVO.alCover)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="alAtchFileIdFrame" id="alAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${aladdinVO.alAtchFileId }&fileCnt=5&atchFileIdNm=alAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
	    elPlaceHolder: "alCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});  // 에디터 끝 

	$("#btn_submit").on("click", function(){	
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
		 });
		
	$("#btn_returnView").click(function(){
		fncPageBoard('view','view.do');
		});
	
}); //제이쿼리 마지막
</script>