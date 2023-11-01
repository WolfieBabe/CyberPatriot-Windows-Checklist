# CyberPatriot-Windows-Checklist
  **Note: Try to do these steps in order as to not prevent yourself from later on**

  
1. Read the readme
   
     Note down which ports/users are allowed

   
2. **Do Forensics Questions**
   
     You may destroy the requisite information if you work on the checklist!

   
3. Download the folder in this repository named "CyberPatriot-Windows-Scripts" and the file named "CyberPatriot-Windows-Script-Starter"

     1. Place these onto the desktop of the virtual machine

     2. Right-click on the "CyberPatriot-Windows-Script-Starter" file and click "run as administrator"
   
     3. Wait for all of the processes to finish before proceding

   
5. Begin installing the Windows Updates via settings


6. Program and application managment

  1. Delete suspicious programs/applications

       1. Open Control Panel → Programs and Features

       2. Delete suspicious programs/applications and "hacking tools"
  
  2. Install/update Firefox
  
       * If installed: Open Firefox, click the three lines in the top right, click "help," click "About Firefox," update Firefox
     
       * If not installed: Go to https://www.mozilla.org/en-US/firefox/download/thanks/, run the installer and go through the installation process

  3. Update other programes/applications


7. Account Managment

  1. Control Panel → User Accounts

  1. Click on "Change User Account Control settings" and set it to "Always Notify"

     2. Click on "Manage another account"

       * Delete any unauthorized users

       * Create any new Users' Accounts
      
       * Change/add any passwords as needed
      
       * Change administration privileges as needed

  2. Open the terminal as administrator

     1. Run `net user`
    
     2. For each username displayed replace USERNAME with their username and run `wmic UserAccount where Name="USERNAME" set PasswordExpires=True` 
      
