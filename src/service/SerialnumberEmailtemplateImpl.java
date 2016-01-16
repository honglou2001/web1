
package service;

import bean.Constants;

import dao.SerialnumberEmailtemplateDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import utils.SendMailUtil;

import com.opensymphony.xwork2.ActionSupport; 
import com.watch.ejb.SerialnumberEmailtemplate;

/**
 * <p>Title: ejb title </p>
 * <p>Description: t_serialnumber_emailtemplate Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-12-20 12:52:08
 */

public class SerialnumberEmailtemplateImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private SerialnumberEmailtemplateDaoIml  serialnumberemailtemplateDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private SerialnumberEmailtemplate serialnumberemailtemplate;
    private int page; 
    private int errcode;
    private String ftoEmail;
    
    public String getFtoEmail() {
		return ftoEmail;
	}

	public void setFtoEmail(String ftoEmail) {
		this.ftoEmail = ftoEmail;
	}

	public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
   
	public SerialnumberEmailtemplate getSerialnumberemailtemplate() {
		return serialnumberemailtemplate;
	}

	public void setSerialnumberemailtemplate(SerialnumberEmailtemplate rserialnumberEmailtemplateInfo) {
		this.serialnumberemailtemplate =  rserialnumberEmailtemplateInfo;
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
    
    public SerialnumberEmailtemplateDaoIml getSerialnumberemailtemplateDao() {
		return serialnumberemailtemplateDao;
	}
    
	public void setSerialnumberemailtemplateDao (SerialnumberEmailtemplateDaoIml rserialnumberemailtemplateDao) {		     
         this.serialnumberemailtemplateDao = rserialnumberemailtemplateDao;
	}
      
	
	public String SendEmail() {	
	    
		 dataMap = new HashMap<String, Object>();
		 
	    try {
		 	  if(this.serialnumberemailtemplate.getFtemplateid() == null || this.serialnumberemailtemplate.getFtemplateid().length() <= 0){		
				 	
		 		 this.message ="发送失败，模板id为空，请先保存模板，关闭此页面，然后点击模板修改到此界面再发送";
		 		 dataMap.put("success", false);
			  }
		      else
			  {	          	          
		          SendMailUtil sender = new SendMailUtil(this.ftoEmail,this.serialnumberemailtemplate)  ;
		          boolean result =  sender.SendEmail();
		          if(result){
			          this.message ="发送成功";
			          dataMap.put("success", true);
		          }else
		          {
		        	    this.message ="发送失败";
				        dataMap.put("success", false);
		          }
			  }     
	      } catch (Exception ex) {
	    	  dataMap.put("success", false);
			  this.message = ex.getMessage();
			  this.errcode = ex.hashCode();
		   }
		  		 
	      dataMap.put("errcode", this.errcode);		 
		  dataMap.put("message", this.message);
		  
		  return SUCCESS;   			
		}
	
	public String AddSerialnumberEmailtemplate() {	
    
    try {
 	  if(this.serialnumberemailtemplate.getFtemplateid() == null || this.serialnumberemailtemplate.getFtemplateid().length() <= 0){		
		  this.serialnumberemailtemplateDao.AddSerialnumberEmailtemplate(this.serialnumberemailtemplate);	
		  this.message ="新增成功";
	  }
      else
	  {
          this.serialnumberemailtemplateDao.UpdateSerialnumberEmailtemplate(this.serialnumberemailtemplate);	
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

		
		return map;		
	}
    
	public String QuerySerialnumberEmailtemplate() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
        
        HashMap<String, String> map = this.GetQueryMap();
        
        try {
		List<SerialnumberEmailtemplate>  listSerialnumberEmailtemplate= this.serialnumberemailtemplateDao.ListSerialnumberEmailtemplate(offset, pagesize,map);
		
		int size = this.serialnumberemailtemplateDao.GetSerialnumberEmailtemplateCount(map);
				
		dataMap.put("rows", listSerialnumberEmailtemplate);
		dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	} 
    
 	public String FindSerialnumberEmailtemplate() {		    
		 if(this.serialnumberemailtemplate.getFtemplateid() == null || this.serialnumberemailtemplate.getFtemplateid().length() <= 0){		
			 
		 }else
		 {
			 this.serialnumberemailtemplate = this.serialnumberemailtemplateDao.findSerialnumberEmailtemplate(this.serialnumberemailtemplate.getFtemplateid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("serialnumberemailtemplate", this.serialnumberemailtemplate);
			 
		 }
	     return SUCCESS;
	    
		} 
        
        
    public String DeleteSerialnumberEmailtemplate() {
        try {
		this.serialnumberemailtemplateDao
				.DeleteSerialnumberEmailtemplate(this.serialnumberemailtemplate.getFtemplateid());

		this.message = "成功删除";
        } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}	
        
		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.serialnumberemailtemplate.getFtemplateid());
		dataMap.put("errcode", this.errcode);
        dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}
