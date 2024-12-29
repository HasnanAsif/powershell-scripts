## PowerShell System Administration Scripts

These are a collection of PowerShell scripts to automate and streamline various system administration tasks, including file management, service monitoring, remote operations, and more.

These scripts are ideal for IT admins, network engineers, and anyone working in systems management.

---


### 🚨 Prerequisites
Before running these scripts, ensure you have the following:
1. Windows PowerShell 5.1 or later (compatible with PowerShell Core)
2. Necessary permissions for executing scripts and accessing remote systems.
3. Some scripts require administrative privileges.

---

### 🔦 Overview of Scripts


1. **Analyze Windows Service**\
&nbsp;&nbsp;&nbsp;&nbsp; Checks if a specified Windows service is installed on the computer and displays its status (running, stopped, etc..)


2. **Disk Space Check**\
&nbsp;&nbsp;&nbsp;&nbsp; Retrieves the total and free space of a drive, analyzes the free space, and provides feedback based on the available disk space, such as whether it's too low, normal, or shareable.

3. **Drive Inventory**\
&nbsp;&nbsp;&nbsp;&nbsp; Provides a list of all files and folders on a drive, showing the item name, creation time, and whether it's a file or folder.

4. **File Rename**\
&nbsp;&nbsp;&nbsp;&nbsp; Renames files in a specified folder by appending a number to their names. It also offers the option to reverse the changes, restoring the files to their original names.

4. **File Size Filter**\
&nbsp;&nbsp;&nbsp;&nbsp; Designed to search for file sizes in a specified directory, where users can enter the directory name and file size threshold.

6. **List Service Report**\
&nbsp;&nbsp;&nbsp;&nbsp; Prompts an administrator for a target computer name and credentials, retrieves a list of stopped services on the specified remote computer, displays them in a table, and saves the results to a text file.

8. **Log Search**\
&nbsp;&nbsp;&nbsp;&nbsp; Search through log files on a Windows system for specific keywords.
  
9. **Manage Domain User**\
&nbsp;&nbsp;&nbsp;&nbsp; Provides an interactive menu to manage Active Directory users. It allows administrators to list all domain users, add a new user to the domain, and remove an existing user from the domain.
  
10. **Ping Computer Check**\
&nbsp;&nbsp;&nbsp;&nbsp; Tests the connectivity to a specified computer using Test-Connection and provides feedback on whether the connection is successful.
  
11. **Remote File Search**\
&nbsp;&nbsp;&nbsp;&nbsp; Search for files of a specific type on a remote computer, provided the user can input the target computer name and file type.

---

### ⛏️ Usage
Clone this repository:\
`Git Clone https://github.com/HasnanAsif/powershell-scripts.git`

Cd into the repository you have cloned\
`cd (your-path)\powershell-scripts`

Check & edit the script if needed prior to running it and make sure the paths and parameters align with your needs.


Run any script in PowerShell\
`.\script-name.ps1` 

Follow the prompts for execution



#### Note: Always review the script before execution and test in a non-production environment to ensure compatibility

---

#### 🌐 Connect With Me:
[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=LinkedIn&link=www.linkedin.com/in/hasnan-asif)](www.linkedin.com/in/hasnan-asif)
[![GitHub](https://img.shields.io/badge/GitHub-gray?style=for-the-badge&logo=Github&link=https://github.com/HasnanAsif)](https://github.com/HasnanAsif)

