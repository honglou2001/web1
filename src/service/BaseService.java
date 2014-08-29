package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

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
	
	/**
     * ���HttpServletResponse����
     * 
     * @return
     */
    public static HttpServletResponse getResponse() {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        return response;
    }
 
    public PrintWriter getPrintWriter() {
        PrintWriter pw = null;
        try {
            pw = getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return pw;
    }

}
