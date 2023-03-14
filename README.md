# sutharsan_project_organichat


Getting started


Title:
# Organic Chat   (Chat within Organization)

Vision :  To provide a professional communication platform.

Project description :

- Organic chat is a chat that behaves and interacts between two or more objects(Persons) in a professional way that doesn’t affect any individuals and to follow the guidelines of the organization.  


- The user must be a part of the Organization to make use of the service, the user's domain name behind their mail-Id been validate this during registration.


- After registering to the service the user has the selection to decide the type of chat they can proceed with. 


- Personal chat is sorted as sending text and sharing images with the other users in one to one.


- In the Communal chat, one of the users who develop the commune , the user has to provide name and password to the commune. The commune Key will be auto generated. The members of the Commune to be added by the user who creates the commune by sharing the commune Key and password individually to the user.


- The admin is the one in the organization who acts as the user in charge, when the complaint or report is raised by any of the users as issues .


- The report raised with the message Key or communal Key have to be submitted to the admin. The admin invokes the message or commune to investigate the event and make recommendations to the user who raised the report. Then the final decision will be made on the report and updated. This report decision should ensure that the Interaction is held in an Professional manner.




Modules:

Admin 
- Supervises the messages , if necessary (Right to make necessity Actions)

Personal chat
- Sender
- Receiver

Commune Chat
- Space Creator
- Message sender
- Message
- Space Audience 


DataBase:

 - Register		- > Registration
 - PersonalChat	- > Text communication (One to One)
 - PersonalFiles	- > Sharing images (One to One)
 - Commune		- > Creation of Commune
 - CommuneMembers	- > Joining members to the Commune
 - Message		- > Image sharing to the Commune
 - TextMessage	- > Text messages to the Commune
 - Report 		- > Creation of report by user & verified by Admin




Features and Workflow:

	Register():

Get Mail 
- Validate( Mail format @ domain.com)
- Generate User Id for User (Auto generate)
- Generate UserName -> Generated as first four characters of mail id and chat user name

To Validate Register  

- Set Security Questions From Drop down
- Set Password
- Confirm Password


	Login()


- Get userName , password
- If Forgot Password ask security Question
- If security question’s answer is correct , then move on to reset password and 
- Set password and re-enter password
- Login Time
	

	chatPersonal()


- Select userName to connect
- Write text message or share images 
  -	-	> Send text or share images
  -	-	> Receive text or images
  -	-	> View sent messages.


    chatCommunal()


- Create Commune to Make Chat Publicly
- Commune to have unique name
- Commune Key be generated
- Select the members to the Commune by providing a password for the commune and adding users by sharing the group key and password individually. 
- Send message randomly on choosing the member on commune key and password
- Users can join the commune
- Make messages and share thoughts in Commune 


	report()


- Make report on event(message) to admin 
- Admin to file report and make issue and enquire
Based on enquiry make recommendations 
Take necessary actions based on the recommendation


	admin()


- Admin is the user who have the access to view the message and make investigations .
Recommend the petitioner to do things or ask for final suggestions.
Final decision made on the message and User to continue in the Commune or chat.











