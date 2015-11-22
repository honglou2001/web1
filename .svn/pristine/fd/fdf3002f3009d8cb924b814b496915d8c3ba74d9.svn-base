
package service;

import bean.Constants;
import com.users.ejb.BaseTypecode;
import dao.BaseTypecodeDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport; 

/**
 * <p>Title: ejb title </p>
 * <p>Description: t_base_typecode Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-6-5 15:24:22
 */

public class BaseTypecodeImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private BaseTypecodeDaoIml  basetypecodeDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private BaseTypecode basetypecode;
    private int page; 
    private int errcode;
    
    public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
   
	public BaseTypecode getBasetypecode() {
		return basetypecode;
	}

	public void setBasetypecode(BaseTypecode rbaseTypecodeInfo) {
		this.basetypecode =  rbaseTypecodeInfo;
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
    
    public BaseTypecodeDaoIml getBasetypecodeDao() {
		return basetypecodeDao;
	}
    
	public void setBasetypecodeDao (BaseTypecodeDaoIml rbasetypecodeDao) {		     
         this.basetypecodeDao = rbasetypecodeDao;
	}
       
	public String AddBaseTypecode() {	
    
    try {
 	  if(this.basetypecode.getFtypeid() == null || this.basetypecode.getFtypeid().length() <= 0){		
		  this.basetypecodeDao.Add(this.basetypecode);	
		  this.message ="新增成功";
	  }
      else
	  {
          this.basetypecodeDao.Update(this.basetypecode);	
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
		if(this.basetypecode!=null){
        if(this.basetypecode.getFtypeid()!=null && !this.basetypecode.getFtypeid().equals("")){
			map.put("ftypeid", this.basetypecode.getFtypeid().toString());
         }
        if(this.basetypecode.getFincreaseid()!=null && !this.basetypecode.getFincreaseid().equals("")){
			map.put("fincreaseid", this.basetypecode.getFincreaseid().toString());
         }
        if(this.basetypecode.getFname()!=null && !this.basetypecode.getFname().equals("")){
			map.put("fname", this.basetypecode.getFname().toString());
         }
        if(this.basetypecode.getFcode()!=null && !this.basetypecode.getFcode().equals("")){
			map.put("fcode", this.basetypecode.getFcode().toString());
         }
        if(this.basetypecode.getFvalue1()!=null && !this.basetypecode.getFvalue1().equals("")){
			map.put("fvalue1", this.basetypecode.getFvalue1().toString());
         }
        if(this.basetypecode.getFvalue2()!=null && !this.basetypecode.getFvalue2().equals("")){
			map.put("fvalue2", this.basetypecode.getFvalue2().toString());
         }
        if(this.basetypecode.getFvalue3()!=null && !this.basetypecode.getFvalue3().equals("")){
			map.put("fvalue3", this.basetypecode.getFvalue3().toString());
         }
        if(this.basetypecode.getFvalue4()!=null && !this.basetypecode.getFvalue4().equals("")){
			map.put("fvalue4", this.basetypecode.getFvalue4().toString());
         }
        if(this.basetypecode.getFvalue5()!=null && !this.basetypecode.getFvalue5().equals("")){
			map.put("fvalue5", this.basetypecode.getFvalue5().toString());
         }
        if(this.basetypecode.getFisdelete()!=null && !this.basetypecode.getFisdelete().equals("")){
			map.put("fisdelete", this.basetypecode.getFisdelete().toString());
         }
        if(this.basetypecode.getFcategory()!=null && !this.basetypecode.getFcategory().equals("")){
			map.put("fcategory", this.basetypecode.getFcategory().toString());
         }
        if(this.basetypecode.getFremark()!=null && !this.basetypecode.getFremark().equals("")){
			map.put("fremark", this.basetypecode.getFremark().toString());
         }
        if(this.basetypecode.getForder()!=null && !this.basetypecode.getForder().equals("")){
			map.put("forder", this.basetypecode.getForder().toString());
         }
        if(this.basetypecode.getFaddtime()!=null && !this.basetypecode.getFaddtime().equals("")){
			map.put("faddtime", this.basetypecode.getFaddtime().toString());
         }
        if(this.basetypecode.getFupdatetime()!=null && !this.basetypecode.getFupdatetime().equals("")){
			map.put("fupdatetime", this.basetypecode.getFupdatetime().toString());
         }
        }
		
		return map;		
	}
    
	public String QueryBaseTypecode() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
        
        HashMap<String, String> map = this.GetQueryMap();
        
        try {
		List<BaseTypecode>  listBaseTypecode= this.basetypecodeDao.GetAll(offset, pagesize,map);
		
		int size = this.basetypecodeDao.GetCount(map);
				
		dataMap.put("rows", listBaseTypecode);
		dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	} 
    
 	public String FindBaseTypecode() {		    
		 if(this.basetypecode.getFtypeid() == null || this.basetypecode.getFtypeid().length() <= 0){		
			 
		 }else
		 {
			 this.basetypecode = this.basetypecodeDao.Find(this.basetypecode.getFtypeid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("basetypecode", this.basetypecode);
			 
		 }
	     return SUCCESS;
	    
		} 
        
        
    public String DeleteBaseTypecode() {
        try {
		this.basetypecodeDao
				.Delete(this.basetypecode.getFtypeid());

		this.message = "成功删除";
        } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}	
        
		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.basetypecode.getFtypeid());
		dataMap.put("errcode", this.errcode);
        dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}
