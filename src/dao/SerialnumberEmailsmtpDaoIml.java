package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;

import com.device.ejb.SerialnumberEmailsmtp;
import com.device.ejb.SerialnumberEmailsmtpService;

import action.ejbproxy;


/**
 * <p>Title: ejb title </p>
 * <p>Description: t_serialnumber_emailsmtp Client Dao ������</p>
 * @author yangqinxu �绰��137****5317
 * @version 1.0 ʱ��  2016-1-16 13:45:21
 */

public class SerialnumberEmailsmtpDaoIml {	

  	public void AddSerialnumberEmailsmtp(SerialnumberEmailsmtp serialnumberEmailsmtp) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailsmtpService serviceClient;
		try {
			serviceClient = (SerialnumberEmailsmtpService) weblogicContext.lookup("SerialnumberEmailsmtpBean/remote");
			serviceClient.AddSerialnumberEmailsmtp(serialnumberEmailsmtp);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public int GetSerialnumberEmailsmtpCount(HashMap<String, String> map)
	{
		int total = 0 ;			
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailsmtpService serviceClient;
		try {
			serviceClient = (SerialnumberEmailsmtpService)weblogicContext.lookup("SerialnumberEmailsmtpBean/remote");
			total = serviceClient.GetSerialnumberEmailsmtpCount(map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return total;
	}
	

	public List<SerialnumberEmailsmtp> ListSerialnumberEmailsmtp(int offset, int length,HashMap<String, String> map)
	{		
		List<SerialnumberEmailsmtp> listSerialnumberEmailsmtp =  new ArrayList<SerialnumberEmailsmtp>();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberEmailsmtpService serviceClient = (SerialnumberEmailsmtpService)weblogicContext.lookup("SerialnumberEmailsmtpBean/remote");
			listSerialnumberEmailsmtp = serviceClient.ListSerialnumberEmailsmtp(offset, length,map);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("��������NamingException�ڣ�"+ne.toString());
			   ne.printStackTrace();
			  }
		
		return listSerialnumberEmailsmtp;		
	}
    
    public SerialnumberEmailsmtp findSerialnumberEmailsmtp(String fid)
	{		
		SerialnumberEmailsmtp serialnumberEmailsmtp = new SerialnumberEmailsmtp();				
		try{
			Context weblogicContext = ejbproxy.getInitialConnection();			
			SerialnumberEmailsmtpService serviceClient = (SerialnumberEmailsmtpService)weblogicContext.lookup("SerialnumberEmailsmtpBean/remote");
			serialnumberEmailsmtp = serviceClient.findSerialnumberEmailsmtp(fid);	

		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("��������NamingException�ڣ�"+ne.toString());
			   ne.printStackTrace();
			  }
		
		return serialnumberEmailsmtp;		
	}
    
  	public void UpdateSerialnumberEmailsmtp(SerialnumberEmailsmtp serialnumberEmailsmtp) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailsmtpService serviceClient;
		try {
			serviceClient = (SerialnumberEmailsmtpService)weblogicContext.lookup("SerialnumberEmailsmtpBean/remote");
			serviceClient.UpdateSerialnumberEmailsmtp(serialnumberEmailsmtp);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}        

   	public void UpdateSerialnumberEmailsmtp(SerialnumberEmailsmtp serialnumberEmailsmtp,HashMap<String, String> map) {		
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailsmtpService serviceClient;
		try {
			serviceClient = (SerialnumberEmailsmtpService)weblogicContext.lookup("SerialnumberEmailsmtpBean/remote");
			serviceClient.UpdateSerialnumberEmailsmtp(serialnumberEmailsmtp,map);	
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}    
   
	public void DeleteSerialnumberEmailsmtp(String id) {
		Context weblogicContext = ejbproxy.getInitialConnection();
		SerialnumberEmailsmtpService serviceClient;
		try {
			serviceClient = (SerialnumberEmailsmtpService) weblogicContext
					.lookup("SerialnumberEmailsmtpBean/remote");
			serviceClient.DeleteSerialnumberEmailsmtp(id);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}    
}
