---
title: FakeLogonScreen
author: mehul
date: 2021-10-03 21:04:00
categories: [Blogging, WriteUp]
tags: [Windows, Password, Tools]
image:
  path: '/assets/img/headers/windows.webp'
  alt: DALL-E Image of Windows created using small geometric shapes in a monochrome design on a black background.
---

## Tool Description

Created by Arris Huijgen @bitsadmin
Current Version 1.1, Last Updated on 02/03/2020
Built using .NET framework which is installed by default in Windows 8, 8.1 and 10.

This tool takes advantage of the normal behavior of a Windows Lock Screen feature to phish out the victims password.

> This tool should be used for educational or authorized testing purposes only to understand security vulnerabilities.
{: .prompt-warning }

## Components

- **FakeLogonScreen.exe** – write output to console (used for remote execution)
- **FakeLogonScreenToFile.exe** – writes output to console as well as %LocalAppData%\Microsoft\user.db

> These components are designed to simulate a Windows lock screen for security testing. Always ensure that such tools are used in a controlled environment.
{: .prompt-info }

## Tool Installation and Execution

Developed by Charles Bennett and Gilles Brassard in 1984, it is the first quantum cryptography protocol and is provably secure. To maintain its security, it relies on two principles of quantum mechanics:

- Go to the GitHub releases page for this tool: [bitsadmin/fakelogonscreen](https://github.com/bitsadmin/fakelogonscreen/releases)
- Download fakelogonscreen_trunk.zip file (73.2 kb)
- Unzip the tool to get the executables

Windows Defender flags the zip file because it detects ``MSIL/Deismos.A!MTB``. So, it is required to disable Windows Defender or allow the threat

> Disabling Windows Defender or bypassing any security software poses significant risks to your system’s security and should be done cautiously.
{: .prompt-danger }

- The executable, when run, displays a lock screen that poses a serious threat, forcing the victim to enter the correct credentials to regain access to their machine
- Validates the password against Active Directory or the local machine
- The credentials are then saved locally or sent to a remote machine

Windows also shows a warning when running the executable locally since the executable is not verified.


## Tool Features

- Minimizes all other windows and blackens any additional displays, showing only the lock screen. It also uses the *Always On Top* setting, so it cannot be moved to the background
- In case of a custom background, it displays that background instead of the default one
- Blocks many shortcut keys to prevent circumventing the screen
- Validate the entered password before closing the screen

> This feature is designed to prevent the usual methods of exiting full-screen applications, highlighting the importance of familiarizing yourself with your system's security features.
{: .prompt-info }

## Detection and Bypass

There are a couple of ways we can detect whether this executable is running or not.

- Internet, Ease of Access, and Power Buttons are absent.

![Utilities Logos](/assets/img/posts/FLS-1.png){: width="972" height="589" } *Utilities Logo Absent in the Tool*

> Familiarize yourself with your system's standard features and settings to quickly spot discrepancies like missing buttons or options.
{: .prompt-tip }

- The Reset Password initially does not appear, and even after repeated failed password logging attempts, *Sign-in options* are never present for local machines.
- Can be bypassed using ``Ctrl`` +`` Alt`` + ``Delete`` (System Interrupts) and then opening task manager.

![Comparison between Windows and the Tool](/assets/img/posts/FLS-2.png){: width="972" height="589" } *Comparison between Windows and the Tool*

> Using system interrupts to manage unauthorized screens can help regain control, but always follow up with a full system security check to ensure no further vulnerabilities remain.
{: .prompt-warning }

# References

- [FakeLogonScreen Github](https://github.com/bitsadmin/fakelogonscreen)
