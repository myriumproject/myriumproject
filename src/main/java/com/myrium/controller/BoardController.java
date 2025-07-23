package com.myrium.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.myrium.domain.BoardVO;
import com.myrium.domain.Criteria;
import com.myrium.domain.PageDTO;
import com.myrium.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@AllArgsConstructor
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardservice;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list__________");
		
		long startTime = System.nanoTime();
		
		List<BoardVO> list = boardservice.getList(cri);
		
		long endTime = System.nanoTime();
		log.info("list Time :" + (endTime-startTime));
		
		list.forEach(board -> log.info(board));
		model.addAttribute("list", list);

		int total = boardservice.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		log.info("---------------------------------------------------");

		log.info(authentication);

		//System.out.println("Authentication Details:");		
		//System.out.println("Principal: " + authentication.getPrincipal());
		//System.out.println("Authorities: " + authentication.getAuthorities());

		log.info("---------------------------------------------------");
	}
	
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("register......." + vo);

		boardservice.register(vo);

		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list";
	}
	
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
	}
	
//	@GetMapping("/get")
//	public void testget(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get:" +bno);
//		BoardVO vo = boardservice.get(bno);
//		log.info(vo);
//		model.addAttribute("board", boardservice.get(bno));
//	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		long startTime = System.currentTimeMillis();
		model.addAttribute("board", boardservice.get(bno));
		long endTime = System.currentTimeMillis();	
		log.info("get Time : " + (endTime-startTime));		
	}
	
	//@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(boardservice.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove..." + bno);
		if(boardservice.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	
}
