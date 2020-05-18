package vs.ms.ms_001.service;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClientBuilder;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

public class AmazonSESSample {

    // Replace sender@example.com with your "From" address.
    // This address must be verified.
    //static final String FROM = "afsd0422@naver.com";
    //static final String FROMNAME = "bikendrun.shop";
	
    // Replace recipient@example.com with a "To" address. If your account 
    // is still in the sandbox, this address must be verified.
    //static final String TO = "recipient@example.com";
    
    // Replace smtp_username with your Amazon SES SMTP user name.
    //static final String SMTP_USERNAME = "smtp_username";
    
    // Replace smtp_password with your Amazon SES SMTP password.
    //static final String SMTP_PASSWORD = "smtp_password";
    
    // The name of the Configuration Set to use for this message.
    // If you comment out or remove this variable, you will also need to
    // comment out or remove the header below.
    //static final String CONFIGSET = "ConfigSet";
    
    // Amazon SES SMTP host name. This example uses the 미국 서부(오레곤) region.
    // See https://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html#region-endpoints
    // for more information.
    //static final String HOST = "email-smtp.ap-northeast-2.amazonaws.com";
    
    // The port you will connect to on the Amazon SES SMTP endpoint. 
    //static final int PORT = 587;
    
    //static final String SUBJECT = "Amazon SES test (SMTP interface accessed using Java)";
    
    //static final String BODY = String.join(
    //	    System.getProperty("line.separator"),
//    	    "<h1>Amazon SES SMTP Email Test</h1>",
//    	    "<p>This email was sent with Amazon SES using the ", 
//    	    "<a href='https://github.com/javaee/javamail'>Javamail Package</a>",
//    	    " for <a href='https://www.java.com'>Java</a>."
//    	);
	private static final String AccessKey = "AKIAIA7ZSUL64JLSCDKA";
	private static final String SecretKey = "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";

    public void awsEmailSending() {
    	System.out.println("awsEmailSending");
    	System.out.println("awsEmailSending");
    	System.out.println("awsEmailSending");
    	System.out.println("awsEmailSending");
    	String from = "afsd0422@naver.com"; 
    	String to = "afsd0422@naver.com"; 
    	//  String configSet = "ConfigSet"; 
    	String subject = "Amazon SES test (AWS SDK for Java)"; 
    	String htmlBody = "<h1>Amazon SES test (AWS SDK for Java)</h1>" 
    	+ "<p>This email was sent with " + "https://aws.amazon.com/ses/'>" 
    	+ "Amazon SES</a> using the " + "https://aws.amazon.com/sdk-for-java/'>" 
    	+ "AWS SDK for Java</a>"; 
    	String textBody = "This email was sent through Amazon SES " 
    	+ "using the AWS SDK for Java."; 
    	AWSCredentials awsCreds = new BasicAWSCredentials(AccessKey, SecretKey); 
    	AmazonSimpleEmailServiceClientBuilder builder = AmazonSimpleEmailServiceClientBuilder.standard(); 
    	AmazonSimpleEmailService ses = builder.withRegion(Regions.US_WEST_2) 
    			.withCredentials(new AWSStaticCredentialsProvider(awsCreds)) .build(); 
    	try {
    		SendEmailRequest request = new SendEmailRequest() 
    				.withDestination(new Destination().withToAddresses(to)) 
    				.withMessage(new Message().withBody(new Body() 
						.withHtml(new Content("UTF-8").withData(htmlBody)) 
						.withText(new Content("UTF-8").withData(textBody)) ) 
						.withSubject( new Content().withCharset("UTF-8").withData(subject)) 
    					)
    				.withSource(from); 
    		//   .withConfigurationSetName(configSet); 
    		ses.sendEmail(request); 
    		System.out.println("Email sent!"); 
    		} catch (Exception e) {
    			e.getMessage(); 
    		}
    
}

}