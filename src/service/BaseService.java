package service;

import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

public class BaseService  extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected Map<String,Object> dataMap;
	
	protected String message;  
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	protected int page; //��ʼ��¼��λ��//ÿҳ��ʾ�ļ�¼��
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}	
}
