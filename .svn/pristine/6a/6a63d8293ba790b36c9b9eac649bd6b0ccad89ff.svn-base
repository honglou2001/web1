package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

public class UrlTransfer  implements ServletRequestAware,ServletResponseAware{

	Logger logger = Logger.getLogger(UrlTransfer.class); // Server为类名
	private HttpServletRequest request;
	private HttpServletResponse response;

	public void TransferUrl() {
		PrintWriter out = null;
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String lbsInfo = request.getQueryString();	
		InputStream is = null;
		URL url;
		try {						
			 url = new URL(lbsInfo); 
			System.out.println("url:" + url);
			logger.info(url);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.connect();
			is = con.getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					is, "utf-8"));
			String str = reader.readLine();

			out.print(str);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
}
