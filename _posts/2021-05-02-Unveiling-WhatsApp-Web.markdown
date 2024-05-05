---
title: Unveiling WhatsApp Web
author: mehul
date: 2021-05-02 16:39:00
categories: [Blogging, WriteUp]
tags: [SSL/TLS, WhatsApp, HTTPS]
image:
  path: '/assets/img/headers/whatsapp.webp'
  alt: The artwork is split in half, with one side showing the WhatsApp logo and the other revealing a network of wires and electronic circuits, symbolizing the underlying technology.
---

## Introduction

WhatsApp is a free messaging and voice-over-IP service available on multiple platforms. Facebook, Inc. owns it and enables users to send text and voice messages, make voice and video calls, and share images, documents, user locations, and other content.

One of its notable features is WhatsApp Web, which allows users to access the messaging service on desktop computers as long as their mobile device remains connected to the internet. This capability was introduced in 2017, and it syncs the phone application with the desktop app using the same WhatsApp account, retrieving all the messages and media. Unlike the mobile application, WhatsApp Web works on web browsers, which allows for further investigation into its infrastructure to understand its behavior better.

## Setup

As part of my research, I used an Ubuntu machine to log my SSL handshakes. The machine had a Firefox web browser, Wireshark installed, a stable internet connection, and a working WhatsApp account.
Given the intricate nature of SSL encryption, a standard feature of most messaging platforms including WhatsApp, I embarked on the task of devising a method to circumvent this encryption.

To confirm this, I took a small Wireshark capture while using WhatsApp web and observed that all the traffic going to the WhatsApp server from the web browser was indeed encrypted using TLS. I also saw the TLS Client Hello and the change in Cipher protocols in the Wireshark capture.
![Wireshark of WhatsApp Web 1](/assets/img/posts/UnveilingWhatsapp-1.png){: width="972" height="589" } *WhatsApp Web Wireshark Capture*
![Wireshark of WhatsApp Web 2](/assets/img/posts/UnveilingWhatsapp-2.png){: width="972" height="589" } *WhatsApp Web Wireshark Capture*

A bit of digging around provided me with an article on the AskF5 forum. To get a better explanation of this method, I would suggest going over the link itself however the basic steps to go decipher the TLS packets are as follows:
- Create a log file to store all the TLS handshakes.
  - ``touch sslkey.log``
- Modify the ``SSLKEYLOGFILE`` environment variable to store the handshakes within that log.
  - ``export SSLKEYLOGFILE="/home/user/sslkey.log"``
- Open Firefox within the same shell
  - ``firefox &``

After using WhatsApp web using this web browser and capturing all this traffic through Wireshark we now have everything we need to see what is within the TLS packets.
![Generated sslkey.log](/assets/img/posts/UnveilingWhatsapp-3.png){: width="972" height="589" } *Generated sslkey.log*

Wireshark has a built-in capability to read these logs and decrypt the .pcap traffic. This option is available under *Edit* > *Preferences* > *Protocols* > *TLS* > *(Pre)-Master-Secret Log*, selecting the generated ``sslkey.log``, we are now able to look within all the encrypted TLS traffic.
By doing this, we are immediately able to see all the TLS traffic between the WhatsApp server and our web browser.
![Wireshark of WhatsApp Web 3](/assets/img/posts/UnveilingWhatsapp-4.png){: width="972" height="589" } *WhatsApp Web Wireshark Capture*

We can now go further and analyze these packets to get a better clue of how WhatsApp works.

## Analysis

After the TLS handshakes and the TCP connections, the first observation is that WhatsApp uses HTTP2 for most of its communication, the first packet sends out a Stream consisting of a couple of different headers.

These are: ``MAGIC``, ``SETTINGS``, ``WINDOW_UPDATE``, and ``PRIORITY``.
![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-5.png){: width="972" height="589" } *HTTP2 Headers*

- ``MAGIC`` : contains the protocol and basic information about how data is being sent.
- ``SETTINGS`` : used to set the initial browser window size, optimizing itself for the max size of frames it should receive based on the connection.
- ``WINDOW_UPDATE`` : provide any changes made to the window itself, updating the server using a parameter called ``Window Size Increment``.
- ``PRIORITY`` : contains five parameters, *Reserved*, *Stream Identifier*, *Exclusive*, and *Stream Dependency* and *Weight*.

>  The Stream Identifier is the ID pertaining to the Data that gets sent. The Stream Dependency is the number on which that ``PRIORITY`` header is dependent on and it is always a value lower than its own Stream ID. The Weight ranges from 0 to 240, and signifies the importance of Stream ID.
{: .prompt-tip }

