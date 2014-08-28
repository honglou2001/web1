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
		  this.message ="新增成功";

	  }else
	  {
		 
		  this.message ="修改成功";
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
		// dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据
		dataMap = new HashMap<String, Object>();		

		HttpServletRequest request=ServletActionContext.getRequest();
		String path=request.getRequestURI();
		String queryInfo=request.getQueryString();
		System.out.println(path);
		System.out.println("请求的URL"+path +queryInfo);
				       
		int offset = this.getPage();
		
		System.out.println("offset:"+offset);
		
		int pagesize = Constants.PAGE_SIZE;
		
		if (offset>1){
			offset = (offset-1) * pagesize;
		}
		
		menus = menuDao.getAll(offset, pagesize);
		
		int size = menuDao.GetMenuCount();
				
		dataMap.put("rows", menus);
		// 放入一个是否操作成功的标识
		dataMap.put("total", size);
		// 返回结果
		return SUCCESS;
		
	}
	
}
