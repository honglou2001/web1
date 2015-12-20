package dao;

import com.watch.ejb.SerialnumberEmailtemplate;
import com.watch.ejb.SerialnumberEmailtemplateService;
import action.ejbproxy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;

public class SerialnumberEmailtemplateDaoIml {
	
	public void AddSerialnumberEmailtemplate(SerialnumberEmailtemplate serialnumberEmailtemplate) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailtemplateService serviceClient;
		try {
			serviceClient = (SerialnumberEmailtemplateService) weblogicContext.lookup("SerialnumberEmailtemplateBean/remote");
			serviceClient.AddSerialnumberEmailtemplate(serialnumberEmailtemplate);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetSerialnumberEmailtemplateCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailtemplateService serviceClient;
		try {
			serviceClient = (SerialnumberEmailtemplateService)weblogicContext.lookup("SerialnumberEmailtemplateBean/remote");
			total = serviceClient.GetSerialnumberEmailtemplateCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<SerialnumberEmailtemplate> ListSerialnumberEmailtemplate(int offset, int length,HashMap<String, String> map)
	{		
		List<SerialnumberEmailtemplate> listSerialnumberEmailtemplate =  new ArrayList<SerialnumberEmailtemplate>();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberEmailtemplateService serviceClient = (SerialnumberEmailtemplateService)weblogicContext.lookup("SerialnumberEmailtemplateBean/remote");
			listSerialnumberEmailtemplate = serviceClient.ListSerialnumberEmailtemplate(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listSerialnumberEmailtemplate;		
	}
    
    public SerialnumberEmailtemplate findSerialnumberEmailtemplate(String fid)
	{		
		SerialnumberEmailtemplate serialnumberEmailtemplate = new SerialnumberEmailtemplate();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberEmailtemplateService serviceClient = (SerialnumberEmailtemplateService)weblogicContext.lookup("SerialnumberEmailtemplateBean/remote");
			serialnumberEmailtemplate = serviceClient.findSerialnumberEmailtemplate(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return serialnumberEmailtemplate;		
	}
    
  	public void UpdateSerialnumberEmailtemplate(SerialnumberEmailtemplate serialnumberEmailtemplate) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailtemplateService serviceClient;
		try {
			serviceClient = (SerialnumberEmailtemplateService)weblogicContext.lookup("SerialnumberEmailtemplateBean/remote");
			serviceClient.UpdateSerialnumberEmailtemplate(serialnumberEmailtemplate);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}        

   	public void UpdateSerialnumberEmailtemplate(SerialnumberEmailtemplate serialnumberEmailtemplate,HashMap<String, String> map) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailtemplateService serviceClient;
		try {
			serviceClient = (SerialnumberEmailtemplateService)weblogicContext.lookup("SerialnumberEmailtemplateBean/remote");
			serviceClient.UpdateSerialnumberEmailtemplate(serialnumberEmailtemplate,map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}    
   
	public void DeleteSerialnumberEmailtemplate(String id) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailtemplateService serviceClient;
		try {
			serviceClient = (SerialnumberEmailtemplateService) weblogicContext
					.lookup("SerialnumberEmailtemplateBean/remote");
			serviceClient.DeleteSerialnumberEmailtemplate(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}   
}
