package com.hein.empti.saleorderdetails.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.saleorderdetails.SaleorderdetailsVO;
import com.hein.empti.saleorderdetails.mapper.SaleorderdetailsMapper;
import com.hein.empti.saleorderdetails.service.SaleorderdetailsService;

@Service
public class SaleorderdetailsServiceImpl implements SaleorderdetailsService{
	
	@Autowired SaleorderdetailsMapper mapper;
	
	@Override
	public void setSaleorderdetailInsert(List<SaleorderdetailsVO> list) {
		mapper.setSaleorderdetailInsert(list);
		System.out.println("판매주문 다중 Insert 완료.");
	}

}