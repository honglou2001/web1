package dao;

import com.users.ejb.ScmSalesdata;
import com.users.ejb.ScmSalesdataService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;


/**
 * <p>Title: ejb title </p>
 * <p>Description: t_scm_salesdata Client Dao 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-5-29 14:43:26
 */

public class ScmSalesdataDaoIml {	

  	public void Add(ScmSalesdata scmSalesdata) {
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmSalesdataService serviceClient;
		try {
			serviceClient = (ScmSalesdataService) weblogicContext.lookup("ScmSalesdataBean/remote");
			serviceClient.Add(scmSalesdata);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmSalesdataService serviceClient;
		try {
			serviceClient = (ScmSalesdataService)weblogicContext.lookup("ScmSalesdataBean/remote");
			total = serviceClient.GetCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<ScmSalesdata> GetAll(int offset, int length,HashMap<String, String> map)
	{		
		List<ScmSalesdata> listScmSalesdata =  new ArrayList<ScmSalesdata>();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			ScmSalesdataService serviceClient = (ScmSalesdataService)weblogicContext.lookup("ScmSalesdataBean/remote");
			listScmSalesdata = serviceClient.ListScmSalesdata(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listScmSalesdata;		
	}
    
    public ScmSalesdata Find(String fid)
	{		
		ScmSalesdata scmSalesdata = new ScmSalesdata();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			ScmSalesdataService serviceClient = (ScmSalesdataService)weblogicContext.lookup("ScmSalesdataBean/remote");
			scmSalesdata = serviceClient.find(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return scmSalesdata;		
	}
    
  	public void Update(ScmSalesdata scmSalesdata) {		
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmSalesdataService serviceClient;
		try {
			serviceClient = (ScmSalesdataService)weblogicContext.lookup("ScmSalesdataBean/remote");
			serviceClient.Update(scmSalesdata);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}        
   
	public void Delete(String id) {
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		ScmSalesdataService serviceClient;
		try {
			serviceClient = (ScmSalesdataService) weblogicContext
					.lookup("ScmSalesdataBean/remote");
			serviceClient.Delete(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}    
}
