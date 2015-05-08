package ejbs;

import java.util.List;

import javax.ejb.Remote;

@Remote
public interface UserService {
	
	public List<User> ListUser();
	
}
