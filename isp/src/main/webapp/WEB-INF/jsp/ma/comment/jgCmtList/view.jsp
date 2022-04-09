<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<input type="hidden" name="jgSeq" id="jgSeq" value="${jgCmtListVO.jgSeq }"/>
		<input type="hidden" name="jgGroupSeq" id="jgGroupSeq" value="${jgCmtListVO.jgGroupSeq }"/>
		<input type="hidden" id="jgAtchFileId" name="jgAtchFileId" value="${jgCmtListVO.jgAtchFileId }"/>
		<input type="hidden" id="jgReAtchFileId" name="jgReAtchFileId" value="${jgCmtListVO.jgReAtchFileId }"/>
		
		
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
				
					<tr>
						<th scope="row"><strong >등록자</strong></th>
						<td>
							${jgCmtListVO.jgRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${jgCmtListVO.jgRgstDt }</td>
					</tr> 
					
					<tr>
						<th scope="row"><strong class="th_tit">게시글 제목</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${jgCmtListVO.jgTitle}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong class="th_tit">게시글 내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${jgCmtListVO.jgCont}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row" ><strong class=>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="jgAtchFileIdFrame" id="jgAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${jgCmtListVO.jgAtchFileId }&fileCnt=5&atchFileIdNm=jgAtchFileId&updateType=view" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div> 
		
		<div class="btn_area">
			<a href="javascript:void(0);" id="btn_update" 	class="btn btn_mdl btn_rewrite" >수정</a> 
			<a href="javascript:void(0);" id="btn_del" 		class="btn btn_mdl btn_del" >삭제</a>
			<a href="javascript:void(0);" id="btn_list"		class="btn btn_mdl btn_list" >목록</a>
		</div>	
<!-- 게시판 끝 ----------------------------------------------------------->

<!-- 댓글 시작 ----------------------------------------------------------->
	<!-- insertComments : 댓글 입력 -->
		<div class="tbl_wrap" >
		<h3 class ="tit_page"> 댓글 입력 </h3>
				<table class="tbl_row_type01" > 
					<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:80%;">
					</colgroup> 
					
					<tbody>
						<tr>
							<th scope="row" ><strong class="th_tit" >댓글</strong></th>
							<td colspan="3" id="td_reply">
								<textarea name="jgCont" id="jgCont" class="text w100p"   maxlength="200" rows="4" placeholder="댓글을 입력해주세요." ></textarea>
								<input type = "hidden" id ="hiddenJgCont" name="hiddenJgCont"  > 
							</td>
						</tr>
						
						<tr>
							<th scope="row"><strong >첨부파일</strong></th>
							<td colspan="3" id ="td_atchFile">
								<iframe name="jgReAtchFileIdFrame" id="jgReAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=upload" style="width: 100%;" height="110"  frameborder="0" title="파일 업로드 폼"></iframe>
							</td>
						</tr> 
						 
					</tbody>
				</table>
							<div class="btn_area" >
								<a href="javascript:void(0);" id="btn_submit" class="btn btn_sml02 btn_save" onclick="replyInsert();">댓글등록</a>
							</div>  
			</div> 
		 
	<%--  댓글 입력 끝 --%>
	
	<%-- selectComments : 댓글 리스트 조회 --%>
		<c:choose>
			<c:when test="${fn:length(cmtList) gt 0}">
				<c:forEach var="result" items="${cmtList}"  varStatus="status">
					<div class="tbl_wrap"  >
						<table class="tbl_row_type01">
							<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr> 
									<th scope="row" rowspan="4" ><strong>${status.count}</strong></th>
								</tr>
								<tr>
									<th scope="row"><strong>등록자</strong></th>
									<td>
										${result.jgRgstId}
									</td>
				                    <th scope="row"><strong>등록일</strong></th>
									<td>${result.jgRgstDt}</td>
								</tr>
								<tr>
									<th scope="row"><strong>댓글 내용</strong></th>
									<td colspan="3" id="td_reply_${result.jgSeq}" class="text w100p" >${result.jgCont}</td>
								</tr>
								<tr>
									<th scope="row"><strong>첨부파일</strong></th>
									<td colspan="3" id ="td_atchFile_${result.jgSeq}">
										<iframe name="jgReAtchFileId" id="jgReAtchFileId" src="/atch/fileUpload.do?atchFileId=${result.jgReAtchFileId}&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=view" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
									</td>
									
								</tr>
							</tbody>
						</table>
					</div> 
					<div class="btn_area">
						<a href="javascript:void(0);" id="btn_Re_update_${result.jgSeq}" class="btn btn_sml02 btn_rewrite" 	onclick="replyUpdate(${result.jgSeq},'${result.jgReAtchFileId}');"> 댓글수정</a> 
						<a href="javascript:void(0);" id="btn_Re_submit_${result.jgSeq}" class="btn btn_sml02 btn_save"		onclick="replyUpdateComplete(${result.jgSeq});" style="display:none">수정완료</a>
						<a href="javascript:void(0);" id="btn_Re_cancel_${result.jgSeq}" class="btn btn_sml02 btn_cancel"	onclick="replyCancel(${result.jgSeq});" style="display:none">수정취소</a>
						<a href="javascript:void(0);" id="btn_Re_del_${result.jgSeq}" 	 class="btn btn_sml02 btn_del" 		onclick="replyDelete(${result.jgSeq});" > 댓글삭제</a>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
			</c:otherwise> 
	<%--  댓글 리스트 조회 끝  --%>
		</c:choose>
	</form:form>
</div>

<script type="text/javascript">


$(document).ready(function(){	
	//유효성 검사 함수
	function fncMsg(id, wrestMsg){ 
		var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
		$("#"+id).parent().children('strong').remove();
		if(wrestMsg != null && wrestMsg != ""){
			$("#"+id).parent().append(msgHtml);
			$("#"+id).focus();
		}
	}
	// 댓글 등록 
	$("#btn_submit").on("click", function(){
		if($("#jgCont").val() == null || $("#jgCont").val() == "") {  
			fncMsg("jgCont","댓글을 입력해주세요");
			return false;
		}
		if(!confirm("댓글을 등록하시겠습니까?")){
			return false;
		}
		fncPageBoard('update','insertReProc.do');  // controller 로 요청 
		return false;
	});
	
	// 댓글 수정 
	var oneCount = true; // 댓글수정 1개만 실행 
	replyUpdate = function(btnSeq,btnAtchId){ 
		if(oneCount==false){    
			alert('수정중인 댓글이 있습니다.');    
		}else{ 
			if(!confirm("댓글을 수정하시겠습니까?")){
			} 
			if($("#jgCont").val() != null && $("#jgCont").val() != "") {  // 입력창에 글 있으면 한번 더 묻기 
				if(!confirm("입력중인 댓글이 있습니다. 수정하시겠습니까?")){
				} 
			}
			$("#jgCont").val(""); 
			$("#jgCont").attr("readonly",true);  // 댓글 수정 도중 새 댓글 입력 막기
				
			var replyCont = $("#td_reply_"+btnSeq).html(); // 댓글 내용 가져오기 
			var	replyHtml = '';
				replyHtml +='<textarea id="jgCont_'+btnSeq+'" class="text w100p" maxlength="200" rows="4">'+replyCont+'</textarea>'; 
			$("#td_reply_"+btnSeq).html(replyHtml); // 해당 댓글 입력창 변환 + 댓글 내용 입력
			
			
			var replyAtchFileHtml='';
				replyAtchFileHtml +='<iframe name="jgReAtchFileIdFrame" id="jgReAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId='+btnAtchId+'&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" ></iframe>';
			$("#td_atchFile_"+btnSeq).html(replyAtchFileHtml); // 해당 댓글 첨부파일 수정 
			
			$("#btn_Re_update_"+btnSeq).hide(); // 댓글수정 hide
			$("#btn_Re_del_"+btnSeq).hide();    // 댓글삭제 hide
			$("#btn_Re_cancel_"+btnSeq).show(); // 수정취소 show
			$("#btn_Re_submit_"+btnSeq).show(); // 수정완료 show	
			oneCount=false;
		}
	}
	
	// 댓글 수정완료 
	replyUpdateComplete = function (btnSeq){
		$("#jgCont").val($("#td_reply_re").val());  // Cont에 댓글 내용 담기
		fncPageBoard('update','updateReProc.do');
		return false;
	}	
	
	// 댓글 수정취소
	replyCancel = function(btnSeq){
		if($("#jgCont").val() == null || $("#jgCont").val() == "") {  
			if(!confirm("수정 중인 댓글이 있습니다. 수정 취소 하시겠습니까? ")){
				return false;
			}
		fncPageBoard('view','view.do');
		return false;
	}
	}
	// 댓글 삭제
	replyDelete = function(btnSeq){  // 해당 댓글의 seq 가져오기
		fncPageBoard('del','deleteReProc.do');  // 삭제 쿼리 실행 
		return false;
	}

});  // document.ready마지막


</script>
	
	
