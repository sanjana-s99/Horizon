package Model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail
{ 
    public static void send(String to, String sub, 
                         String msg)
    { 
        //create an instance of Properties Class   
        Properties props = new Properties();
        
        //intializing user name and passwors
        final String user = "weuse.work@gmail.com"; // Enter your email here
        final String pass = "lebdkufvlhhmlvvv"; //Enter your passwrod here
     
        /*  Specifies the IP address of your default mail server
     	      for e.g if you are using gmail server as an email sever
            you will pass smtp.gmail.com as value of mail.smtp host. 
            As shown here in the code. 
            Change accordingly, if your email id is not a gmail id
        */
        props.put("mail.smtp.host", "smtp.gmail.com");
        // below mentioned mail.smtp.port is optional 
        props.put("mail.smtp.port", "587");		
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
     
        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
        */

        Session session = Session.getInstance(props,new javax.mail.Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication()
            {
  	 	         return new PasswordAuthentication(user,pass); 
            }
        });

        try {
 
     	      /*  Create an instance of MimeMessage, 
     	          it accept MIME types and headers 
     	      */
     
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            /* Transport class is used to deliver the message to the recipients */
           
            Transport.send(message);
        }
        catch(MessagingException e) {
    	       System.out.println(e);
        }
    }  
}