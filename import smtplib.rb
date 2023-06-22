import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def send_email(sender_email, sender_password, receiver_email, subject, message):
    try:
        # Create a MIME message
        mime_message = MIMEMultipart()
        mime_message["From"] = sender_email
        mime_message["To"] = receiver_email
        mime_message["Subject"] = subject

        # Attach the message to the MIME message
        mime_message.attach(MIMEText(message, "plain"))

        # Create a secure connection with the SMTP server
        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
            # Login to your email account
            server.login(sender_email, sender_password)
            
            # Send the email
            server.sendmail(sender_email, receiver_email, mime_message.as_string())
        
        print("Email sent successfully!")
    except smtplib.SMTPAuthenticationError:
        print("Authentication error: Failed to login. Please check your email credentials.")
    except smtplib.SMTPException as e:
        print("An error occurred while sending the email:", str(e))
    except Exception as e:
        print("An unexpected error occurred:", str(e))

def main():
    # Sender's email credentials
    sender_email = "your_email@gmail.com"  # Replace with your sender email address
    sender_password = "your_password"  # Replace with your sender email password
    
    # Recipient's email address
    receiver_email = "recipient_email@example.com"  # Replace with the recipient's email address
    
    # Email details
    subject = "Auto Message"
    message = "This is an auto-generated message."
    
    # Send the email
    send_email(sender_email, sender_password, receiver_email, subject, message)

if __name__ == "__main__":
    main()
