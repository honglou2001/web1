
package service;

import bean.Constants;

import dao.SerialnumberEmailtemplateDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
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
//		if(this.serialnumberemailtemplate!=null){
//        if(this.serialnumberemailtemplate.getFtemplateid()!=null && !this.serialnumberemailtemplate.getFtemplateid().equals("")){
//			map.put("ftemplateid", this.serialnumberemailtemplate.getFtemplateid().toString());
//         }
//        if(this.serialnumberemailtemplate.getFincreaseid()!=null && !this.serialnumberemailtemplate.getFincreaseid().equals("")){
//			map.put("fincreaseid", this.serialnumberemailtemplate.getFincreaseid().toString());
//         }
//        if(this.serialnumberemailtemplate.getFappid()!=null && !this.serialnumberemailtemplate.getFappid().equals("")){
//			map.put("fappid", this.serialnumberemailtemplate.getFappid().toString());
//         }
//        if(this.serialnumberemailtemplate.getFuserid()!=null && !this.serialnumberemailtemplate.getFuserid().equals("")){
//			map.put("fuserid", this.serialnumberemailtemplate.getFuserid().toString());
//         }
//        if(this.serialnumberemailtemplate.getFsnid()!=null && !this.serialnumberemailtemplate.getFsnid().equals("")){
//			map.put("fsnid", this.serialnumberemailtemplate.getFsnid().toString());
//         }
//        if(this.serialnumberemailtemplate.getFsnnumber()!=null && !this.serialnumberemailtemplate.getFsnnumber().equals("")){
//			map.put("fsnnumber", this.serialnumberemailtemplate.getFsnnumber().toString());
//         }
//        if(this.serialnumberemailtemplate.getFtag()!=null && !this.serialnumberemailtemplate.getFtag().equals("")){
//			map.put("ftag", this.serialnumberemailtemplate.getFtag().toString());
//         }
//        if(this.serialnumberemailtemplate.getFtitle()!=null && !this.serialnumberemailtemplate.getFtitle().equals("")){
//			map.put("ftitle", this.serialnumberemailtemplate.getFtitle().toString());
//         }
//        if(this.serialnumberemailtemplate.getFtype()!=null && !this.serialnumberemailtemplate.getFtype().equals("")){
//			map.put("ftype", this.serialnumberemailtemplate.getFtype().toString());
//         }
//        if(this.serialnumberemailtemplate.getFcontent()!=null && !this.serialnumberemailtemplate.getFcontent().equals("")){
//			map.put("fcontent", this.serialnumberemailtemplate.getFcontent().toString());
//         }
//        if(this.serialnumberemailtemplate.getFlanguage()!=null && !this.serialnumberemailtemplate.getFlanguage().equals("")){
//			map.put("flanguage", this.serialnumberemailtemplate.getFlanguage().toString());
//         }
//        if(this.serialnumberemailtemplate.getFdatastatus()!=null && !this.serialnumberemailtemplate.getFdatastatus().equals("")){
//			map.put("fdatastatus", this.serialnumberemailtemplate.getFdatastatus().toString());
//         }
//        if(this.serialnumberemailtemplate.getFfieldstatus()!=null && !this.serialnumberemailtemplate.getFfieldstatus().equals("")){
//			map.put("ffieldstatus", this.serialnumberemailtemplate.getFfieldstatus().toString());
//         }
//        if(this.serialnumberemailtemplate.getFaddtime()!=null && !this.serialnumberemailtemplate.getFaddtime().equals("")){
//			map.put("faddtime", this.serialnumberemailtemplate.getFaddtime().toString());
//         }
//        if(this.serialnumberemailtemplate.getFupdatetime()!=null && !this.serialnumberemailtemplate.getFupdatetime().equals("")){
//			map.put("fupdatetime", this.serialnumberemailtemplate.getFupdatetime().toString());
//         }
//        if(this.serialnumberemailtemplate.getFremark()!=null && !this.serialnumberemailtemplate.getFremark().equals("")){
//			map.put("fremark", this.serialnumberemailtemplate.getFremark().toString());
//         }
//        }
		
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
