package heracules.jmk.qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import heracules.jmk.qna.service.QnaService;

@Controller
public class QnaController {

	private static Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaservice;
	
	@RequestMapping(value = "/QnaSelect", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", qnaservice.qnaselectAll());
		logger.info("list", model);
		
		return "./board/board_select_all_view";
	}
}
