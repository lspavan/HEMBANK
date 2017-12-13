package g;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class MailAttachment {

    public  String USER_NAME = "hem.banking";  // GMail user name (just the part before "@gmail.com")
    public  String PASSWORD = "G@ecis22a"; // GMail password
    //public  String RECIPIENT = "pavan.lakshmisetty@gmail.com";

  /*  public static void main(String[] args) {
        String from = USER_NAME;
        String pass = PASSWORD;
         // list of recipient email addresses
        String subject = "Java send mail example";
        String body = "Welcome to JavaMail!";

        sendFromGMail(from, pass, to, subject, body);
    }*/

 /*   public static void main(String[] args) {
    	Main m=new Main();
    	m.sendFromGMail("Welcome to HEM Bank","Account number is"+"545445");
}*/
    
    public  void sendFromGMail(String subject, String body,String recipent) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        String[] to = { recipent };
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", USER_NAME);
        props.put("mail.smtp.password", PASSWORD);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(USER_NAME));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, USER_NAME, PASSWORD);
            
            
            File file = new File("D:/Files/EMAIL-STATEMENT.pdf");
	    	MimeBodyPart attachmentPart = new MimeBodyPart();
	    	Multipart multipart = new MimeMultipart();
	    	try {
				attachmentPart.attachFile(file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	multipart.addBodyPart(attachmentPart);
	    	message.setContent(multipart);
            
	    	transport.sendMessage(message, message.getAllRecipients());
            System.out.println("Sending done...");
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
