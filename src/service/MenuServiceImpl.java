package service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.users.ejb.RMenu;
import com.users.ejb.RMenuService;

import action.ejbproxy;
import bean.Constants;

import dao.MenuDaoIml;
import domain.AuthorityMenu;
import domain.AuthorityResVal;

public class MenuServiceImpl extends BaseService implements MenuService {

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

		if (menu.getFid() == null || menu.getFid().length() <= 0) {
			System.out.println("offset:" + menu.getFauthorityVal());
			menuDao.Add(menu);
			this.message = "�����ɹ�";

		} else {
			menuDao.Update(menu);
			this.message = "�޸ĳɹ�";
		}

		dataMap = new HashMap<String, Object>();
		dataMap.put("menu", menu);
		dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}

	@Override
	public String List() {
		// dataMap�е���ݽ��ᱻStruts2ת����JSON�ַ���������Ҫ��������е����
		dataMap = new HashMap<String, Object>();

		HttpServletRequest request = ServletActionContext.getRequest();
		String path = request.getRequestURI();
		String queryInfo = request.getQueryString();
		System.out.println(path);
		System.out.println("�����URL" + path + queryInfo);

		menus = menuDao.getAll(0, 10000);

		int size = menuDao.GetMenuCount();

		dataMap.put("rows", menus);
		// ����һ���Ƿ�����ɹ��ı�ʶ
		dataMap.put("total", 1);

		this.message = "�ɹ�ɾ��";
		// ���ؽ��
		return SUCCESS;
	}

	public String Delete() {
		if (menu.getFid() != null && menu.getFid().length() > 0) {
			menuDao.Delete(menu.getFid());
			this.message = "ɾ��ɹ�";
			dataMap = new HashMap<String, Object>();
			dataMap.put("id", menu.getFid());
			dataMap.put("success", true);
			dataMap.put("message", this.message);
		}
		return SUCCESS;
	}

	public String ComAuth() {

		HttpServletRequest request = ServletActionContext.getRequest();
		String path = request.getRequestURI();
		// String queryInfo=request.getQueryString();

		System.out.println(path + "AutTree");

		long ival = 0;
		if (menu.getFauthorityVal() != null && menu.getFauthorityVal() > 0) {
			ival = menu.getFauthorityVal();
		}
		resVal = menuDao.getResVal(ival);

		// String json = JSONArray.fromObject(resVal).toString();//ת��ΪJSON
		//
		// getPrintWriter().write(json);//
		//
		// dataMap.put("rows", resVal);
		// // ����һ���Ƿ�����ɹ��ı�ʶ
		// dataMap.put("total", resVal.size());

		return SUCCESS;
	}

	public String MenuResVal() {
		List<AuthorityMenu> menus1 = menuDao.getAll(0, 10000);

		Iterator<AuthorityMenu> it = menus1.iterator(); // ���һ�������
		AuthorityMenu menuObj = null;
		AuthorityMenu children1 = null;

		resVal = new ArrayList<AuthorityResVal>();

		List<AuthorityResVal> revValAll = menuDao.getResVal(0);

		List<RMenu> lMenu = null;
		if (menu.getFroleid() != null && menu.getFroleid().length() > 0) {
			try {
				// get role menu authority value
				Context weblogicContext = ejbproxy.getInitialConnection();
				RMenuService serviceMenu;
				serviceMenu = (com.users.ejb.RMenuService) weblogicContext
						.lookup("RMenuServiceBean/remote");

				lMenu = serviceMenu.GetRMenuByRole(menu.getFroleid());

			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		while (it.hasNext()) {
			AuthorityResVal item = new AuthorityResVal();

			menuObj = it.next();

			item.setText(menuObj.getFmenuName());
			item.setId((long) menuObj.getFincreaseId());

			Set<AuthorityMenu> menuchildren = menuObj.getChildren();

			Iterator<AuthorityMenu> childit = menuchildren.iterator();

			List<AuthorityResVal> itemchildren = new ArrayList<AuthorityResVal>();

			while (childit.hasNext()) {
				children1 = childit.next();

				AuthorityResVal item1 = new AuthorityResVal();

				item1.setText(children1.getFmenuName());
				item1.setId((long) children1.getFincreaseId());

				List<AuthorityResVal> resVal2 = menuDao.getResVal(revValAll,
						children1, lMenu);

				item1.setChildren(resVal2);

				itemchildren.add(item1);

				item.setChildren(itemchildren);

			}
			resVal.add(item);

		}
		return SUCCESS;
	}
}
