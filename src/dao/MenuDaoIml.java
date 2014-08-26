package dao;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import domain.AuthorityMenu;
import domain.User;

import org.springframework.transaction.annotation.Transactional;

@Transactional 
public class MenuDaoIml extends BaseDao implements  MenuDao{
		
	@Override
	public void Add(AuthorityMenu menu)
	{
		try{
		menu.setFid(UUID.randomUUID().toString());
		menu.setFparentId("00000000-0000-0000-0000-000000000000");
		
		getSession().save(menu);
		}
		catch(Exception ex)
		{
			
			ex.printStackTrace();
			System.err.println(ex.toString());
		}
	}
	
	
	@Override
	public List<AuthorityMenu> getAll(int offset, int length)
	{
		String hql = "from AuthorityMenu";		
		Query query =getSession().createQuery(hql);		
		query.setFirstResult(offset);
		query.setMaxResults(length);
		@SuppressWarnings("unchecked")
		List<AuthorityMenu> list = query.list();
		return list;
	}
	
	@Override
	public int GetMenuCount()
	{
	    String hql = "select count(*) from AuthorityMenu";	    
	    Query query =getSession().createQuery(hql);	    
	    int total = (new Integer(query.uniqueResult().toString()));	    
		return total;
	}
}
