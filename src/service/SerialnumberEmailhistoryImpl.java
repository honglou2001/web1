
package service;

import bean.Constants;
import dao.SerialnumberEmailhistoryDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport; 
import com.watch.ejb.SerialnumberEmailhistory;

/**
 * <p>Title: ejb title </p>
 * <p>Description: t_serialnumber_emailhistory Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-12-20 12:54:55
 */

public class SerialnumberEmailhistoryImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private SerialnumberEmailhistoryDaoIml  serialnumberemailhistoryDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private SerialnumberEmailhistory serialnumberemailhistory;
    private int page; 
    private int errcode;
    
    public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
   
	public SerialnumberEmailhistory getSerialnumberemailhistory() {
		return serialnumberemailhistory;
	}

	public void setSerialnumberemailhistory(SerialnumberEmailhistory rserialnumberEmailhistoryInfo) {
		this.serialnumberemailhistory =  rserialnumberEmailhistoryInfo;
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
    
    public SerialnumberEmailhistoryDaoIml getSerialnumberemailhistoryDao() {
		return serialnumberemailhistoryDao;
	}
    
	public void setSerialnumberemailhistoryDao (SerialnumberEmailhistoryDaoIml rserialnumberemailhistoryDao) {		     
         this.serialnumberemailhistoryDao = rserialnumberemailhistoryDao;
	}
       
	public String AddSerialnumberEmailhistory() {	
    
    try {
 	  if(this.serialnumberemailhistory.getFemailrecid() == null || this.serialnumberemailhistory.getFemailrecid().length() <= 0){		
		  this.serialnumberemailhistoryDao.AddSerialnumberEmailhistory(this.serialnumberemailhistory);	
		  this.message ="新增成功";
	  }
      else
	  {
          this.serialnumberemailhistoryDao.UpdateSerialnumberEmailhistory(this.serialnumberemailhistory);	
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
//		if(this.serialnumberemailhistory!=null){
//        if(this.serialnumberemailhistory.getFemailrecid()!=null && !this.serialnumberemailhistory.getFemailrecid().equals("")){
//			map.put("femailrecid", this.serialnumberemailhistory.getFemailrecid().toString());
//         }
//        if(this.serialnumberemailhistory.getFtemplateid()!=null && !this.serialnumberemailhistory.getFtemplateid().equals("")){
//			map.put("ftemplateid", this.serialnumberemailhistory.getFtemplateid().toString());
//         }
//        if(this.serialnumberemailhistory.getFincreaseid()!=null && !this.serialnumberemailhistory.getFincreaseid().equals("")){
//			map.put("fincreaseid", this.serialnumberemailhistory.getFincreaseid().toString());
//         }
//        if(this.serialnumberemailhistory.getFappid()!=null && !this.serialnumberemailhistory.getFappid().equals("")){
//			map.put("fappid", this.serialnumberemailhistory.getFappid().toString());
//         }
//        if(this.serialnumberemailhistory.getFuserid()!=null && !this.serialnumberemailhistory.getFuserid().equals("")){
//			map.put("fuserid", this.serialnumberemailhistory.getFuserid().toString());
//         }
//        if(this.serialnumberemailhistory.getFsnid()!=null && !this.serialnumberemailhistory.getFsnid().equals("")){
//			map.put("fsnid", this.serialnumberemailhistory.getFsnid().toString());
//         }
//        if(this.serialnumberemailhistory.getFsnnumber()!=null && !this.serialnumberemailhistory.getFsnnumber().equals("")){
//			map.put("fsnnumber", this.serialnumberemailhistory.getFsnnumber().toString());
//         }
//        if(this.serialnumberemailhistory.getFlanguage()!=null && !this.serialnumberemailhistory.getFlanguage().equals("")){
//			map.put("flanguage", this.serialnumberemailhistory.getFlanguage().toString());
//         }
//        if(this.serialnumberemailhistory.getFtag()!=null && !this.serialnumberemailhistory.getFtag().equals("")){
//			map.put("ftag", this.serialnumberemailhistory.getFtag().toString());
//         }
//        if(this.serialnumberemailhistory.getFtitle()!=null && !this.serialnumberemailhistory.getFtitle().equals("")){
//			map.put("ftitle", this.serialnumberemailhistory.getFtitle().toString());
//         }
//        if(this.serialnumberemailhistory.getFtoaddress()!=null && !this.serialnumberemailhistory.getFtoaddress().equals("")){
//			map.put("ftoaddress", this.serialnumberemailhistory.getFtoaddress().toString());
//         }
//        if(this.serialnumberemailhistory.getFfromaddress()!=null && !this.serialnumberemailhistory.getFfromaddress().equals("")){
//			map.put("ffromaddress", this.serialnumberemailhistory.getFfromaddress().toString());
//         }
//        if(this.serialnumberemailhistory.getFtype()!=null && !this.serialnumberemailhistory.getFtype().equals("")){
//			map.put("ftype", this.serialnumberemailhistory.getFtype().toString());
//         }
//        if(this.serialnumberemailhistory.getFcontent()!=null && !this.serialnumberemailhistory.getFcontent().equals("")){
//			map.put("fcontent", this.serialnumberemailhistory.getFcontent().toString());
//         }
//        if(this.serialnumberemailhistory.getFaattachment()!=null && !this.serialnumberemailhistory.getFaattachment().equals("")){
//			map.put("faattachment", this.serialnumberemailhistory.getFaattachment().toString());
//         }
//        if(this.serialnumberemailhistory.getFdatastatus()!=null && !this.serialnumberemailhistory.getFdatastatus().equals("")){
//			map.put("fdatastatus", this.serialnumberemailhistory.getFdatastatus().toString());
//         }
//        if(this.serialnumberemailhistory.getFfieldstatus()!=null && !this.serialnumberemailhistory.getFfieldstatus().equals("")){
//			map.put("ffieldstatus", this.serialnumberemailhistory.getFfieldstatus().toString());
//         }
//        if(this.serialnumberemailhistory.getFaddtime()!=null && !this.serialnumberemailhistory.getFaddtime().equals("")){
//			map.put("faddtime", this.serialnumberemailhistory.getFaddtime().toString());
//         }
//        if(this.serialnumberemailhistory.getFupdatetime()!=null && !this.serialnumberemailhistory.getFupdatetime().equals("")){
//			map.put("fupdatetime", this.serialnumberemailhistory.getFupdatetime().toString());
//         }
//        if(this.serialnumberemailhistory.getFremark()!=null && !this.serialnumberemailhistory.getFremark().equals("")){
//			map.put("fremark", this.serialnumberemailhistory.getFremark().toString());
//         }
//        }
//		
		return map;		
	}
    
	public String QuerySerialnumberEmailhistory() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
        
        HashMap<String, String> map = this.GetQueryMap();
        
        try {
		List<SerialnumberEmailhistory>  listSerialnumberEmailhistory= this.serialnumberemailhistoryDao.ListSerialnumberEmailhistory(offset, pagesize,map);
		
		int size = this.serialnumberemailhistoryDao.GetSerialnumberEmailhistoryCount(map);
				
		dataMap.put("rows", listSerialnumberEmailhistory);
		dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	} 
    
 	public String FindSerialnumberEmailhistory() {		    
		 if(this.serialnumberemailhistory.getFemailrecid() == null || this.serialnumberemailhistory.getFemailrecid().length() <= 0){		
			 
		 }else
		 {
			 this.serialnumberemailhistory = this.serialnumberemailhistoryDao.findSerialnumberEmailhistory(this.serialnumberemailhistory.getFemailrecid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("serialnumberemailhistory", this.serialnumberemailhistory);
			 
		 }
	     return SUCCESS;
	    
		} 
        
        
    public String DeleteSerialnumberEmailhistory() {
        try {
		this.serialnumberemailhistoryDao
				.DeleteSerialnumberEmailhistory(this.serialnumberemailhistory.getFemailrecid());

		this.message = "成功删除";
        } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}	
        
		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.serialnumberemailhistory.getFemailrecid());
		dataMap.put("errcode", this.errcode);
        dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}
