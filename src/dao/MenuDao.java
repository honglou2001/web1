package dao;

import java.util.List;

import domain.AuthorityMenu;
import domain.User;


public interface MenuDao {
	//Add a menu
	public void Add(AuthorityMenu menu);

	//find all menus
	public List<AuthorityMenu> getAll(int offset, int length);
	
	public int GetMenuCount();
}
