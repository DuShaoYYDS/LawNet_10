package utils;


import com.sun.mail.util.MailSSLSocketFactory;
import entity.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.FileOutputStream;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class SendMail extends Thread {

    private static String logFileName= "./logs/sendMailLog.txt";

    //发件人信息
    private String From = "3025138186@qq.com";
    //发件人邮箱
    private String recipient = "3025138186@qq.com";
    //邮箱密码
    private String password = "nayudlgbyljqdfch";
    //邮件发送的服务器
    private String host = "smtp.qq.com";

    //前端验证码
    private int captcha;

    //收件人信息
    private User user;
    public SendMail(User user, int captcha){
        this.user = user;
        this.captcha = captcha;
    }

    @Override
    public void run() {
        try {
            Properties properties = new Properties();

            properties.setProperty("mail.host","smtp.qq.com");

            properties.setProperty("mail.transport.protocol","smtp");

            properties.setProperty("mail.smtp.auth","true");

            //QQ存在一个特性设置SSL加密
            MailSSLSocketFactory sf = null;
            try {
                sf = new MailSSLSocketFactory();
            } catch (GeneralSecurityException e) {
                e.printStackTrace();
            }
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);

            //创建一个session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(recipient,password);
                }
            });

            //开启debug模式
            session.setDebug(true);

            //获取连接对象
            Transport transport = null;
            try {
                transport = session.getTransport();
            } catch (NoSuchProviderException e) {
                e.printStackTrace();
            }

            //连接服务器
            transport.connect(host,From,password);


            //创建一个邮件发送对象
            MimeMessage mimeMessage = new MimeMessage(session);
            //邮件发送人
            mimeMessage.setFrom(new InternetAddress(recipient));

            //邮件接收人
            mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(user.getEmail()));

            //邮件标题
            mimeMessage.setSubject("中国法网用户注册");


            //创建日志文件
            File logfile = new File(logFileName);//创建File实例
            if (!logfile.exists()) {//判断文件是否存在
                logfile.getParentFile().mkdirs();//创建文件所在的文件夹
                logfile.createNewFile();//创建文件
            }
            FileOutputStream logTxt = new FileOutputStream(logFileName,true);
            String logContent = "编号：" + user.getId() +"，用户名为：" + user.getUsername() + "正在申请注册成为会员" +
                    "，申请注册的验证码是：" + captcha + "20分钟内有效";
            byte[] bytes = logContent.getBytes();
            logTxt.write(bytes);

            //邮件内容
            mimeMessage.setContent("您正在申请注册成为中国法网会员，验证码为："+captcha+"，验证码在20分钟内有效！","text/html;charset=UTF-8");

            //发送邮件
            transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());

            transport.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }

}


