package utils;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.device.ejb.SerialnumberEmailsmtp;
import com.watch.ejb.SerialnumberEmailhistory;
import com.watch.ejb.SerialnumberEmailtemplate;

import dao.SerialnumberEmailhistoryDaoIml;
import dao.SerialnumberEmailsmtpDaoIml;
import dao.SerialnumberEmailtemplateDaoIml;
import domain.Config;


public class SendMailUtil implements Runnable{
    
	private static final Logger logger = Logger.getLogger(SendMailUtil.class);
	// ���巢���ˡ��ռ��ˡ������
	private String to = null;// �ռ��������ַ
	private String from = null;// �����������ַ
	private String password = null;// ����������
	private String host = null;// �ʼ�������
	private String filename = null;

	private String templateid = "";
	private String title = "";
	private String content = "";
	private int language = 0;
	
	// ���ڱ��淢�͸������ļ�·�����ļ���
	private Vector<String> fileList = new Vector<String>();
	/*
	 * 
	 * ���Դ������˵Ȳ����Ĺ���
	 */

	public SendMailUtil(String to, SerialnumberEmailtemplate template) {
		
		this.to = to;
		this.title = template.getFtitle();
		this.content = template.getFcontent();
		this.language = template.getFlanguage();
		this.templateid = template.getFtemplateid();
	
		// ��ʼ�������ˡ��ռ��ˡ������
		
		
		boolean hasSmtp = this.getSmtp();
		
		if(!hasSmtp){
			
			Config xmlConfig = XMLReader.loadconfig();	
			this.from = xmlConfig.mailfrom;//from;
			this.password = xmlConfig.mailpassword;//password;
			this.host = xmlConfig.mailhost;//smtpServer;
		
		}
	}
	
	private boolean getSmtp()
	{
		SerialnumberEmailsmtpDaoIml  serialnumberemailsmtpDao = new SerialnumberEmailsmtpDaoIml();
		HashMap<String, String> map = new HashMap<String, String>(); 
		map.put("FIsDefault","1");		 
		List<SerialnumberEmailsmtp>  listSerialnumberEmailsmtp= serialnumberemailsmtpDao.ListSerialnumberEmailsmtp(0, 1,map);
		if(listSerialnumberEmailsmtp!=null && listSerialnumberEmailsmtp.size()>0)
		{
			SerialnumberEmailsmtp smtp = listSerialnumberEmailsmtp.get(0);
			this.from = smtp.getFmailaddress();
			this.host = smtp.getFmailhost();
			this.password = smtp.getFmailpassword();
			return true;
			
		}		
		return false;				
	}
	

	/*
	 * 
	 * �÷��������ռ�������
	 */

	public void attachfile(String fname) {
		fileList.addElement(fname);
	}

	/*
	 * 
	 * ��ʼ�����ż��ķ���
	 */

