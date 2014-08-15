package service;


import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.HashMap;  
import java.util.Map;  
  
import org.apache.struts2.json.annotations.JSON;  

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import domain.User;
import dao.UserDaoIml;
import bean.Pager;
import bean.Constants;

public class UserServiceImpl extends ActionSupport implements  UserService   {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserDaoIml daoUser = new UserDaoIml();
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
		// dataMap�е����ݽ��ᱻStruts2ת����JSON�ַ�������������Ҫ��������е�����
		dataMap = new HashMap<String, Object>();		
//		Collection<User> jsusr = new ArrayList<User>(); 
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI();
		String queryInfo=request.getQueryString();
		System.out.println(path);
		System.out.println("�����URL"+path +queryInfo);
		

        
		int offset = this.getPage();
		
		System.out.println("offset:"+offset);
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>1){
			offset = (offset-1) * pagesize;
		}
		
		users = userDao.getAll(offset, pagesize);
		
		int size = userDao.GetUserCount();
		
//		User user = new User();
//		user.setName("����");
//		user.setPwd("123");
//		
//		jsusr.add(user);
//		jsusr.add(user);
		
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
		//users = userDao.getAll();
		
		
		int offset = this.getPage();
		int pagesize = Constants.PAGE_SIZE;
		
		users = userDao.getAll(offset, pagesize);
		
		int size = userDao.GetUserCount();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI();
		String queryInfo=request.getQueryString();
		System.out.println(path);
		System.out.println("�����URL"+path +queryInfo);
		
		String url ="http://127.0.0.1:8080/web1/List.action";
		
		System.out.println("mmmm"+url);
		Pager p = new Pager(offset, size, pagesize, url, "Page Navigation");
		request.setAttribute("pager", p);
		 
		/*users = daoUser.getAll();*/
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
		  this.message ="�����ɹ�";

	  }else
	  {
		  userDao.Update(user);
		  this.message ="�޸ĳɹ�";
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
		 List<User> listUsers = userDao.getAll(offset, length);		 
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
