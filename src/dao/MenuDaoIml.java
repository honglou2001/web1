package dao;

import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import domain.AuthorityMenu;

import org.springframework.transaction.annotation.Transactional;

@Transactional 
public class MenuDaoIml  implements  MenuDao{
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public void Add(AuthorityMenu menu)
	{
		try{
		menu.setFid(UUID.randomUUID().toString());
		menu.setFparentId(UUID.randomUUID().toString());
		
		getSession().save(menu);
		}
		catch(Exception ex)
		{
			
			ex.printStackTrace();
			System.err.println(ex.toString());
		}
	}	
}
