import smtplib

def send_email(sender_email, sender_password, receiver_email, subject, message):
    try:
        # Establish a secure session with the SMTP server
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        
        # Login to your email account
        server.login(sender_email, sender_password)
        
        # Create the email message
        email_message = f"Subject: {subject}\n\n{message}"
        
        # Send the email
        server.sendmail(sender_email, receiver_email, email_message)
        print("Email sent successfully!")
    except Exception as e:
        print("An error occurred while sending the email:", str(e))
    finally:
        # Close the SMTP server connection
        server.quit()

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
