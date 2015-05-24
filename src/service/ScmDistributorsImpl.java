
package service;

import bean.Constants;
import com.users.ejb.ScmDistributors;
import dao.ScmDistributorsDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport; 

/**
 * <p>Title: ejb title </p>
 * <p>Description: t_scm_distributors Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-5-24 15:23:39
 */

public class ScmDistributorsImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private ScmDistributorsDaoIml  scmdistributorsDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private ScmDistributors scmdistributors;
    private int page; 
    
	public ScmDistributors getScmdistributors() {
		return scmdistributors;
	}

	public void setScmdistributors(ScmDistributors rscmDistributorsInfo) {
		this.scmdistributors =  rscmDistributorsInfo;
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
    
    public ScmDistributorsDaoIml getScmdistributorsDao() {
		return scmdistributorsDao;
	}
    
	public void setScmdistributorsDao (ScmDistributorsDaoIml rscmdistributorsDao) {		     
         this.scmdistributorsDao = rscmdistributorsDao;
	}
       
	public String AddScmDistributors() {	
    
 	  if(this.scmdistributors.getFdistributorid() == null || this.scmdistributors.getFdistributorid().length() <= 0){		
		  this.scmdistributorsDao.Add(this.scmdistributors);	
		  this.message ="新增成功";
	  }
      else
	  {
          this.scmdistributorsDao.Update(this.scmdistributors);	
		  this.message ="更新成功";
	  }
	  
	  dataMap = new HashMap<String, Object>();
	  dataMap.put("success", true);
	  dataMap.put("message", this.message);
	  
	  return SUCCESS;   			
	}
  
	public String QueryScmDistributors() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
		
		List<ScmDistributors>  listScmDistributors= this.scmdistributorsDao.GetAll(offset, pagesize);
		
		int size = this.scmdistributorsDao.GetCount();
				
		dataMap.put("rows", listScmDistributors);
		dataMap.put("total", size);
		return SUCCESS;
	} 
    
 	public String FindScmDistributors() {		    
		 if(this.scmdistributors.getFdistributorid() == null || this.scmdistributors.getFdistributorid().length() <= 0){		
			 
		 }else
		 {
			 this.scmdistributors = this.scmdistributorsDao.Find(this.scmdistributors.getFdistributorid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("scmdistributors", this.scmdistributors);
			 
		 }
	     return SUCCESS;
	    
		} 
        
        
    public String DeleteScmDistributors() {
		this.scmdistributorsDao
				.Delete(this.scmdistributors.getFdistributorid());

		this.message = "成功删除";

		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.scmdistributors.getFdistributorid());
		dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}
