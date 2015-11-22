package dao;

import java.util.List;

import javax.naming.NamingException;

//import domain.User;
import com.users.ejb.User;

public interface UserDao {

	//find a user
	public User find(String id);
	
	//find all users
	public List<User> getAll() throws NamingException;
	
	//find all users
	public List<User> getAll(int offset, int length);
	
	//Add a user
	public void Add(User user);
	
	//Update a user
	public void Update(User user);
	
	//delete a user
	public void Delete(String id);
	
	public int GetUserCount();
}
