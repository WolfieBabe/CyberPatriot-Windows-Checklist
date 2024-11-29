# CyberPatriot-Windows-Checklist
  **Note: Try to do these steps in order as to not prevent yourself from later on**

  
1. Read the readme
   
     Note down which ports, users, and programs are allowed

   
2. **Do Forensics Questions**
   
     You may destroy the requisite information if you work on the checklist!

   
3. Download the files in the folder in this repository named "CyberPatriot-Windows-Scripts"

     1. Place these onto the desktop of the virtual machine

     2. Right-click on the "CyberPatriot-Windows-Script-Starter" file and click "run as administrator"
   
     3. Wait for all of the processes to finish before proceeding

   
4. Begin installing the Windows Updates via settings


5. Program and application management

    1. Delete suspicious programs/applications

         1. Open Control Panel → Programs and Features

         2. Delete suspicious programs/applications and "hacking tools"
  
    2. Install/update Firefox
  
         * If installed: Open Firefox, click the three lines in the top right, click "help," click "About Firefox," update Firefox
     
         * If not installed: Go to https://www.mozilla.org/en-US/firefox/download/thanks/, run the installer, and go through the installation process

    3. Update other programs/applications


6. Account Management

    1. Navigate to Control Panel → User Accounts

       1. Click on "Change User Account Control settings" and set it to "Always Notify"

       2. Click on "Manage another account"

          * Delete any unauthorized users

          * Create any new Users' Accounts
      
          * Change/add any passwords as needed
      
          * Change administration privileges as needed

    2. Open the terminal as administrator

       1. Run `net user`
    
       2. For each username displayed replace USERNAME with their username and run `wmic UserAccount where Name="USERNAME" set PasswordExpires=True` 

       3. If there are any other suspicious hidden users, they may be present here or in lusrmgr.msc
    

7. Auditing

     1. Press Windows Key + R and type secpol.msc and hit enter

     2. To navigate to the basic auditing, Local Policy → Audit Policy; To navigate to the advanced auditing, go to Advance Policy Auditing → Audit Policies  

     3. Assign appropriate auditing policies according to this table:
  <table border="1" cellpadding="5" align="center">
	<tbody align="center">
		<tr>
			<td><h5>Audit Policy Category or Subcategory</h5></td>
			<td><h5>&nbsp;Success&nbsp;</h5></td>
			<td><h5>&nbsp; Failure&nbsp;&nbsp;</h5></td>
		</tr>
		<tr>
			<td colspan="3"><b>Account Logon</b></td>
		</tr>
		<tr>
			<td>&nbsp;Audit Credential Validation</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>&nbsp;Audit Kerberos Authentication Service&nbsp;</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>&nbsp;Audit Kerberos Service Ticket Operations&nbsp;</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>&nbsp;Audit Other Account Logon Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>Account Management</b></td>
		</tr>
		<tr>
			<td>Audit Application Group Management</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Computer Account Management</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Distribution Group Management</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>&nbsp; Audit Other Account Management Events&nbsp;</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Security Group Management</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit User Account Management</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>Detailed Tracking</b></td>
		</tr>
		<tr>
			<td>Audit RPC Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Process Termination</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Process Creation</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit RPC Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>DS Access</b></td>
		</tr>
		<tr>
			<td>&nbsp;Audit Detailed Directory Service Replication&nbsp;</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Directory Service Access</td>
			<td>No</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Directory Service Changes</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit Directory Service Replication</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>Logon and Logoff</b></td>
		</tr>
		<tr>
			<td>Audit Account Lockout</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit User/Device Claims</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit Directory Service Changes</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit IPsec Extended Mode</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit IPsec&nbsp;Main Mode</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit IPsec&nbsp;Quick&nbsp;Mode</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Logoff</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit Logon</td>
			<td>No</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Network Policy Server</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Other Logon/Logoff Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Special Logon</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>Object Access</b></td>
		</tr>
		<tr>
			<td>Audit Application Generated</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Certification Services</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Detailed File Share</td>
			<td>No</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit File Share</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit File System</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Filtering Platform Connection</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Filtering Platform Packet Drop</td>
			<td>No</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit Handle Manipulation</td>
			<td>No</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Kernel Object</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Other Object Access Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Registry</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Removable Storage</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit SAM</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Central Access Policy Staging</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td colspan="3"><b>Policy Change</b></td>
		</tr>
		<tr>
			<td>Audit Audit Policy Change</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Authentication Policy Change</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Authorization Policy Change</td>
			<td>Yes</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit Filtering Platform Policy Change</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit MPSSVC Rule-Level Policy Change</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Other Policy Change Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>Privilege Use</b></td>
		</tr>
		<tr>
			<td>Audit Non-Sensitive Privilege Use</td>
			<td>No</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Other Privilege Use Events</td>
			<td>No</td>
			<td>No</td>
		</tr>
		<tr>
			<td>Audit Sensitive Privilege Use</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>System</b></td>
		</tr>
		<tr>
			<td>Audit IPsec Driver</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Other System Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Security State Change</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Security System Extension</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit System Integrity</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td colspan="3"><b>Global Object Access Auditing</b></td>
		</tr>
		<tr>
			<td>Audit IPsec Driver</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Other System Events</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Security State Change</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit Security System Extension</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
		<tr>
			<td>Audit System Integrity</td>
			<td>Yes</td>
			<td>Yes</td>
		</tr>
	</tbody>
