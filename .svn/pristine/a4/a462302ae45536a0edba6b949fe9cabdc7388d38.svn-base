package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDao {
	
	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
}