Although we can see ``HEADERS`` and ``WINDOW_UPDATE`` as well as ``SETTINGS`` throughout the packet capture, the ``MAGIC`` and ``PRIORITY`` headers are only used for the initial setup for WhatsApp Web.

After the initial packet, the next packet contains a new header called ``HEADERS``. This contains information like the method used, the path, the authority, scheme, user-agent, data accepted, the language accepted, encoding accepted, upgrade-insecure-requests, and the trailers.

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-6.png){: width="972" height="589" } *HTTP2 Headers*

The next couple of ``HEADERS`` send ``GET`` requests to ``/bootstrap_qr-e892ca30934b9f1b9db6.css`` for CSS, and ``/vendor1~bootstrap_qr.69e960b196d7d6aa3d46.js``, ``/bootstrap_qr.df9188bb4cd23ee53e79.js`` for JavaScript.

As a reply, the server sends back a packet containing a ``DATA`` header. The first couple of ``DATA`` headers contain HTML, CSS and JavaScript requested by the Web Browser.

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-7.png){: width="972" height="589" } *HTTP2 Headers*

The ``DATA`` header is much simpler than its counterparts, it has a Stream Identifier parameter and a Data parameter that contain that data. It also has flags like *Unused*, *Padded*, and *End-Stream*. Padded is set to 1 when data is being sent, after the data has been completed, it gets set to 0 and the End Stream Flag is set to 1.

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-8.png){: width="972" height="589" } *HTTP2 Headers*

Observing all this data, we can see that it is all encrypted as well, this would be because of the implemented end-to-end encryption by WhatsApp, where each chat is individually encrypted among the recipients. WhatsApp provides its white pages which have a good explanation of how its Encryption and various features work.

Although the chat itself is encrypted, we are still able to catch some data types that come from the server. One example of this is when a picture is shared, we can get the PNG signature, the image header, palette, image data chunk, and the image trailer.

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-9.png){: width="972" height="589" } *HTTP2 Headers*

The emojis shared can also be seen when the web browser uses a ``HEADERS`` header to send a ``GET`` request for those resources, which goes as follows ``GET /img/[emoji-name].webp``

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-10.png){: width="972" height="589" } *HTTP2 Headers*

Another interesting header that occasionally comes up is the ``RST_STREAM`` header which contains a Stream Identifier parameter and an Error parameter.

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-11.png){: width="972" height="589" } *HTTP2 Headers*

This is being used by the web browser to tell the server to stop processing certain streams or convey any other such errors.

The last header that gets sent to close the connections is the ``GOAWAY`` header, this is first sent by the web browser to the server and then the server echoes it back to the web browser, this contains a *Stream Identifier*, *Reserved*, *Promised-Stream-ID*, and an *Error* parameter. A Successful closing takes place with the Error parameter set to ``0`` which is the ``NO_ERROR`` condition.

![HTTP2 Headers](/assets/img/posts/UnveilingWhatsapp-12.png){: width="972" height="589" } *HTTP2 Headers*

## Future Research Possibilities

Further research can be conducted on the protocol; traffic can be captured while performing various actions such as sending different media through chat, adding new users, deleting messages, creating group chats, etc. This will provide us with an even more precise understanding of the headers and protocols used by WhatsApp. We can even use the technical white pages supplied by WhatsApp to decrypt the end-to-end encrypted data further, finding out exactly how each text message is sent.

## Conclusion

WhatsApp Messenger is a very sophisticated environment with its own set of protocols and headers. WhatsApp Web allows us to monitor this traffic through HTTP and better understand how it behaves. We can bypass SSL encryption and get a clearer view of the interactions between WhatsApp servers and the web browser.

## Disclaimer

Since WhatsApp Web is a private organization, it does not disclose its exact source code. We cannot know exactly how it behaves in the backend; the most we can do is observe the traffic and make educated guesses about how it might work. I analyzed the web traffic captured and made the best estimates as to how these headers might be used. This information may not be completely accurate.

# References

- [Wikipedia - WhatsApp](https://en.wikipedia.org/wiki/WhatsApp)
- [WhatsApp Web](https://web.whatsapp.com/)
- [Decrypt SSL traffic with the SSLKEYLOGFILE environment variable on Firefox or Google Chrome using Wireshark](https://support.f5.com/csp/article/K50557518)
- [WA Security Whitepaper](https://www.scribd.com/document/545335419/WA-Security-WhitePaper-1)
