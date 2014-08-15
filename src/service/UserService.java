package service;

import java.util.List;

import domain.User;

public interface UserService {
	
	public String GetOneUser();
	
	public String ListUsers();

	public String AddUser();
	
	public String DeleteUser();
	
	public int GetUserCount();
	
	public List<User> getAll(int offset, int length);
	
	public String Logon();
	
	public String json();
}
