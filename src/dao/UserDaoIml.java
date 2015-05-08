package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import domain.User;
import ejbs.UserService;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@Transactional 
public class UserDaoIml  implements  UserDao{
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public User find(String id) {
		
		/*Query query = getSession().createQuery("from User where id=?");    
		query.setParameter(0, id);    
		User user=(User) query.uniqueResult();
		return user;*/
		
		User user=(User) getSession().get(User.class, id);   
		return user; 
		
		/*Query query = getSession().createQuery("select new domain.User(id,name,Pwd,Mobile,Email,Adress,description) from User  where id=?");    
		query.setParameter(0, id);    
		User user=(User) query.uniqueResult();
		return user;*/
			
		/*Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			String sql = "select FID,FName,FPwd,FMobile,FEmail,FAdress,FDescription from t_users where FID=?";
			pt = conn.prepareStatement(sql);
			
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			if(rs.next()){
				User b = new User();
				b.setId(rs.getString("FID"));
				b.setName(rs.getString("FName"));
				b.setPwd(rs.getString("FPwd"));
				b.setMobile(rs.getString("FMobile"));
				b.setEmail(rs.getString("FEmail"));
				b.setAdress(rs.getString("FAdress"));
				b.setDescription(rs.getString("FDescription"));
				return b;				
			}
			return null;			
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, rs);
		}*/
	}

	private Context getInitialConnection() {
		  final String INIT_FACTORY = "org.jnp.interfaces.NamingContextFactory";
		  final String SERVER_URL = "jnp://localhost:1099";
		  Context ctx = null;
		  try {
		   Properties props = new Properties();
		   
		   props.put(Context.INITIAL_CONTEXT_FACTORY, INIT_FACTORY);
		   props.put(Context.PROVIDER_URL, SERVER_URL);
		   ctx = new InitialContext(props);
		  } catch (NamingException ne) {
		   // TODO: handle exception
		   System.err.println("不能连接WebLogic Server在：" + SERVER_URL);
		   ne.printStackTrace();
		  }
		  return ctx;
		 }
	
	@Override
	public List<User> getAll() throws NamingException {
		
//		List<User> users =  new ArrayList<User>();
		
//		try{
//		Context weblogicContext = getInitialConnection();
//		UserService serviceList = (UserService)weblogicContext.lookup("UserServiceBean/remote");
//		users = serviceList.ListUser();	
//		
//		System.err.println("users size()：" + users.size());
//		return users;
//		  } catch (NamingException ne) {
//			   // TODO: handle exception
//			   System.err.println("不能连接NamingException在：");
//			   ne.printStackTrace();
//			  }
//		
//		return users;
//		
		String hql = "from User";      
		Query query = getSession().createQuery(hql);      
		@SuppressWarnings("unchecked")
		List<User> users = query.list();   
		return users;
		
		// TODO Auto-generated method stub
		/*Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			String sql = "select FID,FName,FPwd,FMobile,FEmail,FAdress,FDescription from t_users";
			pt = conn.prepareStatement(sql);
			rs = pt.executeQuery();

			List<User> list = new ArrayList<User>();

			while (rs.next()) {
				User b = new User();
				b.setId(rs.getString("FID"));
				b.setName(rs.getString("FName"));
				b.setPwd(rs.getString("FPwd"));
				b.setMobile(rs.getString("FMobile"));
				b.setEmail(rs.getString("FEmail"));
				b.setAdress(rs.getString("FAdress"));
				b.setDescription(rs.getString("FDescription"));

				list.add(b);

			}
			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, rs);
		}*/

	}


