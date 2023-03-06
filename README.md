# sutharsan_project_organichat



## Getting started

Title:
Organic Chat 
 (Within Organization) 

Description:
Organic chatting is chatting that behaves and interacts between two or more objects(Persons) in a healthy way that doesn’t affect any individuals and to follow the guidelines of the organization.

The user must be a part of the Organization to make use of the service, the mail id of the user validates the process and allows registration.

After registering to the service the user has the option to choose the type of conversation they can proceed with. Conversation made in person must provide the comfortness of the receiver , so the receiver has the option to reject the unwanted and unnecessary messages. Here the messages are based on the message Id that to be auto generated. 

In the Communal chat, one of the users who creates the commune , the user has to provide name and password to the commune.The commune Id has been auto generated. The members of the group to be added by the user, who creates the commune .

The admin is the one in the organization who acts as the user in charge, when the complaint is raised by any of the users who faced such a worse situation.

The report raised with the message id or communal id have to be submitted to the admin. The admin invokes the message or commune to investigate the event and make recommendations to the user who raised the report. Then the final decision will be made on the report and updated.  This report decision should ensure that the communication is held in an Organic manner.





Modules:

Admin 
-Supervises the messages , if necessary (Right to make necessity Actions)

Personal chat
-Sender
-Receiver

Commune Chat
- Space Creator
- Space Members
- Space messenger
- Space Audience


DataBase:

Registration
PersonalChat
Sender
Receiver
CommunalChat
Message 
Report
Admin





Features and Workflow:

	Register():

Get Mail 
Validate( Mail format @ domain .com)
Generate Chat Id for User (Auto generate)
Generate Username 
Generate as first five characters of mail id and chat user id

Validate Register

Set Security Questions From Drop down
Set Password
Confirm Password

	Login()

Get mail , password
If Forgot Password ask security Question
If security question’s answer is correct , then move on to reset     password and 
Set password and re-enter password
Login Time
	
	chatPersonal()

Select username to connect
Send request to receiver
Accept/Decline of request from receiver
If decline- terminate chat Process
If Accepts Allow access to Message Table 



chatCommunal()

Create Space to Make Chat Publically
Create table for the space with Communal Id
Set table to have Password for access Messages
Select the members to the Space
Make messages that to be stored in Space

report()

Make report on event(message) to admin 
Admin to file report and make issue and enquire
Based on enquiry make recommendations 
Take necessary actions based on the recommendation

admin()

Admin is the user who has the access to view the message and make investigations .
Recommend the petitioner to do things or ask for final suggestions.
Final decision made on the message and User to continue in the Commune or chat.








To add :

Set reminder

Set Emergency Message

Add Meet call

Set Medical Aid (Basic First Aid kit)




