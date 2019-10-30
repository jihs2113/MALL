package com.gura.spring07.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring07.shop.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ShopDto> getList() {
		// TODO Auto-generated method stub
		return session.selectList("shop.getList");
	}

	@Override
	public void minusCount(int num) {
		session.update("shop.minusCount", num);
	}

	@Override
	public void minusMoney(ShopDto dto) {
		session.update("shop.minusMoney", dto);
	}

	@Override
	public void plusPoint(ShopDto dto) {
		session.update("shop.plusPoint", dto);
	}

	@Override
	public int getPrice(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("shop.getPrice", num);
	}

}







