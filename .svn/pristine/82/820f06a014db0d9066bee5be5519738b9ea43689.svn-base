package dao;

import com.users.ejb.BaseTypecode;
import com.users.ejb.BaseTypecodeService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;


/**
 * <p>Title: ejb title </p>
 * <p>Description: t_base_typecode Client Dao 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-6-5 15:19:11
 */

public class BaseTypecodeDaoIml {	

  	public void Add(BaseTypecode baseTypecode) {
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		BaseTypecodeService serviceClient;
		try {
			serviceClient = (BaseTypecodeService) weblogicContext.lookup("BaseTypecodeBean/remote");
			serviceClient.Add(baseTypecode);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		BaseTypecodeService serviceClient;
		try {
			serviceClient = (BaseTypecodeService)weblogicContext.lookup("BaseTypecodeBean/remote");
			total = serviceClient.GetCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<BaseTypecode> GetAll(int offset, int length,HashMap<String, String> map)
	{		
		List<BaseTypecode> listBaseTypecode =  new ArrayList<BaseTypecode>();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			BaseTypecodeService serviceClient = (BaseTypecodeService)weblogicContext.lookup("BaseTypecodeBean/remote");
			listBaseTypecode = serviceClient.ListBaseTypecode(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listBaseTypecode;		
	}
    
    public BaseTypecode Find(String fid)
	{		
		BaseTypecode baseTypecode = new BaseTypecode();				
		try{
			Context weblogicContext = action.ejbproxy.getInitialConnection();			
			BaseTypecodeService serviceClient = (BaseTypecodeService)weblogicContext.lookup("BaseTypecodeBean/remote");
			baseTypecode = serviceClient.find(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return baseTypecode;		
	}
    
  	public void Update(BaseTypecode baseTypecode) {		
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		BaseTypecodeService serviceClient;
		try {
			serviceClient = (BaseTypecodeService)weblogicContext.lookup("BaseTypecodeBean/remote");
			serviceClient.Update(baseTypecode);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}        
   
	public void Delete(String id) {
		Context weblogicContext = action.ejbproxy.getInitialConnection();
		BaseTypecodeService serviceClient;
		try {
			serviceClient = (BaseTypecodeService) weblogicContext
					.lookup("BaseTypecodeBean/remote");
			serviceClient.Delete(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}    
}
