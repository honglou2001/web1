package service;


import bean.Constants;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.PushPayload;

import com.RestTest;
import com.users.ejb.SerialnumberApiphone;
import com.users.ejb.SerialnumberFee;
import com.users.ejb.SerialnumberJpush;
import com.watch.ejb.Serialnumber;
import com.watch.ejb.SerialnumberJpushmsg;

import dao.SerialnumberApiphoneDaoIml;
import dao.SerialnumberDaoIml;
import dao.SerialnumberFeeDaoIml;
import dao.SerialnumberJpushDaoIml;
import dao.SerialnumberJpushmsgDaoIml;
import domain.ApiResponse;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport; 

/**
 * <p>Title: ejb title </p>
 * <p>Description: serialnumber Client Service 处理类</p>
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间  2015-9-5 10:58:53
 */

public class SerialnumberImpl extends ActionSupport {	
    private static final long serialVersionUID = 1L;
    private SerialnumberDaoIml  serialnumberDao;  
    private Map<String,Object> dataMap;
    private String message;     
    private Serialnumber serialnumber;
    private int page; 
    private int errcode;
    private String getIsReg;
    private String getIsOnline;
    private String chargefee;
    
    //消息推送标题及内容
    private String pushmsgtitle;
	private String pushmsgcontent;


	private String clientnumber ;
    
    private static final String acountid = "ab9abe2cacfc9a5a2829f2222993018a";
    private static final String token = "91b6bc5e40148c2a74335d2b730b8c2c";
    private static final String appid = "a8c88624ad064474a59225609832c505";
    
    public String getGetIsOnline() {
		return getIsOnline;
	}

	public void setGetIsOnline(String getIsOnline) {
		this.getIsOnline = getIsOnline;
	}

	public String getGetIsReg() {
		return getIsReg;
	}

	public void setGetIsReg(String getIsReg) {
		this.getIsReg = getIsReg;
	}

	public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
   
	public Serialnumber getSerialnumber() {
		return serialnumber;
	}

