package service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import dao.AuthRolesDaoIml;
import domain.AuthorityRoles;
import domain.AuthorityResVal;

import com.users.ejb.User;
import com.users.ejb.UserService;

import com.users.ejb.RMenu;
import com.users.ejb.RMenuService;

import action.ejbproxy;

public class AuthRolesServiceImpl extends BaseService implements
		AuthRolesService {

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

	private RMenu MenuExist(String menuid, List<RMenu> menus) {
		for (int i = 0; i < menus.size(); i++) {
			if (menus.get(i).getFmenuid().equals(menuid) ) {
				return menus.get(i);
			}

		}
		return null;
	}

	private List<RMenu> GetMenuRoles() {

		String roldid = role.getFid();

		String permission = role.getFpermissions();

		List<RMenu> menus = new ArrayList<RMenu>();

		if (permission != null && permission.length() > 0) {
			String[] strArr = permission.split(",");

			if (strArr != null && strArr.length > 0) {
				for (int i = 0; i < strArr.length; i++) {
					String str = strArr[i];

					if (!str.endsWith(";")) {
						String[] strArr1 = str.split(";");
						if (strArr1 != null && strArr1.length > 1) {
							long val = Long.parseLong(strArr1[0]);
							String menuid = strArr1[1];

							RMenu menuExist = MenuExist(menuid, menus);

							if (menuExist != null) {
								menuExist.setFauthval(val
										| menuExist.getFauthval());
							} else {
								RMenu menuAdd = new RMenu();
								menuAdd.setFauthval(val);
								menuAdd.setFmenuid(menuid);
								menuAdd.setFroleid(roldid);
								menus.add(menuAdd);
							}
						}
					}
				}
			}
		}
		return menus;
	}

	@Override
	public String Add() {

		if (role.getFid() == null || role.getFid().length() == 0) {
			roleDao.Add(role);

			// 增加角色关联的菜单权限
			List<RMenu> menus = GetMenuRoles();
			if (menus.size() > 0) {

				Context weblogicContext = ejbproxy.getInitialConnection();
				RMenuService serviceMenu;
				try {
					serviceMenu = (com.users.ejb.RMenuService) weblogicContext
							.lookup("RMenuServiceBean/remote");					
				
					for (int i = 0; i < menus.size(); i++) {
						serviceMenu.Add(menus.get(i));
					}

				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// 增加角色关联的菜单权限

			this.message = "成功新增";

		} else {
			roleDao.Update(role);
			
			// 增加角色关联的菜单权限
			List<RMenu> menus = GetMenuRoles();
			if (menus.size() > 0) {

				Context weblogicContext = ejbproxy.getInitialConnection();
				RMenuService serviceMenu;
				try {
					serviceMenu = (com.users.ejb.RMenuService) weblogicContext
							.lookup("RMenuServiceBean/remote");
					
					serviceMenu.Delete(role.getFid(), "");

					for (int i = 0; i < menus.size(); i++) {
						serviceMenu.Add(menus.get(i));
					}

				} catch (NamingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// 增加角色关联的菜单权限
			
			this.message = "成功修改";
		}

		dataMap = new HashMap<String, Object>();
		dataMap.put("menu", role);
		dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}

	@Override
	public String List() {
		// dataMap�е���ݽ��ᱻStruts2ת����JSON�ַ���������Ҫ��������е����
		dataMap = new HashMap<String, Object>();

		// HttpServletRequest request=ServletActionContext.getRequest();
		// String path=request.getRequestURI();
		// String queryInfo=request.getQueryString();
		// System.out.println(path);
		// System.out.println("�����URL"+path +queryInfo);

		roles = roleDao.getAll(0, 10000);

		int size = roleDao.GetRolesCount();

		dataMap.put("rows", roles);
		// ����һ���Ƿ�����ɹ��ı�ʶ
		dataMap.put("total", size);

		this.message = "�ɹ�ɾ��";
		// ���ؽ��
		return SUCCESS;
	}

	public String Delete() {
		if (role.getFid() != null && role.getFid().length() > 0) {
			roleDao.Delete(role.getFid());
			this.message = "ɾ��ɹ�";
			dataMap = new HashMap<String, Object>();
			dataMap.put("id", role.getFid());
			dataMap.put("success", true);
			dataMap.put("message", this.message);
		}
		return SUCCESS;
	}

	public String AutTree() {

		// HttpServletRequest request=ServletActionContext.getRequest();
		// String path=request.getRequestURI();
		//
		// System.out.println(path+"AutTree");
		//
		// long ival = 0;
		// if(menu.getFauthorityVal() != null && menu.getFauthorityVal()> 0){
		// ival = menu.getFauthorityVal();
		// }
		// resVal = menuDao.getResVal(ival);
		//
		return SUCCESS;
	}
}
