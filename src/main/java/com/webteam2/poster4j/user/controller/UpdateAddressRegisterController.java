package com.webteam2.poster4j.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webteam2.poster4j.dto.Receiver;
import com.webteam2.poster4j.service.ReceiverService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UpdateAddressRegisterController {
	@Resource
	private ReceiverService receiverService;
	
	@GetMapping("/updateAddressRegister")
	public String UpdateAddressRegister(@RequestParam(defaultValue = "0") int receiverId, Model model) {
		Receiver receiver = receiverService.getBoard(receiverId);
		log.info(""+receiver.getReceiverPersonName());
		model.addAttribute("receiver", receiver);
		return "user/updateAddressRegisterForm";
		
		
	}
	@PostMapping("/updateAddressRegister")
	public String updateBoard(Receiver receiver) {
		receiverService.modify(receiver);
		return "redirect:/addressList";
	}
}
