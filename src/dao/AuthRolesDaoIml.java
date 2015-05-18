package dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import domain.AuthorityMenu;
import domain.AuthorityResVal;
import domain.AuthorityRoles;

import org.springframework.transaction.annotation.Transactional;

@Transactional 
public class AuthRolesDaoIml extends BaseDao implements  AuthRolesDao{
		
	@Override
	public void Add(AuthorityRoles role)
	{
		try{
			
			role.setFid(UUID.randomUUID().toString());

		    getSession().save(role);
		}
		catch(Exception ex)
		{
			
			ex.printStackTrace();
			System.err.println(ex.toString());
		}
	}
	
	
	@Override
	public List<AuthorityRoles> getAll(int offset, int length)
	{
		String hql = "from AuthorityRoles";		
		Query query =getSession().createQuery(hql);		
		query.setFirstResult(offset);
		query.setMaxResults(length);
		@SuppressWarnings("unchecked")
		List<AuthorityRoles> list = query.list();
		return list;
	}
	
	@Override
	public int GetRolesCount()
	{
	    String hql = "select count(*) from AuthorityRoles";	    
	    Query query =getSession().createQuery(hql);	    
	    int total = (new Integer(query.uniqueResult().toString()));	    
		return total;
	}
	
	
	public List<AuthorityResVal> getResVal(long fauthorityVal)
	{
		String hql = "from AuthorityResVal";		
		Query query =getSession().createQuery(hql);		
		query.setFirstResult(0);
		query.setMaxResults(1000);
		@SuppressWarnings("unchecked")
		
		List<AuthorityResVal> list = query.list();
		
		List<AuthorityResVal> listNew = new ArrayList<AuthorityResVal>();  

		AuthorityResVal revVal = null;
		
		for(int i = 0; i < list.size(); i++)  
        {  
			revVal = list.get(i);
			
			if((revVal.getId()&fauthorityVal) == revVal.getId()){
				revVal.setChecked(true);
			}
				listNew.add(revVal);  
        }  		
		return listNew;
	}
	
	public void Delete(String id) {
			   
		getSession().delete(
				getSession().load(AuthorityRoles.class, id)	
	    );
		
	}
	
	@Override
	public void Update(AuthorityRoles menu) {
		try{
			getSession().update(menu);		
		}
		catch(Exception ex)
		{			
			ex.printStackTrace();
			System.err.println(ex.toString());
		}
	}	
}
