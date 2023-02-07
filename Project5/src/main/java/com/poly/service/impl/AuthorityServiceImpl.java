package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.AuthorityDAO;
import com.poly.entity.Authority;
import com.poly.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService{
	
	@Autowired
	AuthorityDAO authorityDAO;

	@Override
	public List<Authority> findAll() {
		return authorityDAO.findAll();
	}
	
	//duy
//	@Override
//	public List<Authority> findAll() {
//		return authorityDAO.findAll();
//	}

	@Override
	public Authority save(Authority authority) {
		return authorityDAO.save(authority);
	}

	@Override
	public void delete(Integer id) {
		authorityDAO.deleteById(id);
	}

}
