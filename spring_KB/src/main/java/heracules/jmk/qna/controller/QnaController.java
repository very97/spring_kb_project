package heracules.jmk.qna.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import heracules.jmk.qna.dto.QnaDTO;
import heracules.jmk.qna.service.QnaService;

@Controller
public class QnaController {
	private static Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaservice;
	//==============Select=================
	@RequestMapping(value = "/QnaSelect", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", qnaservice.qnaselectAll());
		logger.info("list", model);
		
		return "./board/board_select_all_view";
	}
	//==========Select Detail================
	
	@RequestMapping(value = "/QnaSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, QnaDTO qnaDTO) {
		model.addAttribute("qnaDTO", qnaservice.Select(qnaDTO.getQnaindex()));
		
		return "./board/board_select_detail_view";
	}
	//---------Insert----------------
	@RequestMapping(value = "/QnaInsert", method = RequestMethod.GET)
	public String insert() {
		return "./board/board_insert";
	}
	
	@RequestMapping(value = "/QnaInsert", method = RequestMethod.POST)
	public String insert(Model model, QnaDTO qnaDTO) {
		model.addAttribute("list", qnaservice.qnaselectAll());
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
	
	//----------Delete---------------
	
	@RequestMapping(value = "/QnaDelete", method = RequestMethod.GET)
	public String delete() {
		
		return "./board/board_delete";
	}
	
	@RequestMapping(value = "/QnaDelete", method = RequestMethod.POST)
	public String delete(QnaDTO qnaDTO) {
		qnaservice.Delete(qnaDTO.getQnaindex());
		return "./board/board_delete_view";
	}
	
	
}

