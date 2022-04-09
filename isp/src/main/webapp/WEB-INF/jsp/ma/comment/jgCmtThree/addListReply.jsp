<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
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
								<th scope="row" ><strong  class="th_tit">댓글</strong></th>
								<td colspan="3" id="td_reply">
									<textarea name="jgReCont" id="jgReCont" class="text w100p"   maxlength="200" rows="3" placeholder="댓글을 입력해주세요." ></textarea>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><strong >첨부파일</strong></th>
								<td colspan="3" id ="td_atchFile">
									<iframe name="jgReAtchFileIdFrame" id="jgReAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=5&atchFileIdNm=jgReAtchFileId&updateType=upload" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
								</td>
							</tr> 
						</tbody>
					</table>
<!-- 					댓글유무 구분값 도전  -->
<%-- 					<input type = "hidden"  id ="jgReUseYn" name = "jgReUseYn" value = "${jgCmtTwoVO.jgReUseYn}" }" >  --%>
					<div class="btn_area" >
						<a href="javascript:void(0);" id="btn_submit" class="btn btn_sml02 btn_save" onclick="replyInsert();">댓글등록</a>
					</div>  
					
				</div> 
<%--  댓글 입력 끝 --%>
		
<%-- selectComments : 댓글 1개 조회 --%>
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
										${result.jgReRgstId}
									</td>
				                    <th scope="row"><strong>등록일</strong></th>
									<td>${result.jgReRgstDt}</td>
								</tr>
								<tr>
									<th scope="row"><strong>댓글 내용</strong></th>
									<td colspan="3" id="td_reply_${result.jgReSeq}" class="text w100p" >${result.jgReCont}</td>
								</tr>
								<tr>
									<th scope="row"><strong>첨부파일</strong></th>
									<td colspan="3" id ="td_atchFile_${result.jgReSeq}">
										<iframe name="jgReAtchFileId_${result.jgReSeq}Frame" id="jgReAtchFileId_${result.jgReSeq}Frame" src="/atch/fileUpload.do?atchFileId=${result.jgReAtchFileId}&fileCnt=5&atchFileIdNm=jgReAtchFileId_${result.jgReSeq}&updateType=view" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
									</td>
									
								</tr>
							</tbody>
						</table>
					</div> 
					<div class="btn_area">
						<a href="javascript:void(0);" id="btn_Re_update_${result.jgReSeq}" class="btn btn_sml02 btn_rewrite" 	onclick="replyUpdate('${result.jgReCont}',${result.jgReSeq},'${result.jgReAtchFileId}');"> 댓글수정</a> 
						<a href="javascript:void(0);" id="btn_Re_submit_${result.jgReSeq}" class="btn btn_sml02 btn_save"		onclick="replyUpdateComplete(${result.jgReSeq},${result.jgSeq},'${result.jgReAtchFileId}');" style="display:none">수정완료</a>
						<a href="javascript:void(0);" id="btn_Re_cancel_${result.jgReSeq}" class="btn btn_sml02 btn_cancel"		onclick="replyCancel(${result.jgReSeq});" style="display:none">수정취소</a>
						<a href="javascript:void(0);" id="btn_Re_del_${result.jgReSeq}"    class="btn btn_sml02 btn_del" 		onclick="replyDelete(${result.jgReSeq},${result.jgSeq});" > 댓글삭제</a>
					</div>
				</c:forEach>
				</c:when>
		<%--  댓글 리스트 조회 끝  --%>
		</c:choose>
		
		

<script type="text/javascript">

