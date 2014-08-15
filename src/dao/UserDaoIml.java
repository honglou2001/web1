package dao;

import java.util.List;
import java.util.UUID;

import domain.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.ejb.TransactionAttribute;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import utils.DBManager;
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

	
	@Override
	public List<User> getAll() {
		
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
//		Configuration config = new Configuration().configure();	//读取hibernate.cfg.xml
//		SessionFactory factory = config.buildSessionFactory();	//创建Session工厂
//		Session session = factory.openSession();	//创建session
//		Transaction t = session.beginTransaction();	//因为hibernate不是自动提交，因此需要创建事务
//		session.save(user);	//POJO-->PO
//		t.commit();	//提交事务
		
		
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
		
		//getSession.delete(this.car.getCarid());
		
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
		String hql = "from User";		
		Query query =getSession().createQuery(hql);		
		query.setFirstResult(offset);
		query.setMaxResults(length);
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		return list;
	}

}
