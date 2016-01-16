package service;


import bean.Constants;
import dao.SerialnumberEmailsmtpDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import com.device.ejb.SerialnumberEmailsmtp;
import com.opensymphony.xwork2.ActionSupport; 

/**
 * <p>Title: ejb title </p>
 * <p>Description: t_serialnumber_emailsmtp Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2016-1-16 14:00:11
 */

public class SerialnumberEmailsmtpImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private SerialnumberEmailsmtpDaoIml  serialnumberemailsmtpDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private SerialnumberEmailsmtp serialnumberemailsmtp;
    private int page; 
    private int errcode;
    
    public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
   
	public SerialnumberEmailsmtp getSerialnumberemailsmtp() {
		return serialnumberemailsmtp;
	}

	public void setSerialnumberemailsmtp(SerialnumberEmailsmtp rserialnumberEmailsmtpInfo) {
		this.serialnumberemailsmtp =  rserialnumberEmailsmtpInfo;
	}    
    
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}		    
    
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
    
    public String getMessage() {  
        return message;  
    }  
  
    public void setMessage(String message) {  
        this.message = message;  
    }
    
    public SerialnumberEmailsmtpDaoIml getSerialnumberemailsmtpDao() {
		return serialnumberemailsmtpDao;
	}
    
	public void setSerialnumberemailsmtpDao (SerialnumberEmailsmtpDaoIml rserialnumberemailsmtpDao) {		     
         this.serialnumberemailsmtpDao = rserialnumberemailsmtpDao;
	}
       
	public String AddSerialnumberEmailsmtp() {	
    
    try {
 	  if(this.serialnumberemailsmtp.getFsmtprecid() == null || this.serialnumberemailsmtp.getFsmtprecid().length() <= 0){		
		  this.serialnumberemailsmtpDao.AddSerialnumberEmailsmtp(this.serialnumberemailsmtp);	
		  this.message ="新增成功";
	  }
      else
	  {
          this.serialnumberemailsmtpDao.UpdateSerialnumberEmailsmtp(this.serialnumberemailsmtp);	
		  this.message ="更新成功";
	  }     
      } catch (RuntimeException ex) {
		  this.message = ex.getMessage();
		  this.errcode = ex.hashCode();
	   }
	  
	  dataMap = new HashMap<String, Object>();
      dataMap.put("errcode", this.errcode);
	  dataMap.put("success", true);
	  dataMap.put("message", this.message);
	  
	  return SUCCESS;   			
	}
  
	private HashMap<String, String> GetQueryMap()
	{				
        HashMap<String, String> map = new HashMap<String, String>();
		if(this.serialnumberemailsmtp!=null){
        if(this.serialnumberemailsmtp.getFsmtprecid()!=null && !this.serialnumberemailsmtp.getFsmtprecid().equals("")){
			map.put("fsmtprecid", this.serialnumberemailsmtp.getFsmtprecid().toString());
         }
        if(this.serialnumberemailsmtp.getFincreaseid()!=null && !this.serialnumberemailsmtp.getFincreaseid().equals("")){
			map.put("fincreaseid", this.serialnumberemailsmtp.getFincreaseid().toString());
         }
        if(this.serialnumberemailsmtp.getFtype()!=null && !this.serialnumberemailsmtp.getFtype().equals("")){
			map.put("ftype", this.serialnumberemailsmtp.getFtype().toString());
         }
        if(this.serialnumberemailsmtp.getFappid()!=null && !this.serialnumberemailsmtp.getFappid().equals("")){
			map.put("fappid", this.serialnumberemailsmtp.getFappid().toString());
         }
        if(this.serialnumberemailsmtp.getFuserid()!=null && !this.serialnumberemailsmtp.getFuserid().equals("")){
			map.put("fuserid", this.serialnumberemailsmtp.getFuserid().toString());
         }
        if(this.serialnumberemailsmtp.getFname()!=null && !this.serialnumberemailsmtp.getFname().equals("")){
			map.put("fname", this.serialnumberemailsmtp.getFname().toString());
         }
        if(this.serialnumberemailsmtp.getFmailhost()!=null && !this.serialnumberemailsmtp.getFmailhost().equals("")){
			map.put("fmailhost", this.serialnumberemailsmtp.getFmailhost().toString());
         }
        if(this.serialnumberemailsmtp.getFmailusername()!=null && !this.serialnumberemailsmtp.getFmailusername().equals("")){
			map.put("fmailusername", this.serialnumberemailsmtp.getFmailusername().toString());
         }
        if(this.serialnumberemailsmtp.getFmailpassword()!=null && !this.serialnumberemailsmtp.getFmailpassword().equals("")){
			map.put("fmailpassword", this.serialnumberemailsmtp.getFmailpassword().toString());
         }
        if(this.serialnumberemailsmtp.getFmailaddress()!=null && !this.serialnumberemailsmtp.getFmailaddress().equals("")){
			map.put("fmailaddress", this.serialnumberemailsmtp.getFmailaddress().toString());
         }
        if(this.serialnumberemailsmtp.getFmailfromname()!=null && !this.serialnumberemailsmtp.getFmailfromname().equals("")){
			map.put("fmailfromname", this.serialnumberemailsmtp.getFmailfromname().toString());
         }
        if(this.serialnumberemailsmtp.getFisdefault()!=null && !this.serialnumberemailsmtp.getFisdefault().equals("")){
			map.put("fisdefault", this.serialnumberemailsmtp.getFisdefault().toString());
         }
        if(this.serialnumberemailsmtp.getFdatastatus()!=null && !this.serialnumberemailsmtp.getFdatastatus().equals("")){
			map.put("fdatastatus", this.serialnumberemailsmtp.getFdatastatus().toString());
         }
        if(this.serialnumberemailsmtp.getFfieldstatus()!=null && !this.serialnumberemailsmtp.getFfieldstatus().equals("")){
			map.put("ffieldstatus", this.serialnumberemailsmtp.getFfieldstatus().toString());
         }
        if(this.serialnumberemailsmtp.getFaddtime()!=null && !this.serialnumberemailsmtp.getFaddtime().equals("")){
			map.put("faddtime", this.serialnumberemailsmtp.getFaddtime().toString());
         }
        if(this.serialnumberemailsmtp.getFupdatetime()!=null && !this.serialnumberemailsmtp.getFupdatetime().equals("")){
			map.put("fupdatetime", this.serialnumberemailsmtp.getFupdatetime().toString());
         }
        if(this.serialnumberemailsmtp.getFupdateuser()!=null && !this.serialnumberemailsmtp.getFupdateuser().equals("")){
			map.put("fupdateuser", this.serialnumberemailsmtp.getFupdateuser().toString());
         }
        if(this.serialnumberemailsmtp.getFremark()!=null && !this.serialnumberemailsmtp.getFremark().equals("")){
			map.put("fremark", this.serialnumberemailsmtp.getFremark().toString());
         }
        }
		
		return map;		
	}
    
	public String QuerySerialnumberEmailsmtp() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
        
        HashMap<String, String> map = this.GetQueryMap();
        
        try {
		List<SerialnumberEmailsmtp>  listSerialnumberEmailsmtp= this.serialnumberemailsmtpDao.ListSerialnumberEmailsmtp(offset, pagesize,map);
		
		int size = this.serialnumberemailsmtpDao.GetSerialnumberEmailsmtpCount(map);
				
		dataMap.put("rows", listSerialnumberEmailsmtp);
		dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	} 
    
 	public String FindSerialnumberEmailsmtp() {		    
		 if(this.serialnumberemailsmtp.getFsmtprecid() == null || this.serialnumberemailsmtp.getFsmtprecid().length() <= 0){		
			 
		 }else
		 {
			 this.serialnumberemailsmtp = this.serialnumberemailsmtpDao.findSerialnumberEmailsmtp(this.serialnumberemailsmtp.getFsmtprecid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("serialnumberemailsmtp", this.serialnumberemailsmtp);
			 
		 }
	     return SUCCESS;
	    
		} 
        
        
    public String DeleteSerialnumberEmailsmtp() {
        try {
		this.serialnumberemailsmtpDao
				.DeleteSerialnumberEmailsmtp(this.serialnumberemailsmtp.getFsmtprecid());

		this.message = "成功删除";
        } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}	
        
		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.serialnumberemailsmtp.getFsmtprecid());
		dataMap.put("errcode", this.errcode);
        dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}