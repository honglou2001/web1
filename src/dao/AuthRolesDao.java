package dao;

import java.util.List;

import domain.AuthorityRoles;



public interface AuthRolesDao {
	//Add a menu
	public void Add(AuthorityRoles menu);

	//find all menus
	public List<AuthorityRoles> getAll(int offset, int length);
	
	public int GetRolesCount();
	
	public void Update(AuthorityRoles menu);
}
