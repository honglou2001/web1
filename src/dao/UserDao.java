package dao;

import java.util.List;

import domain.User;

public interface UserDao {

	//find a user
	public User find(String id);
	
	//find all users
	public List<User> getAll();
	
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
