package service;

import bean.Constants;
import com.users.ejb.ScmSalesdata;
import dao.ScmSalesdataDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport; 

/**
 * <p>Title: ejb title </p>
 * <p>Description: t_scm_salesdata Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-5-29 14:57:39
 */

public class ScmSalesdataImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private ScmSalesdataDaoIml  scmsalesdataDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private ScmSalesdata scmsalesdata;
    private int page; 
    private int errcode;
    
    public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
    
	public ScmSalesdata getScmsalesdata() {
		return scmsalesdata;
	}

	public void setScmsalesdata(ScmSalesdata rscmSalesdataInfo) {
		this.scmsalesdata =  rscmSalesdataInfo;
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
    
    public ScmSalesdataDaoIml getScmsalesdataDao() {
		return scmsalesdataDao;
	}
    
	public void setScmsalesdataDao (ScmSalesdataDaoIml rscmsalesdataDao) {		     
         this.scmsalesdataDao = rscmsalesdataDao;
	}
       

    
	public String AddScmSalesdata() {			    
	    try {
	 	  if(this.scmsalesdata.getFsaledataid() == null || this.scmsalesdata.getFsaledataid().length() <= 0){		
			  this.scmsalesdataDao.Add(this.scmsalesdata);	
			  this.message ="新增成功";
		  }
	      else
		  {
	          this.scmsalesdataDao.Update(this.scmsalesdata);	
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
		if(this.scmsalesdata!=null){
			if(scmsalesdata.getFdistributorid()!=null && scmsalesdata.getFdistributorid().length()>0){
				map.put("fdatebegin", scmsalesdata.getFdistributorid());	
			}
			if(scmsalesdata.getFsaledataid()!=null && scmsalesdata.getFsaledataid().length()>0){
				map.put("fdateend", scmsalesdata.getFsaledataid());
			}
			if(scmsalesdata.getFdistributor()!=null && scmsalesdata.getFdistributor().length()>0){
				map.put("fdistributor", scmsalesdata.getFdistributor());	
			}
			if(scmsalesdata.getFintroducer()!=null && scmsalesdata.getFintroducer().length()>0){
				map.put("fintroducer", scmsalesdata.getFintroducer());	
			}
			if(scmsalesdata.getFparentid()!=null && scmsalesdata.getFparentid().length()>0){
				map.put("fparentid", scmsalesdata.getFparentid());	
			}			
			
		}
		
		return map;		
	}
	
	public String QueryScmSalesdata() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
        try{
		HashMap<String, String> map = this.GetQueryMap();
		
		List<ScmSalesdata>  listScmSalesdata= this.scmsalesdataDao.GetAll(offset, pagesize,map);
		
		int size = this.scmsalesdataDao.GetCount(map);
				
		dataMap.put("rows", listScmSalesdata);
		dataMap.put("total", size);
		
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
		
		return SUCCESS;
	} 
    
 	public String FindScmSalesdata() {		    
		 if(this.scmsalesdata.getFsaledataid() == null || this.scmsalesdata.getFsaledataid().length() <= 0){		
			 
		 }else
		 {
			 this.scmsalesdata = this.scmsalesdataDao.Find(this.scmsalesdata.getFsaledataid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("scmsalesdata", this.scmsalesdata);
			 
		 }
	     return SUCCESS;
	    
		} 
        
        
    public String DeleteScmSalesdata() {
		this.scmsalesdataDao
				.Delete(this.scmsalesdata.getFsaledataid());

		this.message = "成功删除";

		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.scmsalesdata.getFsaledataid());
		dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}
