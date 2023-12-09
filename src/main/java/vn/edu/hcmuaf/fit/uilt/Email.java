package vn.edu.hcmuaf.fit.uilt;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Email {
    public static boolean sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("20130436@st.hcmuaf.edu.vn","thao221722");
            }
        };
        Session session = Session.getInstance(props,auth);

        try {

            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("20130436@st.hcmuaf.edu.vn"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        }
        return true;
    }
    public static boolean sendMailHTML(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("20130436@st.hcmuaf.edu.vn","thao221722");
            }
        };
        Session session = Session.getInstance(props,auth);

        try {

            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("20130436@st.hcmuaf.edu.vn"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
           message.setContent(text, "text/html");
            // Gửi email
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        }
        return true;
    }

    public static void main(String[] args) {
        Email.sendMailHTML("lucvy221722@gmail.com","mat khau","<button>Xin Chao</button>");
    }
}
