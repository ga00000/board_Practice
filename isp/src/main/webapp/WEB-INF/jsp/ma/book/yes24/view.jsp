<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>

<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="yesSeq" id="yesSeq"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
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
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${yes24VO.yesRgstId }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${yes24VO.yesRgstDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>카테고리</strong></th>
						<td>
							${yes24VO.yesCategory }
						</td>
						<th scope="row"><strong>출판사</strong></th>
						<td>
							${yes24VO.yesBrand }
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>별점</strong></th>
						<td>
							${yes24VO.yesStar }
						</td>
						<th scope="row"><strong>결제수단</strong></th>
						<td>
							${yes24VO.yesPayment }
						</td>
					
					</tr>
					
					<tr>
						<th scope="row"><strong>책이름</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(yes24VO.yesTitle)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>가격</strong></th>
						<td colspan="3">
							<div class="number">
								<fmt:formatNumber value="${yes24VO.yesPrice}" pattern="#,###" /> 원 
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>책 소개</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(yes24VO.yesCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>출판사 서평</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(yes24VO.yesIngredient)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="yesAtchFileIdFrame" id="yesAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${yes24VO.yesAtchFileId }&fileCnt=5&atchFileIdNm=yesAtchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="javascript:void(0);" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
	
</div>
<script type="text/javascript">
</script>