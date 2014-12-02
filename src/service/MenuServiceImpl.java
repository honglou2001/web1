package service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
		  this.message ="新增成功";

	  }else
	  {
		  menuDao.Update(menu);
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
				       
		menus = menuDao.getAll(0, 10000);
		
		int size = menuDao.GetMenuCount();
				
		dataMap.put("rows", menus);
		// 放入一个是否操作成功的标识
		dataMap.put("total", 1);
		
		this.message ="成功删除";
		// 返回结果
		return SUCCESS;		
	}
	
	public String Delete()
	{
		if(menu.getFid() != null && menu.getFid().length()>0){	
			menuDao.Delete(menu.getFid());			
			this.message ="删除成功";			
			dataMap = new HashMap<String, Object>();
			dataMap.put("id", menu.getFid());
			dataMap.put("success", true);
			dataMap.put("message", this.message);
		 }		  
	    return SUCCESS;
	}	
	
	
	public String ComAuth()
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
				
//		String json = JSONArray.fromObject(resVal).toString();//转化为JSON
//		
//        getPrintWriter().write(json);//
//        
//		dataMap.put("rows", resVal);
//		// 放入一个是否操作成功的标识
//		dataMap.put("total", resVal.size());
		
		return SUCCESS;		
	}	
	
	public String MenuResVal()
	{			
		List<AuthorityMenu> menus1 = menuDao.getAll(0, 10000);
				
		Iterator<AuthorityMenu> it = menus1.iterator(); // 获得一个迭代子
		AuthorityMenu menuObj = null;
		AuthorityMenu children1 = null;
		
		resVal = new ArrayList<AuthorityResVal>();  
		
		List<AuthorityResVal>  revValAll = menuDao.getResVal(0);
		
		while(it.hasNext())
		{
			AuthorityResVal item = new AuthorityResVal();		
			
			menuObj = it.next();	
						
			item.setText(menuObj.getFmenuName());
			item.setId((long)menuObj.getFincreaseId());	
						
			Set<AuthorityMenu> menuchildren = menuObj.getChildren();
			
			Iterator<AuthorityMenu> childit = menuchildren.iterator();  
			
			
			List<AuthorityResVal> itemchildren = new ArrayList<AuthorityResVal>();
			
			while (childit.hasNext()) {  
				children1 = childit.next();  
				 									
				AuthorityResVal item1 = new AuthorityResVal();		
				
				item1.setText(children1.getFmenuName());
				item1.setId((long)children1.getFincreaseId());				
				
				List<AuthorityResVal> resVal2 = menuDao.getResVal(children1.getFauthorityVal(),revValAll);
				
				item1.setChildren(resVal2);
				
				itemchildren.add(item1);
				
				item.setChildren(itemchildren);
				
			} 
			resVal.add(item);
			
			
		}		
		return SUCCESS;		
	}	
}
