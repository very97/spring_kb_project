package heracules.jmk.qna.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import heracules.jmk.qna.dto.PageMaker;
import heracules.jmk.qna.dto.QnaDTO;
import heracules.jmk.qna.dto.ReplyDTO;
import heracules.jmk.qna.dto.SearchCriteria;
import heracules.jmk.qna.service.QnaService;

@Controller
public class QnaController {
	private static Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaservice;

	@RequestMapping(value = "/QnaSelect", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri, QnaDTO qnaDTO) throws Exception {
		logger.info("list");

		model.addAttribute("list", qnaservice.qnaselectAll(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaservice.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		return "./board/board_select_all_view";

	}

	// select detail + reply + 조회수
	@RequestMapping(value = "/QnaSelectDetail", method = RequestMethod.GET)
	public String read(QnaDTO qnaDTO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");
//		model.addAttribute("qnaDTO", qnaservice.Select(qnaDTO.getQnaindex()));

		model.addAttribute("read", qnaservice.readReply(qnaDTO.getQnaindex()));
		model.addAttribute("scri", scri);
		model.addAttribute("qnaDTO", qnaservice.Select(qnaDTO.getQnaindex()));

		List<ReplyDTO> replyList = qnaservice.readReply(qnaDTO.getQnaindex());

		model.addAttribute("replyList", replyList);

		return "./board/board_select_detail_view";
	}

//	//==========Select Detail 처음것 ================
//	
//	@RequestMapping(value = "/QnaSelectDetail", method = RequestMethod.GET)
//	public String detail(Model model, QnaDTO qnaDTO) {
//		model.addAttribute("qnaDTO", qnaservice.Select(qnaDTO.getQnaindex()));
//		
//		return "./board/board_select_detail_view";
//	}

	
	
//	 ------------Insert Reply---------------
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String writeReply(ReplyDTO replyDTO, SearchCriteria scri, Model model) throws Exception {
		logger.info("insert reply");
		qnaservice.writeReply(replyDTO);
		model.addAttribute("replyDTO", replyDTO);
		
		model.addAttribute("qnaindex", replyDTO.getQnaindex());
		model.addAttribute("page", scri.getPage());
		model.addAttribute("perPageNum", scri.getPerPageNum());
		logger.info("scri : ", scri);

		model.addAttribute("searchtype", scri.getSearchType());
		model.addAttribute("keyword", scri.getKeyword());
		
		
		return "./board/board_reply_refresh";
		
	}

	// ---------Insert----------------
	@RequestMapping(value = "/QnaInsert", method = RequestMethod.GET)
	public String insert() {
		return "./board/board_insert";
	}

	@RequestMapping(value = "/QnaInsert", method = RequestMethod.POST)
	public String insert(Model model, QnaDTO qnaDTO, SearchCriteria criteria) throws Exception {
		model.addAttribute("list", qnaservice.qnaselectAll(criteria));
		qnaservice.Insert(qnaDTO);
		return "./board/board_insert_view";
	}

	// ---------Update--------------
	@RequestMapping(value = "/QnaUpdate", method = RequestMethod.GET)
	public String update(Model model, QnaDTO qnaDTO) {
		model.addAttribute("qnaDTO", qnaservice.Select(qnaDTO.getQnaindex()));
		return "./board/board_update";
	}

	@RequestMapping(value = "/QnaUpdate", method = RequestMethod.POST)
	public String update(QnaDTO qnaDTO) {
		qnaservice.Update(qnaDTO);
		return "./board/board_update_view";
	}

	// ----------Delete---------------

	@RequestMapping(value = "/QnaDelete", method = RequestMethod.GET)
	public String delete() {

		return "./board/board_delete";
	}

	@RequestMapping(value = "/QnaDelete", method = RequestMethod.POST)
	public String delete(QnaDTO qnaDTO) {
		qnaservice.Delete(qnaDTO.getQnaindex());
		return "./board/board_delete_view";
	}
	
	// 테스트를 위한 코드
	@RequestMapping(value = "/dummy", method = RequestMethod.GET)
	public String dummy() throws Exception {
		for (int i = 300; i < 1000; i++) {

			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setQnatitle("더미용제목" + i);
			qnaDTO.setQnacontents("더미용내용" + i);
			qnaDTO.setQnawriter("더미용작성자"+i);
			
			qnaservice.Insert(qnaDTO);

		}
		return "./board/board_insert_view";
	}
	
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	
	public String ReplyDelete(ReplyDTO replyDTO, QnaDTO qnaDTO) {
		qnaservice.Delete(replyDTO, qnaDTO);
		return "./board/board_reply_delete_refresh";
	}
}
