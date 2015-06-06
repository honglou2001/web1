package service;

import bean.Constants;
import com.users.ejb.ScmDistributors;
import dao.ScmDistributorsDaoIml;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import com.common.ejb.EjbException;
import com.opensymphony.xwork2.ActionSupport;

/**
 * <p>
 * Title: ejb title
 * </p>
 * <p>
 * Description: t_scm_distributors Client Service 处理类
 * </p>
 * 
 * @author yangqinxu 电话：137****5317
 * @version 1.0 时间 2015-5-24 15:23:39
 */

public class ScmDistributorsImpl extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private ScmDistributorsDaoIml scmdistributorsDao;
	private Map<String, Object> dataMap;
	private String message;
	private ScmDistributors scmdistributors;
	private int page;
	private int errcode;

	public int getErrcode() {
		return errcode;
	}

	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}

	public ScmDistributors getScmdistributors() {
		return scmdistributors;
	}

	public void setScmdistributors(ScmDistributors rscmDistributorsInfo) {
		this.scmdistributors = rscmDistributorsInfo;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ScmDistributorsDaoIml getScmdistributorsDao() {
		return scmdistributorsDao;
	}

	public void setScmdistributorsDao(ScmDistributorsDaoIml rscmdistributorsDao) {
		this.scmdistributorsDao = rscmdistributorsDao;
	}

	public String AddScmDistributors() {

		try {
			if (this.scmdistributors.getFdistributorid() == null
					|| this.scmdistributors.getFdistributorid().length() <= 0) {

				this.scmdistributorsDao.Add(this.scmdistributors);
				this.message = "新增成功";

			} else {

				this.scmdistributorsDao.Update(this.scmdistributors);
				this.message = "更新成功";

			}

		} catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}

		dataMap = new HashMap<String, Object>();
		dataMap.put("errcode", this.errcode);
		dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}

	private HashMap<String, String> GetQueryMap() {
		HashMap<String, String> map = new HashMap<String, String>();

		if (this.scmdistributors != null) {
			if(this.scmdistributors.getFname()!=null && !this.scmdistributors.getFname().equals("")){
				map.put("fname", this.scmdistributors.getFname());
			}
			if(this.scmdistributors.getFintroducer()!=null && !this.scmdistributors.getFintroducer().equals("")){
				map.put("fintroducer", this.scmdistributors.getFintroducer());
			}
			if(this.scmdistributors.getFaddress()!=null && !this.scmdistributors.getFaddress().equals("")){
				map.put("faddress", this.scmdistributors.getFaddress());
			}
			if(this.scmdistributors.getFmobile()!=null && !this.scmdistributors.getFmobile().equals("")){
				map.put("fmobile", this.scmdistributors.getFmobile());
			}

		}

		return map;
	}

	public String QueryScmDistributors() {
		dataMap = new HashMap<String, Object>();
		int offset = this.getPage();

		int pagesize = Constants.PAGE_SIZE;

		if (offset > 0) {
			offset = (offset - 1) * pagesize;
		}

		HashMap<String, String> map = this.GetQueryMap();

		try {
			List<ScmDistributors> listScmDistributors = this.scmdistributorsDao
					.GetAll(offset, pagesize, map);

			int size = this.scmdistributorsDao.GetCount(map);

			dataMap.put("rows", listScmDistributors);
			dataMap.put("total", size);

		} catch (RuntimeException ex) {
			this.message = ex.getMessage();
			this.errcode = ex.hashCode();
		}

		dataMap.put("errcode", this.errcode);
		dataMap.put("message", this.message);

		return SUCCESS;
	}

	public String FindScmDistributors() {
		if (this.scmdistributors.getFdistributorid() == null
				|| this.scmdistributors.getFdistributorid().length() <= 0) {

		} else {
			this.scmdistributors = this.scmdistributorsDao
					.Find(this.scmdistributors.getFdistributorid());

			List<ScmDistributors> lists = this.scmdistributorsDao
					.GetListAll(this.scmdistributors.getFname());
			dataMap = new HashMap<String, Object>();
			dataMap.put("scmdistributors", this.scmdistributors);

			dataMap.put("lists", lists);

		}
		return SUCCESS;

	}

	public String DeleteScmDistributors() {
		try {
		this.scmdistributorsDao
				.Delete(this.scmdistributors.getFdistributorid());
		this.message = "成功删除";
		
		} catch (RuntimeException ex) {
			this.message = "删除失败，请先删除此分销商的销售记录。";//ex.getMessage();
			this.errcode = ex.hashCode();
		}		
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("id", this.scmdistributors.getFdistributorid());
		dataMap.put("errcode", this.errcode);
		dataMap.put("success", true);
		dataMap.put("message", this.message);

		return SUCCESS;
	}

	public String List() {
		return SUCCESS;
	}

}
