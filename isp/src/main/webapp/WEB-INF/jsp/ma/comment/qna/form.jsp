<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="secretVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seSeq" id="seSeq"/>
		<form:hidden path="seAtchFileId" id="seAtchFileId"/>
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
							<input type="text" name="seTitle" id="seTitle" class="text w100p"   maxlength="100"  placeholder="제목을 입력해주세요." value="${secretVO.seTitle}" />
								
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong class="th_tit" > 비밀글 여부 </strong></th>
						<td class="cursor">
							<input type="radio" name="seSecretYn" id="seSecret_Y" class="radio cursor"  value="Y"  ${secretVO.seSecretYn eq 'Y' ? 'checked' : '' } onclick="pwCheck();"/>
							<label for ="seSecretY" >여</label>
							<input type="radio" name="seSecretYn" id="seSecret_N" class="radio cursor" value="N" ${secretVO.seSecretYn eq 'N'  ? 'checked' : '' } ${empty secretVO.seSecretYn ? 'checked="checked"' : '' }  onclick="pwCheckOff();"/>
							<label for ="seSecretN">부</label>
						</td>
						<th scope="row" ><strong class="th_tit" > 카테고리 </strong></th>
						<td class="cursor">
							<select name ="seCategory" id = "seCategory" name = "seCategory" class=" cursor" style="width:100%;">
								<option value =""  selected >카테고리선택</option> 
								<option value ="주문문의" >주문문의</option> 
								<option value ="배송문의">배송문의</option> 
								<option value ="결제문의">결제문의</option> 
							</select>
						</td>
					</tr>
					
					<tr style="display:none" id="inputPassword">
						<th scope="row" ><strong class="th_tit" > 비밀번호 입력 </strong></th>
						<td>
							<input type="password" name="seSecretPw" id="seSecretPw" class="cursor"  maxlength="5" style="width:100%;" autocomplete="off"/>
								
						</td><th scope="row" ><strong class="th_tit" > 비밀번호확인 </strong></th>
						<td>
							<input type="password" name="seSecretPwCheck" id="seSecretPwCheck" class="cursor"  maxlength="5" style="width:100%;" />
								
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong class="th_tit">게시글 내용</strong></th>
						<td colspan="3">
							<textarea name="seCont" id="seCont" class="txt_area w_100p" maxlength="200" >${util:unEscape(secretVO.seCont)}</textarea>
						</td> 
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="seAtchFileIdFrame" id="seAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${secretVO.seAtchFileId}&fileCnt=5&atchFileIdNm=seAtchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
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
	    elPlaceHolder: "seCont",
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
		if($("#seTitle").val() == "" || $("#seTitle").val() == null) {
			fncMsg("seTitle","제목을 입력해주세요.");
			$("#seTitle").focus();
			count++;
		}
		// 내용
		oEditors.getById["seCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
		if($("#seCont").val() == '<p>&nbsp;</p>') {
			fncMsg("seCont","내용을 입력해주세요.");
			count++;
		}	
		// 카테고리
		if($("#seCategory").val()==""){
			fncMsg("seCategory", "카테고리를 선택해주세요.")
			count++;
		} 
		// 비밀글 - 여
		if($("input:radio[id='seSecret_Y']").is(":checked")==true){
			// 비밀번호 입력 null체크
			if($("#seSecretPw").val() == "" || $("#seSecretPw").val() == null) {
				fncMsg("seSecretPw","비밀번호를 입력해주세요.");
				$("#seSecretPw").focus();
				count++;
			}
			// 비밀번호 확인 null 체크
			if($("#seSecretPwCheck").val() == "" || $("#seSecretPwCheck").val() == null) {
				fncMsg("seSecretPwCheck","비밀번호를 한번 더 입력해주세요.");
				$("#seSecretPwCheck").focus();
				count++;
			}
			
			// 비밀번호 (입력, 확인) 값 일치 확인 
			if($("#seSecretPw").val()==$("#seSecretPwCheck").val()){
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#seSecretPw").focus();
				return false;
			}
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
	
	// 비밀번호 입력창 display
	pwCheck = function(){
		$("#inputPassword").show();
		
	}
	pwCheckOff = function(){
		$("#inputPassword").hide();
		
	}


});


	
	
</script>