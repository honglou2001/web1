package service;


import com.opensymphony.xwork2.ActionSupport;
import java.util.Collection;
import java.util.List;
import java.util.HashMap;  
import java.util.Map;  
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
//import domain.User;
import dao.UserDaoIml;
import bean.Constants;

import com.users.ejb.User;


public class UserServiceImpl extends ActionSupport implements  UserService   {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//UserDaoIml daoUser = new UserDaoIml();
	private User user;
	private String fid;
	
	private UserDaoIml userDao;
	 private String message;  
	private Map<String,Object> dataMap;
	
	private int page; //��ʼ��¼��λ��//ÿҳ��ʾ�ļ�¼��
					
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
		
	public void setUserDao(UserDaoIml ruserDao) {
		this.userDao = ruserDao;
	}

	public UserDaoIml getUserDao() {
		return userDao;
	}
	
	private Collection<User> users;
			
	public Collection<User> getUsers() {
	    return users;
	}

	public void setUsers(Collection<User> users) {
	     this.users = users;
	}
	
	public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    public void setFid(String fid) {
        this.fid = fid;
    }
    
	public String getFid() {
        return fid;
    }
	
	  public String getMessage() {  
        return message;  
    }  
  
    public void setMessage(String message) {  
        this.message = message;  
    } 
	
	
	public String json() {
		// dataMap�е���ݽ��ᱻStruts2ת����JSON�ַ���������Ҫ��������е����
		dataMap = new HashMap<String, Object>();		
//		Collection<User> jsusr = new ArrayList<User>(); 
		
		if(user!=null)
		{
			System.out.println(user.getName());
			System.out.println(user.getMobile());
		}
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI();
		String queryInfo=request.getQueryString();
		System.out.println(path);
		System.out.println("�����URL"+path +queryInfo);
				       
		int offset = this.getPage();
		
		System.out.println("offset:"+offset);
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>0){
			offset = (offset-1) * pagesize;
		}
		
		users = userDao.getAll(offset, pagesize);
		
		int size = userDao.GetUserCount();
				
		dataMap.put("rows", users);
		// ����һ���Ƿ�����ɹ��ı�ʶ
		dataMap.put("total", size);
		// ���ؽ��
		return SUCCESS;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	@Override
	public String ListUsers() {
		
		 
	    return SUCCESS;
	}
	
	@Override
	public String GetOneUser() {
		 if(fid == null || fid.length() <= 0){		
			 
		 }else
		 {
			 user = userDao.find(fid);
			 
			 dataMap = new HashMap<String, Object>();		
			 dataMap.put("user", user);
			 
		 }
	    return SUCCESS;
	}
	@Override
	public String AddUser() {

	  if(user.getId() == null || user.getId().length() <= 0){		
		  userDao.Add(user);
		  this.message ="新增成功";

	  }else
	  {
		  userDao.Update(user);
		  this.message ="更新成功";
	  }
	  
	  dataMap = new HashMap<String, Object>();
	  dataMap.put("user", user);
	  dataMap.put("success", true);
	  dataMap.put("message", this.message);
	  
	  return SUCCESS;
	}
	@Override
	public String DeleteUser() {
		userDao.Delete(fid);
		
		this.message ="成功删除";
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("id", fid);
		dataMap.put("success", true);
		dataMap.put("message", this.message);
		  
	    return SUCCESS;
	}
	@Override
	public int GetUserCount()
	{
		return userDao.GetUserCount();
	}
	
	@Override
	public List<User> getAll(int offset, int length)
	{
		 List<User> listUsers = userDao.getAll(0, 1000);		 
		 return listUsers;
	}
	
    private boolean isInvalid() {
        return (user == null || 
        		user.getName()==null|| 
        		user.getName().length()==0);
    }
    
	@Override
	public String Logon()
	{
/*		  if(user.getId() == null || user.getId().length() <= 0){		
			  userDao.Add(user);
		  }else
		  {
			  userDao.Update(user);
		  }*/
		
        if (isInvalid())
            return INPUT;

        return SUCCESS;
	}
}
