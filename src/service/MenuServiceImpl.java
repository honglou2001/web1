package service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import bean.Constants;

import dao.MenuDaoIml;
import domain.AuthorityMenu;
import domain.AuthorityResVal;

public class MenuServiceImpl  extends BaseService implements MenuService {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AuthorityMenu menu;	
	
	private Collection<AuthorityResVal> resVal;
	
	public Collection<AuthorityResVal> getResVal() {
		return resVal;
	}

	public void setResVal(Collection<AuthorityResVal> resVal) {
		this.resVal = resVal;
	}

	public AuthorityMenu getMenu() {
		return menu;
	}

	public void setMenu(AuthorityMenu menu) {
		this.menu = menu;
	}

	private MenuDaoIml menuDao;
		
	public MenuDaoIml getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDaoIml menuDao) {
		this.menuDao = menuDao;
	}
	
	private Collection<AuthorityMenu> menus;

	public Collection<AuthorityMenu> getMenus() {
		return menus;
	}

	public void setMenus(Collection<AuthorityMenu> menus) {
		this.menus = menus;
	}
	
	@Override
	public String ListPage() {
				 
	    return SUCCESS;
	}
	
	@Override
	public String Add() {

	  if(menu.getFid() == null || menu.getFid().length() <= 0){		
		  System.out.println("offset:"+menu.getFauthorityVal());		 
		  menuDao.Add(menu);
		  this.message ="�����ɹ�";

	  }else
	  {
		  menuDao.Update(menu);
		  this.message ="�޸ĳɹ�";
	  }
	  
	  dataMap = new HashMap<String, Object>();
	  dataMap.put("menu", menu);
	  dataMap.put("success", true);
	  dataMap.put("message", this.message);
	  
	  return SUCCESS;
	}
	
	@Override
	public String List()
	{
		// dataMap�е����ݽ��ᱻStruts2ת����JSON�ַ�������������Ҫ��������е�����
		dataMap = new HashMap<String, Object>();		

		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI();
		String queryInfo=request.getQueryString();
		System.out.println(path);
		System.out.println("�����URL"+path +queryInfo);
				       
		menus = menuDao.getAll(0, 10000);
		
		int size = menuDao.GetMenuCount();
				
		dataMap.put("rows", menus);
		// ����һ���Ƿ�����ɹ��ı�ʶ
		dataMap.put("total", size);
		// ���ؽ��
		return SUCCESS;		
	}
	
	public String AutTree()
	{			

		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI();
		//String queryInfo=request.getQueryString();
		
		System.out.println(path+"AutTree");
		
		long ival = 0;
		 if(menu.getFauthorityVal() != null && menu.getFauthorityVal()> 0){		
			 ival = menu.getFauthorityVal();
		 }
		resVal = menuDao.getResVal(ival);
				
//		String json = JSONArray.fromObject(resVal).toString();//ת��ΪJSON
//		
//        getPrintWriter().write(json);//
//        
//		dataMap.put("rows", resVal);
//		// ����һ���Ƿ�����ɹ��ı�ʶ
//		dataMap.put("total", resVal.size());
		
		return SUCCESS;		
	}	
}
