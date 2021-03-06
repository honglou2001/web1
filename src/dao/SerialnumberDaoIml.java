package dao;


import action.ejbproxy;

import com.watch.ejb.Serialnumber;
import com.watch.ejb.SerialnumberService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;


/**
 * <p>Title: ejb title </p>
 * <p>Description: serialnumber Client Dao 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-9-5 10:56:48
 */

public class SerialnumberDaoIml {	

  	public void Add(Serialnumber serialnumber) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberService serviceClient;
		try {
			serviceClient = (SerialnumberService) weblogicContext.lookup("SerialnumberBean/remote");
			serviceClient.Add(serialnumber);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetCountAll(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberService serviceClient;
		try {
			serviceClient = (SerialnumberService)weblogicContext.lookup("SerialnumberBean/remote");
			total = serviceClient.GetCountAll(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<Serialnumber> GetAll(int offset, int length,HashMap<String, String> map)
	{		
		List<Serialnumber> listSerialnumber =  new ArrayList<Serialnumber>();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberService serviceClient = (SerialnumberService)weblogicContext.lookup("SerialnumberBean/remote");
			listSerialnumber = serviceClient.ListSerialnumberAll(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listSerialnumber;		
	}
    
    public Serialnumber find(String fid)
	{		
		Serialnumber serialnumber = new Serialnumber();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberService serviceClient = (SerialnumberService)weblogicContext.lookup("SerialnumberBean/remote");
			serialnumber = serviceClient.find(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return serialnumber;		
	}
    
  	public void Update(Serialnumber serialnumber) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberService serviceClient;
		try {
			serviceClient = (SerialnumberService)weblogicContext.lookup("SerialnumberBean/remote");
			serviceClient.Update(serialnumber);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}  
  	
  	public void Update(Serialnumber serialnumber,HashMap<String, String> map) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberService serviceClient;
		try {
			serviceClient = (SerialnumberService)weblogicContext.lookup("SerialnumberBean/remote");
			serviceClient.Update(serialnumber,map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}     
   
	public void Delete(String id) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberService serviceClient;
		try {
			serviceClient = (SerialnumberService) weblogicContext
					.lookup("SerialnumberBean/remote");
			serviceClient.Delete(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}    
}