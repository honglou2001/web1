package service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import bean.Constants;

import dao.MenuDaoIml;
import domain.AuthorityMenu;

public class MenuServiceImpl  extends BaseService implements MenuService {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AuthorityMenu menu;	
	
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
		  menu.setFauthorityVal(111L);
		  menu.setFsysId(1);
		  menuDao.Add(menu);
		  this.message ="�����ɹ�";

	  }else
	  {
		 
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
				       
		int offset = this.getPage();
		
		System.out.println("offset:"+offset);
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>1){
			offset = (offset-1) * pagesize;
		}
		
		menus = menuDao.getAll(offset, pagesize);
		
		int size = menuDao.GetMenuCount();
				
		dataMap.put("rows", menus);
		// ����һ���Ƿ�����ɹ��ı�ʶ
		dataMap.put("total", size);
		// ���ؽ��
		return SUCCESS;
		
	}
	
}
