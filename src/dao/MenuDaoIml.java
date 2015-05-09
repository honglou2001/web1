package dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import domain.AuthorityMenu;
import domain.AuthorityResVal;
import domain.User;

import org.springframework.transaction.annotation.Transactional;

import com.users.ejb.RMenu;

@Transactional
public class MenuDaoIml extends BaseDao implements MenuDao {

	@Override
	public void Add(AuthorityMenu menu) {
		try {
			menu.setFid(UUID.randomUUID().toString());

			getSession().save(menu);
		} catch (Exception ex) {

			ex.printStackTrace();
			System.err.println(ex.toString());
		}
	}

	@Override
	public List<AuthorityMenu> getAll(int offset, int length) {
		String hql = "from AuthorityMenu where _parentId ='' ";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		@SuppressWarnings("unchecked")
		List<AuthorityMenu> list = query.list();
		return list;
	}

	@Override
	public int GetMenuCount() {
		String hql = "select count(*) from AuthorityMenu  where _parentId ='' ";
		Query query = getSession().createQuery(hql);
		int total = (new Integer(query.uniqueResult().toString()));
		return total;
	}

	public List<AuthorityResVal> getResVal(long fauthorityVal) {
		String hql = "from AuthorityResVal";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(1000);
		@SuppressWarnings("unchecked")
		List<AuthorityResVal> list = query.list();

		List<AuthorityResVal> listNew = new ArrayList<AuthorityResVal>();

		AuthorityResVal revVal = null;

		for (int i = 0; i < list.size(); i++) {
			revVal = list.get(i);

			if ((revVal.getId() & fauthorityVal) == revVal.getId()) {
				revVal.setChecked(true);
			}
			listNew.add(revVal);
		}
		return listNew;
	}

	public List<AuthorityResVal> getResVal(List<AuthorityResVal> list,
			AuthorityMenu children1, List<RMenu> lMenu) {
		List<AuthorityResVal> listNew = new ArrayList<AuthorityResVal>();

		AuthorityResVal revVal = null;

		for (int i = 0; i < list.size(); i++) {
			revVal = list.get(i);

			if ((revVal.getId() & children1.getFauthorityVal()) == revVal
					.getId()) {

				AuthorityResVal revValNew = new AuthorityResVal();

				revValNew.setId(revVal.getId());
				revValNew.setText(revVal.getText());
				revValNew.setFid(revVal.getFid());
				revValNew.setFsysid(revVal.getFsysid());
				revValNew.setFmenuid(children1.getFid());

				Map<String, String> mapattribute = new HashMap<String, String>();
				mapattribute.put("menuid", children1.getFid());
				revValNew.setAttributes(mapattribute);

				boolean ischecked = CheckAuthority(children1, lMenu, revValNew);

				revValNew.setChecked(ischecked);

				listNew.add(revValNew);
			}
		}
		return listNew;
	}

	private boolean CheckAuthority(AuthorityMenu menu, List<RMenu> lMenu,
			AuthorityResVal revValNew) {
		if (lMenu != null && menu != null) {
			for (int i = 0; i < lMenu.size(); i++) {
				if (lMenu.get(i).getFmenuid().equals(menu.getFid()) ) {
					if ((lMenu.get(i).getFauthval() & revValNew.getId()) == revValNew
							.getId()) {
						return true;
					}
				}
			}
		}
		return false;
	}

	public void Delete(String id) {

		getSession().delete(getSession().load(AuthorityMenu.class, id));

	}

	@Override
	public void Update(AuthorityMenu menu) {
		try {
			// menu.setFmodifyTime(new Timestamp(System.currentTimeMillis()));
			getSession().update(menu);
		} catch (Exception ex) {
			ex.printStackTrace();
			System.err.println(ex.toString());
		}
	}
}
