package Backend;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author jara
 */
public class EnviarCorreo {

    public void Email(String destino, String Mensaje, String Asunto) {
        try {
            // Get system properties
            final String username = "hospitalregionaloccidente@gmail.com";
            final String password = "hrdo1234";
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                // Define message
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setSubject(Asunto);
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
                message.setText(Mensaje);
                // Envia el mensaje
                Transport.send(message);
            } catch (Exception e) {
            }
        } catch (Exception e) {
        }
    }
}
