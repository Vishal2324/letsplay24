package com.letsplay24.user;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.letsplay24.product.Product;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO  {

	@Autowired
	SessionFactory sessionFactory ;

	public void insertUser(User u) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(u);
	}

	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		
		return sessionFactory.getCurrentSession().createQuery("from User u").list();
	}

	public User getuName(String username) {
		// TODO Auto-generated method stub
		return null;
	}
}

