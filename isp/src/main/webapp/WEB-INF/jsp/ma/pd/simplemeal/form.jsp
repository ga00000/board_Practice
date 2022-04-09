<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="simplemealVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="smSeq" id="smSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="smAtchFileId" id="smAtchFileId"/>
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
							<input type="text" name="smTitle" id="smTitle" class="text w100p"   maxlength="20"   placeholder="제목을 입력해주세요." value="${util:unEscape(simplemealVO.smTitle) }" />
							<form:errors path="smTitle" cssClass="error" cssStyle="color:#ff0000" /> 
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit">카테고리</strong></th>
						<td>
									<form:select path="smCategory" id="smCategory" title="카테고리" cssClass="w50p" >  
									<form:option value="" label="카테고리 선택"/> 
									<form:option value="햄" label="햄"/> 
									<form:option value="치킨" label="치킨"/> 
									<form:option value="만두" label="만두"/> 
									<form:option value="피자" label="피자"/> 
									<form:option value="디저트" label="디저트"/> 
									</form:select>
						</td> 
						
						<%--  radio : 브랜드 path로 묶음 --%>
						<th scope="row"><strong class="th_tit">브랜드</strong></th>
						<td>
									<label for="smBrand_emart"><form:radiobutton path="smBrand" cssClass="radio" id="smBrand_emart" value="이마트몰" checked="true"/> 이마트몰</label>
									<label for="smBrand_traders"><form:radiobutton path="smBrand" cssClass="radio" id="smBrand_traders" value="트레이더스"/> 트레이더스</label>
									<label for="smBrand_ssg"><form:radiobutton path="smBrand" cssClass="radio" id="smBrand_ssg" value="SSG"/> SSG </label>
									<label for="smBrand_shinsegae"><form:radiobutton path="smBrand" cssClass="radio" id="smBrand_shinsegae" value="신세계"/> 신세계</label>
						</td>
					</tr>
					
					<tr> 
					<%--  Select : 카테고리  / option은 컬렉션외 값 사용   --%>
						 <th scope="row"><strong class="th_tit">별점</strong></th>
						<td>
									<form:select path="smStar" id="smStar" title="별점" cssClass="w50p" required="true">  
									<form:option value="" label="별점 선택"/> 
									<form:option value="★"  label="★"/> 
									<form:option value="★★" label="★★"/> 
									<form:option value="★★★" label="★★★"/> 
									<form:option value="★★★★" label="★★★★"/> 
									<form:option value="★★★★★" label="★★★★★"/> 
									</form:select>
						</td> 
					<%--  Checkbox : 결제수단    --%>
						 <th scope="row"><strong class="th_tit">결제수단</strong></th>
						<td cssClass="check_box w50p" >
									<form:checkbox path="smPayment"  value="신용카드" label="신용카드"/> 
									<form:checkbox path="smPayment"  value="카카오페이" label="카카오페이"/> 
									<form:checkbox path="smPayment"  value="네이버페이"  label="네이버페이"/> 
									<form:checkbox path="smPayment"  value="페이코"  label="페이코"/> 
						</td> 	
						
					</tr>
					
				
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<textarea name="smCont" id="smCont" class="txt_area w_100p" maxlength="4294967295">${util:unEscape(simplemealVO.smCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="smAtchFileIdFrame" id="smAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${simplemealVO.smAtchFileId }&fileCnt=5&atchFileIdNm=smAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
	    elPlaceHolder: "smCont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
	$("#btn_submit").bind("click", function(){
		if($("#smTitle").val() == "" || $("#smTitle").val() == null) {
			alert("제목을 입력해주세요");
			$("#smTitle").focus();
			return false;
		}
			oEditors.getById["smCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
			
		if($("#smCont").val()=='<p>&nbsp;</p>') {
			alert("내용을 입력해주세요");
			oEditors.getById["smCont"].exec("FOCUS"); /* 에디터 */
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