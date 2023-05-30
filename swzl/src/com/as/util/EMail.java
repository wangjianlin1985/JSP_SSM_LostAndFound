package com.as.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * @author wangqun
 * @date 2018年3月15日 下午10:32:24
 * @version 0.0.1
 * @description 
 */
public class EMail {
	
	public static void main(String[] args) {
		EMail eMail = new EMail("13866725169@139.com", "没有主题", "没有内容");
		eMail.sendMail();
	}
	
	String to = ""; // 收件人
	
	String from = "1224183237@qq.com"; // 发件人  这个是发件箱的地址配置，到时候换成你的QQ邮箱
	
	String host = "smtp.qq.com"; // smtp主机
	
	String username = "1224183237@qq.com"; // 用户名
	
	String password = "gwirojxzxustiicc"; // 授权码
	
	String subject = ""; // 邮件主题
	
	String content = ""; // 邮件正文

	public EMail(String to, String subject, String content) {
		super();
		this.to = to;
		this.subject = subject;
		this.content = content;
	}

	public EMail() {
		super();
	}
	
	
//	/**
//	 * 把主题转换为中文
//	 * @param strText
//	 * @return
//	 */
//	public String transferChinese(String strText) {
//		try {
//			strText = MimeUtility.encodeText(new String(strText.getBytes(),
//					"GB2312"), "GB2312", "B");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return strText;
//	}
//
//	
	
	/**
	 * 发送邮件
	 * 
	 * @return 成功返回true，失败返回false
	 */
	public boolean sendMail() {
		
		try {
			
			// 构造mail session
			Properties props = System.getProperties();
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.ssl.socketFactory", sf);
			Session session = Session.getDefaultInstance(props,
					new Authenticator() {
						public PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					});
			
			// 构造MimeMessage并设定基本的值，创建消息对象
			MimeMessage msg = new MimeMessage(session);
			// 设置消息内容
			msg.setFrom(new InternetAddress(from));
			// 把邮件地址映射到Internet地址上
			InternetAddress[] address = { new InternetAddress(to) };
			/**
			 * setRecipient（Message.RecipientType type, Address
			 * address），用于设置邮件的接收者。<br>
			 * 有两个参数，第一个参数是接收者的类型，第二个参数是接收者。<br>
			 * 接收者类型可以是Message.RecipientType .TO，Message
			 * .RecipientType.CC和Message.RecipientType.BCC，TO表示主要接收人，CC表示抄送人
			 * ，BCC表示秘密抄送人。接收者与发送者一样，通常使用InternetAddress的对象。
			 */
			msg.setRecipients(Message.RecipientType.TO, address);
			// 设置邮件的标题
			msg.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
			// 构造Multipart
			Multipart mp = new MimeMultipart();

			// 向Multipart添加正文
			MimeBodyPart mbpContent = new MimeBodyPart();
			// 设置邮件内容(纯文本格式)
			// mbpContent.setText(content);
			// 设置邮件内容(HTML格式)
			mbpContent.setContent(content, "text/html;charset=utf-8");
			// 向MimeMessage添加（Multipart代表正文）
			mp.addBodyPart(mbpContent);
			// 向Multipart添加MimeMessage
			msg.setContent(mp);
			// 设置邮件发送的时间。
			msg.setSentDate(new Date());
			// 发送邮件
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	
	
	
	
	
	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
