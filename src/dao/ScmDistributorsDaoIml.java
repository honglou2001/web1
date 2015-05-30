package dao;

import com.common.ejb.EjbException;
import com.users.ejb.ScmDistributors;
import com.users.ejb.ScmDistributorsService;
import com.users.ejb.User;
import com.users.ejb.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;


/**
 * <p>Title: ejb title </p>
 * <p>Description: t_scm_distributors Client Dao 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-5-24 15:06:23
 */

public class ScmDistributorsDaoIml {	

  	public void Add(ScmDistributors scmDistributors) throws EjbException {
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmDistributorsService serviceClient;
		try {
			serviceClient = (ScmDistributorsService) weblogicContext.lookup("ScmDistributorsBean/remote");
			serviceClient.Add(scmDistributors);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmDistributorsService serviceClient;
		try {
			serviceClient = (ScmDistributorsService)weblogicContext.lookup("ScmDistributorsBean/remote");
			total = serviceClient.GetCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<ScmDistributors> GetAll(int offset, int length,HashMap<String, String> map)
	{		
		List<ScmDistributors> listScmDistributors =  new ArrayList<ScmDistributors>();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			ScmDistributorsService serviceClient = (ScmDistributorsService)weblogicContext.lookup("ScmDistributorsBean/remote");
			listScmDistributors = serviceClient.ListScmDistributors(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listScmDistributors;		
	}
	
	public List<ScmDistributors> GetListAll(String fanme)
	{		
		List<ScmDistributors> listScmDistributors =  new ArrayList<ScmDistributors>();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			ScmDistributorsService serviceClient = (ScmDistributorsService)weblogicContext.lookup("ScmDistributorsBean/remote");
			listScmDistributors = serviceClient.ListScmDistributors(fanme);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listScmDistributors;		
	}	
    
    public ScmDistributors Find(String fid)
	{		
		ScmDistributors scmDistributors = new ScmDistributors();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			ScmDistributorsService serviceClient = (ScmDistributorsService)weblogicContext.lookup("ScmDistributorsBean/remote");
			scmDistributors = serviceClient.find(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return scmDistributors;		
	}
    
	public void Update(ScmDistributors scmDistributors)  throws EjbException {		
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmDistributorsService serviceClient;
		try {
			serviceClient = (ScmDistributorsService)weblogicContext.lookup("ScmDistributorsBean/remote");
			serviceClient.Update(scmDistributors);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}    
    
	public void Delete(String id) {
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmDistributorsService serviceClient;
		try {
			serviceClient = (ScmDistributorsService) weblogicContext
					.lookup("ScmDistributorsBean/remote");
			serviceClient.Delete(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}    
}
