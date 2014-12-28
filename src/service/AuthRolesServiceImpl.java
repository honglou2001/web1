package service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import dao.AuthRolesDaoIml;
import domain.AuthorityRoles;
import domain.AuthorityResVal;

public class AuthRolesServiceImpl  extends BaseService implements AuthRolesService {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AuthorityRoles role;	
	
	private Collection<AuthorityResVal> resVal;
	
	public Collection<AuthorityResVal> getResVal() {
		return resVal;
	}

	public void setResVal(Collection<AuthorityResVal> resVal) {
		this.resVal = resVal;
	}

	public AuthorityRoles getRole() {
		return role;
	}

	public void setRole(AuthorityRoles role) {
		this.role = role;
	}

	private AuthRolesDaoIml roleDao;
		
	public AuthRolesDaoIml getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(AuthRolesDaoIml roleDao) {
		this.roleDao = roleDao;
	}
	
	private Collection<AuthorityRoles> roles;

	public Collection<AuthorityRoles> getRoles() {
		return roles;
	}

	public void setRoles(Collection<AuthorityRoles> roles) {
		this.roles = roles;
	}
	
	@Override
	public String ListPage() {
				 
	    return SUCCESS;
	}
	
	@Override
	public String Add() {

	  if(role.getFid() == null || role.getFid().length() <= 0){		 
		  roleDao.Add(role);
		  this.message ="�����ɹ�";

	  }else
	  {
		  roleDao.Update(role);
		  this.message ="�޸ĳɹ�";
	  }
	  
	  dataMap = new HashMap<String, Object>();
	  dataMap.put("menu", role);
	  dataMap.put("success", true);
	  dataMap.put("message", this.message);
	  
	  return SUCCESS;
	}
	
	@Override
	public String List()
	{
		// dataMap�е����ݽ��ᱻStruts2ת����JSON�ַ�������������Ҫ��������е�����
		dataMap = new HashMap<String, Object>();		

//		HttpServletRequest request=ServletActionContext.getRequest();
//		String path=request.getRequestURI();
//		String queryInfo=request.getQueryString();
//		System.out.println(path);
//		System.out.println("�����URL"+path +queryInfo);
				       
		roles = roleDao.getAll(0, 10000);
		
		int size = roleDao.GetRolesCount();
				
		dataMap.put("rows", roles);
		// ����һ���Ƿ�����ɹ��ı�ʶ
		dataMap.put("total", size);
		
		this.message ="�ɹ�ɾ��";
		// ���ؽ��
		return SUCCESS;		
	}
	
	public String Delete()
	{
		if(role.getFid() != null && role.getFid().length()>0){	
			roleDao.Delete(role.getFid());			
			this.message ="ɾ���ɹ�";			
			dataMap = new HashMap<String, Object>();
			dataMap.put("id", role.getFid());
			dataMap.put("success", true);
			dataMap.put("message", this.message);
		 }		  
	    return SUCCESS;
	}	
	
	
	public String AutTree()
	{			

//		HttpServletRequest request=ServletActionContext.getRequest();
//		String path=request.getRequestURI();
//		
//		System.out.println(path+"AutTree");
//		
//		long ival = 0;
//		 if(menu.getFauthorityVal() != null && menu.getFauthorityVal()> 0){		
//			 ival = menu.getFauthorityVal();
//		 }
//		resVal = menuDao.getResVal(ival);
//						
		return SUCCESS;		
	}	
}
