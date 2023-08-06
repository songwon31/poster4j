package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ReceiverDao;
import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Receiver;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReceiverServiceImpl implements ReceiverService {
	@Resource
	private ReceiverDao receiverDao;
	
	@Override
	public void register(Receiver receiver) {
		receiverDao.insertAddress(receiver);
		log.info("receiver:" + receiver.getReceiverAddress());
		log.info("receiver:" + receiver.getReceiverAddressDetail());
		log.info("receiver:" + receiver.getReceiverAddressType());
		log.info("receiver:" + receiver.getReceiverId());
		log.info("receiver:" + receiver.getReceiverTelno());
		log.info("receiver:" + receiver.getReceiverZip());
		
	}
	
	@Override
	public List<Receiver> getList(Pager pager) {
		List<Receiver> receiverList = receiverDao.selectByPage(pager);
		//List<Ch13Board> boardList = boardDaoOld.selectByPage(pager);
		return receiverList;
	}
	
	@Override
	public int getTotalReceiverNum() {
		int totalReceiverNum = receiverDao.count();
		return totalReceiverNum;
	}
	
}
