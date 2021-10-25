package util;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailUtil {

    private final String fromEmail = "noreply.reviewfood@gmail.com";
    private final String password = "food.123";

    public String generate6DigitsRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public Session sendEmailConfig() {
        // your host email smtp server details
        Properties pr = new Properties();
        pr.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        pr.put("mail.smtp.port", "587"); //TLS Port
        pr.put("mail.smtp.auth", "true"); //enable authentication
        pr.put("mail.smtp.starttls.enable", "true");;
        pr.put( "mail.smtp.socketFactory.port", "587" );
        pr.put( "mail.smtp.socketFactory.fallback", "false" );
        pr.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        //get session to authenticate the host email address and password
        Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        return session;
    }

    //send email to the user email
    public void sendVerifyCodeEmail(String email, String code) {
        try {
            Session session = sendEmailConfig();
            //set email message details
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

            //set email subject
            mess.setSubject("User Email Verification");

            //set message text
            mess.setText("Please verify your account to reset password by using this code: " + code);
            //send the message
            Transport.send(mess);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void sendResetPasswordEmail(String email, String resetPassword) {
        try {
            Session session = sendEmailConfig();
            //set email message details
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

            //set email subject
            mess.setSubject("Password Reset!");

            //set message text
            mess.setText("Use this password: " + resetPassword + " to login and change your password.");
            //send the message
            Transport.send(mess);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