	@Override
	public void Add(User user) {
		// TODO Auto-generated method stub
		
		user.setId(UUID.randomUUID().toString());
		
		getSession().save(user);
//		Configuration config = new Configuration().configure();	//��ȡhibernate.cfg.xml
//		SessionFactory factory = config.buildSessionFactory();	//����Session����
//		Session session = factory.openSession();	//����session
//		Transaction t = session.beginTransaction();	//��Ϊhibernate�����Զ��ύ�������Ҫ��������
//		session.save(user);	//POJO-->PO
//		t.commit();	//�ύ����
		
		
		/*Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		try {

			conn = DBManager.getConnection();
			String sql = "insert into t_users (FID,FName,FPwd,FMobile,FEmail,FAdress,FDescription) values (UUID(),?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,user.getName());
			ps.setString(2,user.getPwd());
			ps.setString(3,user.getMobile());
			ps.setString(4,user.getEmail());
			ps.setString(5,user.getAdress());
			ps.setString(6,user.getDescription());
			ps.executeUpdate();
			ps.close();
			conn.close();
			///

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, rs);
		}*/
	}
	
	
	@Override
	public void Update(User user) {
		getSession().update(user);
		// TODO Auto-generated method stub
		/*Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		try {

			conn = DBManager.getConnection();
			String sql = "update t_users set Fname= ?,FPwd = ?,FMobile =?,FEmail = ?,FAdress = ?,Fdescription = ?"+
            "where FID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,user.getName());
			ps.setString(2,user.getPwd());
			ps.setString(3,user.getMobile());
			ps.setString(4,user.getEmail());
			ps.setString(5,user.getAdress());
			ps.setString(6,user.getDescription());
			ps.setString(7,user.getId());
			ps.executeUpdate();
			ps.close();
			conn.close();
			///

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, rs);
		}*/
	}

	@Override
	public void Delete(String id) {
		
		//getSession().delete("from Customer as c where c.id>8"); 
		//getSession.delete(this.car.getCarid());
		
//	   String hql="delete from User as p where p.id=?";
//	   Query query=getSession().createQuery(hql);
//	   query.setString(0, id);
//	   query.executeUpdate();
	   //getSession().beginTransaction().commit();
		   
		getSession().delete(
				getSession().load(User.class, id)	
	    );
		
		/*Connection conn = null;
		PreparedStatement pt = null;
		try {
			conn = DBManager.getConnection();
			String sql = "delete from t_users where FID=?";
			pt = conn.prepareStatement(sql);
			
			pt.setString(1, id);
			
			pt.execute();
	
		
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			DBManager.closeDB(conn, pt, null);
		}*/
	}
	
	@Override
	public int GetUserCount()
	{
	    String hql = "select count(*) from User";	    
	    Query query =getSession().createQuery(hql);	    
	    int total = (new Integer(query.uniqueResult().toString()));	    
		return total;
	}
	
	@Override
	public List<User> getAll(int offset, int length)
	{
//		String hql = "from User";		
//		Query query =getSession().createQuery(hql);		
//		query.setFirstResult(offset);
//		query.setMaxResults(length);
//		@SuppressWarnings("unchecked")
//		List<User> list = query.list();
//		return list;
		
		
		List<User> users =  new ArrayList<User>();
		
		List<com.users.ejb.User> users1 =  new ArrayList<com.users.ejb.User>();
		
		try{
		Context weblogicContext = getInitialConnection();
		com.users.ejb.UserService serviceList = (com.users.ejb.UserService)weblogicContext.lookup("UserServiceBean/remote");
		users1 = serviceList.ListUser(offset,length);	
		
		System.err.println("users size()：" + users.size());
		
		for(int i=0;i<users1.size();i++)
		{
			User u = new User();
			com.users.ejb.User u2 = users1.get(i);
			u.setAdress(u2.getAdress());
			u.setDescription(u2.getDescription());
			u.setEmail(u2.getEmail());
			u.setId(u2.getId());
			u.setMobile(u2.getMobile());
			u.setName(u2.getName());
			u.setPwd(u2.getPwd());
			users.add(u);
			
		}
		
		//return users;
		  } catch (NamingException ne) {
			   // TODO: handle exception
			   System.err.println("不能连接NamingException在："+ne.toString());
			   ne.printStackTrace();
			  }
		
		return users;
		
	}

}
