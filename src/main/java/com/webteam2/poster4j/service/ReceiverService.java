package com.webteam2.poster4j.service;

import java.util.List;

import com.webteam2.poster4j.dto.Pager;
import com.webteam2.poster4j.dto.Receiver;

public interface ReceiverService {
	public void register(Receiver receiver);
	public void firstRegister(Receiver receiver);
	public List<Receiver> getList(Pager pager, String customerId);
	public int getTotalReceiverNum();
	public Receiver getBoard(int receiverId);
	public void modify(Receiver receiver);
	public void delete(int receiverId);
}
