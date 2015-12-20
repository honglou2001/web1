package dao;

import action.ejbproxy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;

import com.watch.ejb.SerialnumberEmailhistory;
import com.watch.ejb.SerialnumberEmailhistoryService;

public class SerialnumberEmailhistoryDaoIml {

  	public void AddSerialnumberEmailhistory(SerialnumberEmailhistory serialnumberEmailhistory) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailhistoryService serviceClient;
		try {
			serviceClient = (SerialnumberEmailhistoryService) weblogicContext.lookup("SerialnumberEmailhistoryBean/remote");
			serviceClient.AddSerialnumberEmailhistory(serialnumberEmailhistory);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetSerialnumberEmailhistoryCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailhistoryService serviceClient;
		try {
			serviceClient = (SerialnumberEmailhistoryService)weblogicContext.lookup("SerialnumberEmailhistoryBean/remote");
			total = serviceClient.GetSerialnumberEmailhistoryCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<SerialnumberEmailhistory> ListSerialnumberEmailhistory(int offset, int length,HashMap<String, String> map)
	{		
		List<SerialnumberEmailhistory> listSerialnumberEmailhistory =  new ArrayList<SerialnumberEmailhistory>();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberEmailhistoryService serviceClient = (SerialnumberEmailhistoryService)weblogicContext.lookup("SerialnumberEmailhistoryBean/remote");
			listSerialnumberEmailhistory = serviceClient.ListSerialnumberEmailhistory(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listSerialnumberEmailhistory;		
	}
    
    public SerialnumberEmailhistory findSerialnumberEmailhistory(String fid)
	{		
		SerialnumberEmailhistory serialnumberEmailhistory = new SerialnumberEmailhistory();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberEmailhistoryService serviceClient = (SerialnumberEmailhistoryService)weblogicContext.lookup("SerialnumberEmailhistoryBean/remote");
			serialnumberEmailhistory = serviceClient.findSerialnumberEmailhistory(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return serialnumberEmailhistory;		
	}
    
  	public void UpdateSerialnumberEmailhistory(SerialnumberEmailhistory serialnumberEmailhistory) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailhistoryService serviceClient;
		try {
			serviceClient = (SerialnumberEmailhistoryService)weblogicContext.lookup("SerialnumberEmailhistoryBean/remote");
			serviceClient.UpdateSerialnumberEmailhistory(serialnumberEmailhistory);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}        

   	public void UpdateSerialnumberEmailhistory(SerialnumberEmailhistory serialnumberEmailhistory,HashMap<String, String> map) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailhistoryService serviceClient;
		try {
			serviceClient = (SerialnumberEmailhistoryService)weblogicContext.lookup("SerialnumberEmailhistoryBean/remote");
			serviceClient.UpdateSerialnumberEmailhistory(serialnumberEmailhistory,map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}    
   
	public void DeleteSerialnumberEmailhistory(String id) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailhistoryService serviceClient;
		try {
			serviceClient = (SerialnumberEmailhistoryService) weblogicContext
					.lookup("SerialnumberEmailhistoryBean/remote");
			serviceClient.DeleteSerialnumberEmailhistory(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
}
