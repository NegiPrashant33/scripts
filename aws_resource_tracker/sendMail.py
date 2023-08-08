import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication
import datetime

current_date = datetime.datetime.now().strftime('%d-%B-%Y')
file_name = f'aws_resource_usage_{current_date}.txt'

# Email configuration
sender_email = "prashantnegia@gmail.com"
sender_password = "hyjjdjqalrwvioby"
receiver_email = "arorapiya0709@gmail.com"
subject = f"AWS Resource Usage for {current_date}"

# MIME multipart message
msg = MIMEMultipart()
msg["From"] = sender_email
msg["To"] = receiver_email
msg["Subject"] = subject

# Attaching the generated file
file_path = f'/home/prashant/scripts/aws_resource_tracker/{file_name}'
with open(file_path, "rb") as file:
    attach = MIMEApplication(file.read(), _subtype="txt")
    attach.add_header("Content-Disposition", "attachment", filename=file_name)
    msg.attach(attach)


# Connect to SMTP server and send the email
with smtplib.SMTP('smtp.gmail.com', 587) as server:
    server.starttls()
    server.login(sender_email, sender_password)
    server.send_message(msg)

print(f'Email sent successfully with file: {file_name}')