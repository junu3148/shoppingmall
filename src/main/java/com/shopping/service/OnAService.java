package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.QnADAO;

@Service
public class OnAService {
	
	@Autowired
	private QnADAO qnADAO;

}
