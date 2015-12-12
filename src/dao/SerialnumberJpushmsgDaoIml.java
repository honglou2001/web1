package dao;


import action.ejbproxy;

import com.watch.ejb.SerialnumberJpushmsg;
import com.watch.ejb.SerialnumberJpushmsgService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;


/**
 * <p>Title: ejb title </p>
 * <p>Description: t_serialnumber_jpushmsg Client Dao 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-12-12 17:28:16
 */

public class SerialnumberJpushmsgDaoIml {	

  	public void AddSerialnumberJpushmsg(SerialnumberJpushmsg serialnumberJpushmsg) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberJpushmsgService serviceClient;
		try {
			serviceClient = (SerialnumberJpushmsgService) weblogicContext.lookup("SerialnumberJpushmsgBean/remote");
			serviceClient.AddSerialnumberJpushmsg(serialnumberJpushmsg);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetSerialnumberJpushmsgCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberJpushmsgService serviceClient;
		try {
			serviceClient = (SerialnumberJpushmsgService)weblogicContext.lookup("SerialnumberJpushmsgBean/remote");
			total = serviceClient.GetSerialnumberJpushmsgCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<SerialnumberJpushmsg> ListSerialnumberJpushmsg(int offset, int length,HashMap<String, String> map)
	{		
		List<SerialnumberJpushmsg> listSerialnumberJpushmsg =  new ArrayList<SerialnumberJpushmsg>();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberJpushmsgService serviceClient = (SerialnumberJpushmsgService)weblogicContext.lookup("SerialnumberJpushmsgBean/remote");
			listSerialnumberJpushmsg = serviceClient.ListSerialnumberJpushmsg(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listSerialnumberJpushmsg;		
	}
    
    public SerialnumberJpushmsg findSerialnumberJpushmsg(String fid)
	{		
		SerialnumberJpushmsg serialnumberJpushmsg = new SerialnumberJpushmsg();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberJpushmsgService serviceClient = (SerialnumberJpushmsgService)weblogicContext.lookup("SerialnumberJpushmsgBean/remote");
			serialnumberJpushmsg = serviceClient.findSerialnumberJpushmsg(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return serialnumberJpushmsg;		
	}
    
  	public void UpdateSerialnumberJpushmsg(SerialnumberJpushmsg serialnumberJpushmsg) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberJpushmsgService serviceClient;
		try {
			serviceClient = (SerialnumberJpushmsgService)weblogicContext.lookup("SerialnumberJpushmsgBean/remote");
			serviceClient.UpdateSerialnumberJpushmsg(serialnumberJpushmsg);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}        

   	public void UpdateSerialnumberJpushmsg(SerialnumberJpushmsg serialnumberJpushmsg,HashMap<String, String> map) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberJpushmsgService serviceClient;
		try {
			serviceClient = (SerialnumberJpushmsgService)weblogicContext.lookup("SerialnumberJpushmsgBean/remote");
			serviceClient.UpdateSerialnumberJpushmsg(serialnumberJpushmsg,map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}    
   
	public void DeleteSerialnumberJpushmsg(String id) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberJpushmsgService serviceClient;
		try {
			serviceClient = (SerialnumberJpushmsgService) weblogicContext
					.lookup("SerialnumberJpushmsgBean/remote");
			serviceClient.DeleteSerialnumberJpushmsg(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}    
}