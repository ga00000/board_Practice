package com.open.ma.junggon;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.junggon.service.JgCmtVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class JgCmtController {  

	@Resource(name = "cmmnService")  
    protected CmmnService cmmnService; 
	
	@Resource(name = "FileMngService") 
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties") 
	Properties fileUploadProperties;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView; 
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "JgCmt"; 

    /** folderPath **/
    private final static String folderPath = "/ma/comment/jgCmt/"; 

    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());
	

	/**
	 * 게시판 관리 화면 조회 
	 * @param searchVO 검색조건
	 * @param model
	 * @return "content/contentList"
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mLayout:"+ folderPath + "list"; /** .mLayout : tiles로 지정해둔 layout tiles-defs.xml 사용 */
	}
	
	
	/**
	 * 게시판 리스트 화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		searchVO.setPageUnit(5);  /**페이지당 게시물수 */
		searchVO.setPageSize(10);  /**한번에 노출되는 페이지수 */

		PaginationInfo paginationInfo = new PaginationInfo();   /* 페이징처리 클래스 객체 생성  */
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); 
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); 
		paginationInfo.setPageSize(searchVO.getPageSize()); 
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		 /** 리스트 쿼리 실행(태그 id값으로 매칭)*/
		List<JgCmtVO> resultList = (List<JgCmtVO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList); /**  resultList addlist로 넘김 */
		
		return folderPath + "addList";
	}


	/**
	 * 게시판 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") JgCmtVO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		JgCmtVO jgCmtVO = new JgCmtVO();
		jgCmtVO = (JgCmtVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("jgCmtVO", jgCmtVO);
		JgCmtVO jgCmtVO2 = new JgCmtVO();
		jgCmtVO2 = (JgCmtVO) cmmnService.selectContents(searchVO, PROGRAM_ID+".selectComments");
		model.addAttribute("jgCmtVO2", jgCmtVO2);
		
		
		
		return ".mLayout:"+ folderPath + "view";
	}

	/**
	 * 게시글 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do") /*procType : 업무구분*/
	public String form(@ModelAttribute("searchVO") JgCmtVO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {

		JgCmtVO jgCmtVO = new JgCmtVO();
		if (procType.equals("update")) {
			jgCmtVO = (JgCmtVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		
		model.addAttribute("jgCmtVO", jgCmtVO);

		return ".mLayout:"+ folderPath + "form";
	}

	/**
	 * 게시판 등록/삭제/수정 + 댓글
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") JgCmtVO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		if(procType != null){
			
			if(procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);	
				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				cmmnService.deleteContents(searchVO, PROGRAM_ID + ".deleteComments");
				
			} else if (procType.equals("insertRe")) {	/* 댓글등록 */		
				cmmnService.updateContents(searchVO, PROGRAM_ID + ".insertComments");
				
			} else if (procType.equals("updateRe")) {	/* 댓글수정*/		
				cmmnService.updateContents(searchVO, PROGRAM_ID + ".updateComments");
				
			} else if (procType.equals("deleteRe")) {	/* 댓글삭제*/
				searchVO.setJgCont("");
				cmmnService.deleteContents(searchVO, PROGRAM_ID + ".deleteComments");
			}
			
			
			if(procType.equals("update")){
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "jgSeq");	
				model.addAttribute("pValue", searchVO.getJgSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else if(procType.equals("delete") ){
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else if(procType.equals("insertRe") ){
				model.addAttribute("message", "댓글이 등록되었습니다..");
				model.addAttribute("pName", "jgSeq");	
				model.addAttribute("pValue", searchVO.getJgSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("updateRe") ){
				model.addAttribute("message", "댓글이 수정되었습니다..");
				model.addAttribute("pName", "jgSeq");	
				model.addAttribute("pValue", searchVO.getJgSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("deleteRe") ){
				model.addAttribute("message", "댓글이 삭제되었습니다..");
				model.addAttribute("pName", "jgSeq");	
				model.addAttribute("pValue", searchVO.getJgSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}
	    	else{
	    		return "redirect:list.do";
	    	}
			
		}return "redirect:list.do";
	}

		
		
		
		
		
		
		
		
		

	
	
	

}
	
		