//유효성 검사 함수
function fncMsg(id, wrestMsg){ 
	var msgHtml = '<strong><font color="red">&nbsp;'+wrestMsg+'</font></strong>';
	$("#"+id).parent().children('strong').remove();
	if(wrestMsg != null && wrestMsg != ""){
		$("#"+id).parent().append(msgHtml);
		$("#"+id).focus();
	}
}
var oneCount = true; // 댓글수정 1개만 실행 
$(document).ready(function(){	
	// 댓글 등록 
	replyInsert = function(){
		if($("#jgReCont").val() == null || $("#jgReCont").val() == "") {  
			fncMsg("jgReCont","댓글을 입력해주세요");
			if(oneCount==false){    
				$("#jgReCont").val('');
				fncMsg("jgReCont","수정 중인 댓글을 수정완료하거나, 수정취소해주세요.");
			}
		}else{
			if(!confirm("댓글을 등록하시겠습니까?")){
				return false;
			} 
			 $.ajax({  
				 method: "POST", 
		 		 url: "insertReProc.do", 
		 		 data : $("#defaultFrm").serialize(),  // 쿼리스트링 형식 
		 		 dataType: "html", 
		 		 success: function(data) {
		 			alert("댓글이 등록되었습니다.");
		 			$(".replyInput").html(data);
		 		 }
			 }) 
		}
	 };
	
	
	// 댓글 수정 
	
	replyUpdate = function(btnReCont,btnReSeq,btnAtchId){ 
		if(oneCount==false){    
			alert('수정중인 댓글이 있습니다.');    
		}else{
			if(!confirm("댓글을 수정하시겠습니까?")){
			} 
			if($("#jgReCont").val() != null && $("#jgReCont").val() != "") {  // 입력창에 글 있으면 한번 더 묻기 
				if(!confirm("입력중인 댓글이 있습니다. 수정하시겠습니까?")){
					return false;
				} 
			}
			$("#jgReCont").val(""); 
			$("#jgReCont").attr("readonly",true);  // 댓글 수정 도중 새 댓글 입력 막기
			
			var	replyHtml = ' ';
				replyHtml +='<textarea id="jgReCont'+btnReSeq+'" name="jgReCont" class="text w100p" maxlength="200" rows="4">'+btnReCont+'</textarea>'; 
			$("#td_reply_"+btnReSeq).html(replyHtml); // 해당 댓글 입력창 변환 + 댓글 내용 입력
				
			var replyAtchFileHtml='';
				replyAtchFileHtml +='<iframe name="jgReAtchFileId_'+btnReSeq+'Frame" id="jgReAtchFileId_'+btnReSeq+'Frame" src="/atch/fileUpload.do?atchFileId='+btnAtchId+'&fileCnt=5&atchFileIdNm=jgReAtchFileId_'+btnReSeq+'Frame&updateType=upload" style="width: 100%;" frameborder="0" ></iframe>';
			$("#td_atchFile_"+btnReSeq).html(replyAtchFileHtml); 
			
			$("#btn_Re_update_"+btnReSeq).hide(); // 댓글수정 hide
			$("#btn_Re_del_"+btnReSeq).hide();    // 댓글삭제 hide
			$("#btn_Re_cancel_"+btnReSeq).show(); // 수정취소 show    
			$("#btn_Re_submit_"+btnReSeq).show(); // 수정완료 show	
			oneCount=false;
		}
	}
	
	// 댓글 수정완료   
	replyUpdateComplete = function (btnReSeq,btnSeq,btnAtchId){
		if(!confirm("댓글을 수정하시겠습니까?")){
		}
		console.log(btnAtchId);
		var ReCont = $("#jgReCont").val($("#jgReCont"+btnReSeq).val()); 
		 $.ajax({  
			 method: "POST",  
	 		 url: "updateReProc.do",  
	 		 
	 		 data : {"jgReSeq":btnReSeq,"jgReCont":$("#jgReCont").val(),"jgSeq":btnSeq,"jgReAtchFileId":btnAtchId },  // 쿼리스트링 형식 
	 		 dataType: "html", 
	 		 success: function(data) {
	 			 alert("댓글이 수정되었습니다.");
	 			$(".replyInput").html(data);
	 		 }
		 })  
	};
	
	// 댓글 수정취소
	replyCancel = function(){
		if($("#jgReCont").val() == null || $("#jgReCont").val() == "") {  
			if(!confirm("수정 중인 댓글이 있습니다. 수정 취소 하시겠습니까? ")){
				return false;
			}
		$.ajax({  
			 method: "POST",  
	 		 url: "updateReProc.do",  
	 		 data : $("#defaultFrm").serialize(),  // 쿼리스트링 형식 
	 		 dataType: "html", 
	 		 success: function(data) {
	 			$(".replyInput").html(data);
	 		 }
		 }) 
		}
	}
	
	// 댓글 삭제
	replyDelete = function(btnReSeq,Seq){  
		if(!confirm("댓글을 삭제하시겠습니까?")){
		}
		 $.ajax({  
			 method: "POST",  
	 		 url: "deleteReProc.do",  
	 		 data : {"jgReSeq":btnReSeq, "jgSeq":Seq},  // json 키:값
	 		 dataType: "html", 
	 		 success: function(data) {
	 			alert("댓글이 삭제되었습니다.");
	 			$(".replyInput").html(data);
	 		 }
		 })  
	}
	

});  // document.ready마지막

</script>
	
