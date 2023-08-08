package com.webteam2.poster4j.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webteam2.poster4j.dao.ReceiverDao;
import com.webteam2.poster4j.dto.Customer;
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
	public List<Receiver> getList(Pager pager, String customerId) {
		List<Receiver> receiverList = receiverDao.selectByPage(pager, customerId);
		return receiverList;
	}
	
	@Override
	public int getTotalReceiverNum() {
		int totalReceiverNum = receiverDao.count();
		return totalReceiverNum;
	}
	
	@Override
	public Receiver getBoard(int receiverId) {
		Receiver receiver = receiverDao.selectById(receiverId);
		return receiver;
	}
	
	@Override
	public void modify(Receiver receiver) {
		receiverDao.updateById(receiver);
	}
	
	@Override
	public void delete(int receiverId) {
		receiverDao.delete(receiverId);
	}

	@Override
	public void firstRegister(Receiver receiver) {
		Receiver firstReceiver = receiverDao.selectById(receiver.getReceiverId());
		receiverDao.insert(firstReceiver);
	}
}