</table>
<!-- DivTable.com -->


8. File Protection

     1. Turn off Sharing Drives: Open File Explorer → Click This PC → Right Click  the Local Disk Drive → Share with → Advanced Sharing → Uncheck Share this folder → Click OK

     2. Create Backups: Control Panel → System and Security → Backup and restore
  
     3. To view or edit file or directory shares, press Windows Key + R, type fsmgmt.msc, and press enter
  
        * Note: The C$, ADMIN$, and IPC$ shares are default administrative shares created automatically by Windows; others shouldlikely be disabled


9. Secure/Disable RDP - Secure RPD if it is a critical system, otherwise disable it

	If Critical

     1. Ensure network-level authentication

		1. Open settings and navigate to System → Remote Desktop and Enable Remote Desktop
    
		2. Navigate to Advanced Settings and enable "Require computers to use Network Level Authentication to connect (recommended)"
   
     2. Set the RDP security layer to SSL
        
        1. Press Windows Key + R and run gpedit.msc
          
        2. Navigate to Local Computer Policy → Computer Configuration → Administrative Templates → Windows Components → Remote Desktop Services → Remote Desktop Session Host → Security → Require use of specific security layer for remote (RDP) connections

		3. Enable the requirement and set the security layer to SSL
  
  	To Disable

	 1. Press Windows Key + R and run services.msc

     2. For each service (Remote Access Connection Manager, Remote Desktop Configuration, and Remote Desktop Services) navigate to the properties window and set startup type to disabled
  
        * While here disable IIS, NetMeeting Remote Desktop Sharing – VoIP, Remote Desktop Help Session Manager, Remote Registry, Routing and Remote Access, Simple File Sharing, SSD Discovery Service, Telnet, FTP, Universal Plug and Play Device Host, and Windows Messenger Service unless otherwise specified in the README
       
        * Also make sure the "Event log" service is running and set to auto start / enabled


10. Account Policies

     1. Press Windows Key + R and type secpol.msc
   
     2. Password policies - Navigate to Account Policies → Password Policy and set 
   
	* Enforce password history – 5

 	* Maximum password age – 90 days

 	* Minimum password age – 15 days

  	* Minimum password length – 10

    	* Password must meet complexity requirement – Enable
   
     	* Store password using reversible encryption – Disable

     3. Account policies - Navigate to Account Policies → Account Lockout Policy
   
        * Account lockout duration ‐ 30
       
        * Account lockout threshold – 10
       
        * Reset account lockout counter after ‐ 30
       
     4. Limit local use of blank passwords to console only - Navigate to Security Settings → Local Policies →
Security Options and set "Accounts: Limit local account use of black passwords to console logon only" to enabled



## Extras 

1. Find which policies are running under svchost (useful for finding malware) using <a href="https://www.bleepingcomputer.com/tutorials/list-services-running-under-svchostexe-process/">this guide</a>

2. More tools using <a href="https://live.sysinternals.com/">Sysinternals</a>

3. To find a hash of a file, open powershell and run `Get-FileHash FILEPATH_HERE -Algorithm HASHTYPE_HERE` where FILEPATH_HERE is the absolute path to your file and HASHTYPE_HERE is your type of hash (SHA1, SHA256, SHA384, SHA512, or MD5)

4. Check out https://marshallcyberclub.github.io/resources/The%20Ultimate%20Windows%20Checklist.pdf for literally anything you could possibly need and https://www.ultimatewindowssecurity.com/securitylog/book/page.aspx?spid=chapter1 for more general knowledge