	public boolean startSend(String emailTitle, String emailContent) {

		if (StringUtils.isBlank(emailContent)) {
			logger.error("�ʼ����ݲ���Ϊ�գ�");
			return false;
		}

		try {
			if (StringUtils.isBlank(emailContent)) {
				throw new NullPointerException("���͵����ݲ���Ϊ�գ�");
			}

			// ����Properties����
			Properties props = System.getProperties();
			// �����ż�������
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.password", "0");
			// �õ�Ĭ�ϵĶԻ�����

			Session session = Session.getInstance(props,new PopupAuthenticator(this.from, this.password));
			// ����һ����Ϣ������ʼ������Ϣ�ĸ���Ԫ��
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			InternetAddress[] address = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address);
			// getBytes("ISO-8859-1")
			// String title=new String(emailTitle.getBytes("ISO-8859-1"),"GBK");
			msg.setSubject(emailTitle);
			// �����BodyPart�����뵽�˴�������Multipart��
			Multipart mp = new MimeMultipart("subtype");
			// ���HTML����
			BodyPart htmlBody = new MimeBodyPart();
			MimeMultipart htmlContent = new MimeMultipart("related");
			BodyPart msgContent = new MimeBodyPart();
			htmlContent.addBodyPart(msgContent);
			msgContent.setContent(emailContent, "text/html;charset=utf-8");
			htmlBody.setContent(htmlContent);
			mp.addBodyPart(htmlBody);
			// ����ö��������ı�������
			Enumeration efile = fileList.elements();
			// ����������Ƿ��и���Ķ���
			while (efile.hasMoreElements()) {
				MimeBodyPart mbp = new MimeBodyPart();
				// ѡ���ÿһ��������
				filename = efile.nextElement().toString();
				// �õ�����Դ
				FileDataSource fds = new FileDataSource(filename);
				// �õ�������������BodyPart
				mbp.setDataHandler(new DataHandler(fds));
				// �õ��ļ���ͬ������BodyPart
				mbp.setFileName(fds.getName());
				mp.addBodyPart(mbp);

			}
			// ���߼����е�����Ԫ��
			fileList.removeAllElements();
			// Multipart���뵽�ż�
			msg.setContent(mp);
			// �����ż�ͷ�ķ�������
			msg.setSentDate(new Date());
			// �����ż�
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
			
			logger.error(e);
			
			return false;

		}
		return true;
	}

	// ��֤��
	class PopupAuthenticator extends Authenticator {
		private String username;
		private String password;

		public PopupAuthenticator(String user, String pass) {
			this.username = user;
			this.password = pass;
		}
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	}

	// ����
	public static void main(String[] args) {
					
//		Config xmlConfig = XMLReader.loadconfig();		
		//SendMailUtil mail = new SendMailUtil("honglou2001@qq.com", "honglou2001@126.com", "leixu211szuhlz", "smtp.126.com");
//		SendMailUtil mail = new SendMailUtil("honglou2001@qq.com","ddd@163.com","pwd123","000",0,4);
		// mail.attachfile("C:\Users\awen\Desktop\a.txt");
		//mail.startSend("�����ĵ�", "�յ���ظ�");		
//		Thread th = new Thread(mail);
//		th.start();		
	}
	
//	private String getTemplate()
//	{
//		String content  = "";
//
////		content = content.replace("{0}", this.regemail);
////		content = content.replace("{1}", this.regpwd);
//		
//		return content;
//	}
	
	private void saveRecord(String content,String title)
	{
		SerialnumberEmailhistory serialnumberEmailhistoryInfo = new SerialnumberEmailhistory();
		serialnumberEmailhistoryInfo.setFtemplateid(this.templateid);
		serialnumberEmailhistoryInfo.setFcontent(content);
		serialnumberEmailhistoryInfo.setFtitle(title);
		serialnumberEmailhistoryInfo.setFtoaddress(this.to);
		serialnumberEmailhistoryInfo.setFfromaddress(this.from);
		serialnumberEmailhistoryInfo.setFuserid("");
		serialnumberEmailhistoryInfo.setFlanguage(this.language);
		
		SerialnumberEmailhistoryDaoIml daoImpl = new SerialnumberEmailhistoryDaoIml();
		daoImpl.AddSerialnumberEmailhistory(serialnumberEmailhistoryInfo);
		
	}
	
	public boolean SendEmail() {
		// TODO Auto-generated method stub
		boolean resutl = this.startSend(this.title, this.content);
		if(resutl){
			this.saveRecord(this.content, this.title);
	
			logger.info(String.format("�ʼ��������,Title:%s,To:%s;From:%s",title,this.to,this.from));
		}
		
		return resutl;
	}

//	private String getTitle()
//	{
//		if (this.title!=null && this.title.length()>0)
//		{
//			return this.title;
//			
//		}
//		String title = "Hello, ��ӭע��Chase App";
//		if(this.language == 1)
//		{
//			title = "Hello, Welcome to register Chase App";
//		}
//		
//		
//		return title;
//	}
	@Override
	public void run() {
								
		SendEmail();
	}
}
