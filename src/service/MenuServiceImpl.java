package service;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import dao.MenuDaoIml;
import domain.AuthorityMenu;;

public class MenuServiceImpl  extends ActionSupport implements MenuService {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AuthorityMenu menu;	
	
	private Map<String,Object> dataMap;
	
	private String message;  
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
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

	@Override
	public String ListPage() {
				 
	    return SUCCESS;
	}
	
	@Override
	public String AddMenu() {

	  if(menu.getFid() == null || menu.getFid().length() <= 0){		
		  menu.setFparentId("222");
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
	
}