	public void setSerialnumber(Serialnumber rserialnumberInfo) {
		this.serialnumber =  rserialnumberInfo;
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
    
    public String getChargefee() {
		return chargefee;
	}

	public void setChargefee(String chargefee) {
		this.chargefee = chargefee;
	}
	
    public String getPushmsgtitle() {
		return pushmsgtitle;
	}

	public void setPushmsgtitle(String pushmsgtitle) {
		this.pushmsgtitle = pushmsgtitle;
	}

	public String getPushmsgcontent() {
		return pushmsgcontent;
	}

	public void setPushmsgcontent(String pushmsgcontent) {
		this.pushmsgcontent = pushmsgcontent;
	}

	
    public SerialnumberDaoIml getSerialnumberDao() {
		return serialnumberDao;
	}
    
	public void setSerialnumberDao (SerialnumberDaoIml rserialnumberDao) {		     
         this.serialnumberDao = rserialnumberDao;
	}
	
       
	public String AddSerialnumber() {	
    
    try {
 	  if(this.serialnumber.getFuniqueid() == null || this.serialnumber.getFuniqueid().length() <= 0){		
		  this.serialnumberDao.Add(this.serialnumber);	
		  this.message ="新增成功";
	  }
      else
	  {
          this.serialnumberDao.Update(this.serialnumber);	
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
  
	public String UpdateSnPhoneNumber() {	
	    
		boolean bSuccess = true;
	    try {
	 	  if(this.serialnumber.getFuniqueid() == null || this.serialnumber.getFuniqueid().length() <= 0){		
	 		 bSuccess = false;
	 		  this.message ="更新失败，序列号id为空";
		  }
	      else
		  {
	    	 HashMap<String, String> mapUpdate = new HashMap<String, String>();
	    	 mapUpdate.put("actionType", "1");
	    		
	          this.serialnumberDao.Update(this.serialnumber,mapUpdate);	
			  this.message ="更新成功";
		  }     
	      } catch (RuntimeException ex) {
			  this.message = ex.getMessage();
			  this.errcode = ex.hashCode();
		   }
		  
		  dataMap = new HashMap<String, Object>();
	      dataMap.put("errcode", this.errcode);
		  dataMap.put("success", bSuccess);
		  dataMap.put("message", this.message);
		  
		  return SUCCESS;   			
		}
	
	private HashMap<String, String> GetQueryMap()
	{				
        HashMap<String, String> map = new HashMap<String, String>();
        
        if(getIsReg !=null && !getIsReg.equals(""))
        {
        	map.put("getIsReg", getIsReg);
        }
        if(getIsOnline !=null && !getIsOnline.equals(""))
        {
        	map.put("getIsOnline", getIsOnline);
        }   
        
        if(this.serialnumber.getSerialnumber()!=null && !this.serialnumber.getSerialnumber().equals(""))
        {
        	map.put("sn.serialnumber", this.serialnumber.getSerialnumber());
        }
        
        if(this.serialnumber.getFphonenum()!=null && !this.serialnumber.getFphonenum().equals(""))
        {
        	map.put("sn.fphonenum", this.serialnumber.getFphonenum());
        }
        		
		return map;		
	}
    
	public String QuerySerialnumber() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = 12;//Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
        
        HashMap<String, String> map = this.GetQueryMap();
        
        try {
		List<Serialnumber>  listSerialnumber= this.serialnumberDao.GetAll(offset, pagesize,map);
		
		int size = this.serialnumberDao.GetCountAll(map);
				
		dataMap.put("rows", listSerialnumber);
		dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	} 
	
	public String QuerySerialnumberFee() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = 12;//Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
                
        SerialnumberFeeDaoIml feeDao = new SerialnumberFeeDaoIml();       
        HashMap<String, String> mapSerial = new HashMap<String, String>();
		mapSerial.put("FSNID",  this.serialnumber.getFuniqueid());
        
        try {
		
			List<SerialnumberFee> listFee = feeDao.ListSerialnumberFee(offset,pagesize,mapSerial);					
			int size =feeDao.GetSerialnumberFeeCount(mapSerial);
					
			dataMap.put("rows", listFee);
			dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	} 
	public String QueryPushMsg() {
		dataMap = new HashMap<String, Object>();		
		int offset = this.getPage();		
		
		int pagesize = 12;//Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
                
        SerialnumberFeeDaoIml feeDao = new SerialnumberFeeDaoIml();       
        HashMap<String, String> mapSerial = new HashMap<String, String>();
		mapSerial.put("FSNID",  this.serialnumber.getFuniqueid());
        
        try {
		
			List<SerialnumberFee> listFee = feeDao.ListSerialnumberFee(offset,pagesize,mapSerial);					
			int size =feeDao.GetSerialnumberFeeCount(mapSerial);
					
			dataMap.put("rows", listFee);
			dataMap.put("total", size);
        
 	    } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}  
        
        dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);
        
		return SUCCESS;
	}
	public String PushMsgToAPP() {	
		
		boolean bSuccess = true;
	    try {
	 	  if(this.serialnumber.getFusrid() == null || this.serialnumber.getFusrid().length() <= 0){		
	 		 bSuccess = false;
	 		 this.message ="推送信息失败，app用户id为空";
		  }
	 	  else if(pushmsgtitle == null || pushmsgtitle.length() <= 0){		
		 		 bSuccess = false;
		 		 this.message ="推送信息失败，分类标题为空";
			  }
	 	  else if(pushmsgcontent == null || pushmsgcontent.length() <= 0){		
		 		 bSuccess = false;
		 		 this.message ="推送信息失败，推送内容为空";
			  }
	      else{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("FUserID", this.serialnumber.getFusrid());
				
				SerialnumberJpushDaoIml pushCheckDao = new SerialnumberJpushDaoIml();
				List<SerialnumberJpush> configLists = pushCheckDao.ListSerialnumberJpush(0, 100, map);
				
				if(configLists==null || configLists.size()==0){
					 bSuccess = false;
					 this.message ="推送信息失败，检查到此序列号尚未使用服务器分配的别名";	
				}
				else{
	    	 	    
					SerialnumberJpush pushConfig = configLists.get(0);
					
					String toalias = pushConfig.getFalias();
					
					
					PushClient pushClient = new PushClient(Constants.MASTER_SECRET, Constants.APP_KEY);
				    PushResult result =null;
				        
		        	PushPayload payload=JPushClient.buildPushObject_allAlias_audienceMore_alertWithExtras(toalias,pushmsgtitle,pushmsgcontent);
		        	try {
						result =pushClient.sendPush(payload);
						
						if(result.isResultOK()){
				        	
							 
					    	 SerialnumberJpushmsgDaoIml pushdao = new SerialnumberJpushmsgDaoIml();
					    	 SerialnumberJpushmsg pushmsg = new SerialnumberJpushmsg();
					    	 
					    	 pushmsg.setFuserid(this.serialnumber.getFusrid());
					    	 pushmsg.setFtitle(pushmsgtitle);
					    	 pushmsg.setFcontent(pushmsgcontent);
					    	 
					    	 pushdao.AddSerialnumberJpushmsg(pushmsg);
					    	 
					    	 bSuccess = true;	
							 this.message ="成功发送推送消息";
			        	}else
			        	{
			        		 bSuccess = false;	
							 this.message ="调用接口返回失败，返回代码:"+result.getResponseCode();
			        	}
						
					} catch (APIConnectionException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						 bSuccess = false;	
						 this.message ="调用接口APIConnectionException异常，返回信息:"+ e.getMessage();
						 
					} catch (APIRequestException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						
						 bSuccess = false;	
						 this.message ="调用接口APIRequestException异常，返回信息:"+ e.getErrorMessage();
					}		        			        			        	
		        
				}
		  }     
	      } catch (RuntimeException ex) {
	    	  bSuccess = false;
			  this.message = ex.getMessage();
			  this.errcode = ex.hashCode();
		   }
		  
		  dataMap = new HashMap<String, Object>();
	      dataMap.put("errcode", this.errcode);
		  dataMap.put("success", bSuccess);
		  dataMap.put("message", this.message);
		  
		  return SUCCESS;   			
		}
 	public String FindSerialnumber() {		    
		 if(this.serialnumber.getFuniqueid() == null || this.serialnumber.getFuniqueid().length() <= 0){		
			 
		 }else
		 {
			 this.serialnumber = this.serialnumberDao.find(this.serialnumber.getFuniqueid());
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("serialnumber", this.serialnumber);
			 
		 }
	     return SUCCESS;
	    
		} 
        
 	private void GetExixtNumber(String phonenum)
 	{
 		 SerialnumberApiphoneDaoIml apiPhoneDao = new SerialnumberApiphoneDaoIml();
 		 
 		String result1 =RestTest.testfindClientByMobile(true, acountid,token, phonenum, appid);
		
		JSONObject jsonObject1 = JSONObject.fromObject(result1);
		String resp1 = jsonObject1.getString("resp");
		JSONObject respObj1 = JSONObject.fromObject(resp1);
		String respCode1 = respObj1.getString("respCode");
		
		if(result1.indexOf("00000")>0)
		{
			String clientInfo = respObj1.getString("client");
			JSONObject infoObject = JSONObject.fromObject(clientInfo);					
			ApiResponse info=(ApiResponse)JSONObject.toBean(infoObject, ApiResponse.class);
			
			HashMap<String, String> map1 = new HashMap<String, String>();
			map1.put("FClientNumber", info.getClientNumber());
			
			List<SerialnumberApiphone> listApi_1 = apiPhoneDao.ListSerialnumberApiphone(0, 1, map1);
			
			if(listApi_1==null ||listApi_1.size()==0)
			{
				SerialnumberApiphone apiObj = new SerialnumberApiphone();
				apiObj.setFappid(appid);
				apiObj.setFclientnumber(String.valueOf(info.getClientNumber()));
				apiObj.setFclientpwd(info.getClientPwd());
				apiObj.setFbalance(info.getBalance());
				apiObj.setFclienttype(info.getClientType());

							
				apiObj.setFcreatedate(Timestamp.valueOf(info.getCreateDate()));						
				apiObj.setFmobile(info.getMobile());
				apiObj.setFremark(apiObj.getFremark()+"_创建返回 103114 后新增");				
				apiPhoneDao.AddSerialnumberApiphone(apiObj);
				
				this.message = "成功查询已创建的云之迅通讯客户端端号码\n接口返回编码："+respCode1+";客户端号码为："+ apiObj.getFclientnumber();
				this.dataMap.put("success", true);

			}
			else
			{
				SerialnumberApiphone apiObj  = listApi_1.get(0);
				
				this.message = "创建返回 103114 后新增失败，此客户端号码已经存在："+respCode1+";客户端号码为："+ apiObj.getFclientnumber()+",对应电话号码为："+apiObj.getFmobile();
				this.dataMap.put("success", false);								

			}										
		}
		else
		{
			 this.message = "创建返回 103114 后查询，接口返回错误信息："+respCode1;
			 this.dataMap.put("success", false);		
		}	
		 this.dataMap.put("errcode", this.errcode);
		 this.dataMap.put("message", this.message);	
		 this.dataMap.put("clientnumber","");

 	}
 	public String GetClientNumber() {		    
		 if(this.serialnumber.getFuniqueid() == null || this.serialnumber.getFuniqueid().length() <= 0){		
			 
		 }else
		 {
			 
			 boolean bSuccess = true;
			 this.serialnumber = this.serialnumberDao.find(this.serialnumber.getFuniqueid());
			 
			 dataMap = new HashMap<String, Object>();		
			 			 
			 if( this.serialnumber.getFphonenum()!=null &&  !this.serialnumber.getFphonenum().equals(""))
			 {
				 SerialnumberApiphoneDaoIml apiPhoneDao = new SerialnumberApiphoneDaoIml();
				 
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("FMobile", this.serialnumber.getFphonenum());								
					List<SerialnumberApiphone> listApi = apiPhoneDao.ListSerialnumberApiphone(0, 1, map);					
					if(listApi!=null && listApi.size()>0)
						
					{
						this.clientnumber = listApi.get(0).getFclientnumber();
						this.message =  "已经存在此手机号码的云平台的客户端号\n电话号码为："
								+ this.serialnumber.getFphonenum()
								+ ",客户端号码为："+this.clientnumber;
						
					}else
					{											
						String clientType= "1";
						String phonenum =  this.serialnumber.getFphonenum();
						
						if(this.chargefee != null && !this.chargefee.equals("")){
							
							String[] args11={"2","json",acountid,token,appid,phonenum,clientType,chargefee,phonenum,"","",""};							
							try{
								String result =RestTest.testCreateClient(true, args11[2], args11[3], args11[4], args11[5], args11[6], args11[7], args11[8]);							
								JSONObject jsonObject = JSONObject.fromObject(result);
								String resp = jsonObject.getString("resp");
								JSONObject respObj = JSONObject.fromObject(resp);
								String respCode = respObj.getString("respCode");
								
								//同一应用下同一手机号只能绑定一次
								if(respCode.equals("103114"))
								{
									this.GetExixtNumber(phonenum);
									
									return SUCCESS;
								}
								
								
								if(result.indexOf("00000")>0)
								{
									String clientInfo = respObj.getString("client");
									JSONObject infoObject = JSONObject.fromObject(clientInfo);					
									ApiResponse info=(ApiResponse)JSONObject.toBean(infoObject, ApiResponse.class);
									
									SerialnumberApiphone apiObj = new SerialnumberApiphone();
									apiObj.setFappid(appid);
									apiObj.setFclientnumber(String.valueOf(info.getClientNumber()));
									apiObj.setFclientpwd(info.getClientPwd());
									apiObj.setFbalance(info.getBalance());
									apiObj.setFclienttype(clientType);				
									apiObj.setFcreatedate(Timestamp.valueOf(info.getCreateDate()));								
									apiObj.setFmobile(phonenum);
									apiPhoneDao.AddSerialnumberApiphone(apiObj);
									this.message = "成功申请云之迅通讯客户端端号码\n接口返回编码："+respCode+";客户端号码为："+ apiObj.getFclientnumber();
									bSuccess = true;	
									this.clientnumber =  apiObj.getFclientnumber();
								}
								else
								{	
									this.message = "创建失败，接口返回不成功,接口返回编码："+respCode;
									bSuccess = false;	
								}	
							}
							catch(Exception ex)
							{
								 this.message = ex.toString();
								 dataMap.put("success", false);
								 dataMap.put("errcode", this.errcode);
								 dataMap.put("message", this.message);	
								 dataMap.put("clientnumber","");
								 return SUCCESS;
								 
							}
													
						}
						else
						{
							this.message = "充值费用不能为空";
							bSuccess =false;
						}											
					}				 				 
				 dataMap.put("success", bSuccess);
				 dataMap.put("message", this.message);	
				 dataMap.put("errcode", this.errcode);
				 dataMap.put("clientnumber",this.clientnumber);
			 }
			 else
			 {
				 this.message = "此序列号尚未设置电话号码";
				 dataMap.put("success", false);
				 dataMap.put("errcode", this.errcode);
				 dataMap.put("message", this.message);	
				 dataMap.put("clientnumber","");
			 }					 
		 }
	     return SUCCESS;
	    
		} 
        
    public String DeleteSerialnumber() {
        try {
		this.serialnumberDao
				.Delete(this.serialnumber.getFuniqueid());

		this.message = "成功删除";
        } catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}	
        
		dataMap = new HashMap<String, Object>();
		dataMap.put("id", this.serialnumber.getFuniqueid());
		dataMap.put("errcode", this.errcode);
        dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}
    
	public String List() {		 
	    return SUCCESS;
	}
}