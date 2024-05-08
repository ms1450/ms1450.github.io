---
title: Improving the Usability and Effectiveness of Privacy Indicators in Android
author: mehul
date: 2023-12-11 20:33:00
categories: [Blogging, Research]
tags: [Android, Privacy Indicators, PI, Privacy, Permission System, System Usability Scale, Unauthorized Resource Access]
image:
  path: '/assets/img/headers/android.webp'
  alt: DALL-E Image of Android created using small geometric shapes in a monochrome design on a black background.
---

## Introduction

In today's interconnected world, the ubiquity of mobile applications comes with heightened concerns over privacy, particularly regarding the use of sensitive resources like cameras and microphones. To address these concerns, Android systems feature Privacy Indicators (PIs)—visual cues that notify users when such resources are accessed. Despite their critical role, the actual impact of these indicators on user awareness and privacy remains underexplored. This gap in knowledge and understanding poses significant challenges to user privacy and security.

> Understanding how your devices manage privacy through visual cues is crucial for safeguarding your personal information.
{: .prompt-tip }

Our study delves into these issues, assessing the effectiveness of existing Privacy Indicators on Android devices and exploring how enhancements in PI design could improve user understanding and detection of unauthorized resource access. This research is vital for boosting user trust and ensuring robust privacy protections in an increasingly digital landscape. Key questions we seek to answer include the effectiveness of current PI implementations and the potential benefits of design improvements.

We have adopted a two-phase research approach: a comprehensive survey involving 111 mobile users to collect insights on current PI perceptions, followed by an experimental study with 20 Android and iOS users employing simulated apps to examine real-time interactions with PIs. This study investigates the current state of PI effectiveness and proposes innovative enhancements like non-visual indicators and broader access categories such as location and storage.

Our findings suggest a significant disconnect between the intended and actual impacts of Privacy Indicators, with many users often needing to be more aware of these cues. However, our proposed design improvements show the potential to markedly increase user awareness. The insights gained from this study could significantly influence the future of privacy features on Android and other platforms, positioning our work as a crucial contribution to mobile user privacy and security.

## Background

Android, the world's most widely used operating system, powers over 2.3 billion devices globally. These devices access many functionalities through more than 2.6 million applications available on Google Play, Android's primary app store. While most apps are designed to help users achieve various tasks, the platform has risks. Malicious applications that steal user data or surreptitiously drain device resources are a significant concern.

To mitigate these risks, Google has implemented several safeguards, including the Google Play Protect system, which audits applications for safety before they are made available on the Google Play Store. Despite these measures, the open and flexible nature of Android sometimes allows harmful apps to slip through the cracks. This vulnerability led to the introduction of a permissions system with Android 3.0, which enabled applications to request access to primary internal storage, among other resources. However, research by Felt et al. in 2012 highlighted that only a tiny percentage of users pay attention to these permission warnings, suggesting a need for further improvements in Android's privacy and usability protocols.

The response to these challenges evolved. Android 4.4 started the Ask on Install (AOI) model, requiring apps to declare and request permissions upon installation. Although this model improved privacy and security, it limited users to either accepting all permissions to use the app or not installing it. This all-or-nothing approach was refined by introducing the Ask on First Use (AOFU) system in Android 6.0, which allowed users to grant or deny permissions the first time an app attempted to access specific resources.

While these systems improved control over app permissions, they needed to adequately inform users about which apps accessed sensitive resources like the camera or microphone. This gap was addressed in Android 12.0 with the introduction of Privacy Indicators (PIs), which are small icons or notifications that show users when and how their resources are being used. Enhancements continued with Android 13.0 and 14.0, which introduced more nuanced control over permissions and expanded the functionality of Privacy Indicators, giving users a clearer insight into and greater control over how their data is accessed.

> Be cautious of malicious applications that can bypass security measures and compromise your personal data. Always verify the legitimacy of the apps you download.
{: .prompt-warning }

Despite these advancements, the threat posed by Android malware continues to grow, evolving with new tactics that can bypass security measures. Enhancing user awareness through improved privacy indicators and educational resources remains crucial. These tools empower users to make more informed decisions, recognize potentially malicious apps, and better safeguard their privacy and security.

> Despite rigorous security measures like Google Play Protect, harmful apps occasionally slip through, posing a significant risk.
{: .prompt-danger }

## Related Work

The discourse around smartphone privacy is extensive, with numerous studies examining user interactions with privacy settings, permissions, and privacy indicators.

### User Awareness and Understanding of Permissions

A seminal study by Felt et al. revealed a significant discrepancy in user understanding of app permissions, highlighting the critical need for more explicit permission prompts and better educational efforts. This research demonstrated that users often grant permissions without fully grasping the potential repercussions, indicating that a shift toward ensuring informed comprehension is necessary.

> Studies like those by Felt et al. highlight the importance of understanding app permissions to prevent unintended data access.
{: .prompt-info }

Further exploring this area, Nourah et al. delved into the disparities between user awareness and actual behavior concerning smartphone permissions. They found that many users need help managing privacy settings effectively across different platforms, leading to oversights in privacy protections and misunderstandings about the implications of permissions. Their findings stress the importance of straightforward, practical communication tools to educate users about privacy.

From a different angle, Tahaie et al. investigated developers' perspectives on privacy concerns within smartphone apps. They noted that developers know the privacy implications of permissions, especially for sensitive data like calendar and location access when apps run in the background. Despite a consensus on the importance of robust security practices, developers believe users prioritize app functionality over stringent privacy considerations.

Bal et al. proposed the 'Styx' system, an innovative approach designed to enhance communication about privacy risks. This system monitors long-term data access behavior, helping users understand the cumulative impact of app behaviors on their privacy, thereby providing a broader perspective on resource access.

### Privacy Indicators and Notifications

Stover et al. explored the effectiveness of privacy indicators, experimenting with quantifying the monetary value of collected data as an indicator. This approach was based on the hypothesis that understanding the financial worth of their data might make users more cautious with their privacy choices. However, challenges in effectively conveying this value suggested that such indicators require further refinement.

Sven et al. examined how displaying app privacy levels in app stores affects user decision-making. Their study underscored the importance of these privacy indicators in helping users choose trustworthy apps and mitigating risks associated with data handling by apps.

Pejović and Musolesi proposed a machine-learning-based context-sensing solution to improve the timing and impact of privacy notifications on mobile devices. They argued that delivering notifications at contextually appropriate times could significantly enhance user engagement and understanding of privacy issues.

Hazim focused on privacy visualizations, particularly the use of 'anti-feature' labels in F-Droid. Their two-layer model, which combined simple icons with descriptive labels, aimed to make privacy practices more accessible to users and enhance their understanding of app behaviors.

A recent study by Guerra et al. 2023 examined the effectiveness of privacy indicators in informing users about resource access. They introduced an enhanced 'POP-UP' design that significantly increased visibility and user awareness by briefly displaying notifications about apps' active resource use. This study, while innovative, pointed out limitations such as the potential intrusiveness of notifications and the transient nature of the visibility of these alerts.

Collectively, these studies provide a rich tapestry of research into smartphone privacy, each contributing unique insights into how users understand and interact with privacy settings and permissions. They collectively emphasize the need for more intuitive and effective privacy mechanisms to safeguard user data.

## Study Design

As part of our research, we aimed to assess the effectiveness of PI on Android devices. Our objective was to determine whether these indicators can assist users in identifying when an application is utilizing system resources while preoccupied with other tasks. Furthermore, we sought insights into how users perceive different proposed solutions to enhance privacy indicators.

> Our study uses a two-phase approach, combining both qualitative and quantitative methods, to provide comprehensive insights into PI effectiveness.
{: .prompt-info }

### Research Questions

Our research was designed to answer the following four research questions:
- **RQ1**: How effective is the current implementation of PI on Android?
- **RQ2**: What are the shortcomings of the current implementation of PI on Android?
- **RQ3**: What changes can be made to PI on Android?
- **RQ4**: How influential are these proposed changes in improving the effectiveness of PI on Android?

To answer our questions, we conducted a user study and a survey. The user study consisted of tasks that helped us to understand how effective PI is and an interview with mock-up designs to understand the potential solutions and their viability. The survey collected quantitative data about user behavior and PI to understand how users perceive PI's effectiveness. It also included open-ended questions for feedback on the issues and potential solutions to improve PI. The following two sections provide a detailed description of both the user study and the survey.

### User Study

We conducted a formative study on the effectiveness of PI in Androids. Our study was split into two parts:

> While some applications may not visibly use resources like the microphone, they could still be accessing them in the background, posing a privacy risk.
{: .prompt-warning }

#### Tasks

The first part of our study comprised a set of simulated tasks. We tested four note-taking applications designed to function similarly with minor differences in their user interface. We used PI in varying degrees in each application as the variable study factor. Here is a brief explanation of the tasks and applications used in the study:
- **Astrovane**: This application used resources and displayed PI like a traditional one. The corresponding task required participants to open the application from the home screen, record a new note with the phrase 'This is the content for Task#,' save the note, and return to the home screen.
- **Quasaris**: This application used the microphone every time it was open in the foreground, displaying PI whenever the app was actively being used. The corresponding task required participants to open the application from the home screen, write a new note with the phrase 'This is the content for Task#,' save the note, and return to the home screen.
- **Nebulight**: This application used the microphone as soon as it was opened and continued using it even in the background, continuously displaying PI even if the participant returned to the home screen. The corresponding task required participants to open the application from the home screen, write a new note with the phrase 'This is the content for Task#,' save the note, and return to the home screen.
- **Stellarix**: This application was similar in functionality to Astrovane, and its corresponding task required participants to open the application from the home screen, write a new note with the phrase 'This is the content for Task#, save the note, and return to the home screen. This task did not display its PI and was solely intended to test if participants could identify PI use in the previous application.

The study was conducted within subjects, meaning each participant was asked to perform a task on each application in a randomized order to avoid bias, except Stellarix, which always succeeded Nebulight. Participants were not informed about the true nature of the study before completing their tasks. Before starting the tasks, the participants were introduced to Android devices and instructed to observe and remember any interactions between the applications, the device, and any notifications or indicators that might appear during their tasks. After completing their assignments, the participants were asked about their perceived differences in each application and whether they believed any of the applications used the device microphone. Additionally, they were asked to provide feedback on whether they felt PI effectively conveyed when an application uses device resources. After getting their responses, the true nature of the study was explained to the participants, and feedback was collected on how they felt about the effectiveness of PI.

#### Mockup Interview

To address some of the changes that can be made to PI on Android, we designed three concept mockups, each with a different rationale. These mockups were intended to address some of the significant issues in the current PI implementation.

Here is a breakdown of the mockups and their purposes:

- **Mockup 1 - Alternative PI**: This mockup suggests using different indicators, such as vibration or haptics, to improve the effectiveness and user-friendliness of privacy indicators.
- **Mockup 2 - Additional PI**: This mockup proposes adding new resources or tools to the existing privacy indicators framework, expanding its capabilities. For instance, PI can be used for location services and internal storage access.
- **Mockup 3 - Additional Vectors in PI**: This mockup suggests expanding the functionality of privacy indicators by including additional vectors. This change adds new dimensions to the current PI system on Android. For example, a risk/trust score in PI for apps or resources could be added.

The participants were shown each mockup design and were given a detailed explanation of how these proposed mockups would function. They were then asked to share their opinions on each of the designs. The purpose of this study was to gain a better understanding of how users interact with their devices and to identify shortcomings that a solution to PI would have to address. For each design, the participants had to rank them on the System Usability Scale (SUS) to evaluate how usable they speculate a solution might be.

### Survey

Besides the user study, we also developed a self-reported online survey to gather quantitative data about PI on Android. Our survey was about 14 questions long and collected information on the following metrics:

- **User Experience**: The average years the participants have used their smartphones and their familiarity with Android.
- **Privacy Concerns**: The average concern about privacy amongst users and the percentage of users in our study with a technological background (and how much this would influence privacy).
- **Awareness of PI**: The percentage of users aware of PI's existence and the frequency of noticing the PI on their smartphones.
- **Effectiveness of PI**: The percentage of users who feel that PI helps them understand resource usage and the percentage of users who changed their permission settings based on PI.
- **Desired Changes**: Lastly, we presented the users with an open-ended question asking if they had any ideas on improving PI on Android.

## Study Results

We had the following hypotheses going into our research:

- **H1**: The current implementation of PI is ineffective at informing users when an application is accessing their device resources.
- **H2**: The current implementation lacks the contextual information necessary to inform users which apps are accessing the resource. Many users are unaware of PIs on their devices, or the PI fails to grab their attention while preoccupied with other tasks.
- **H3**: Some changes that can be made to PI include changing the way PI is presented (alternate PI), expanding the resources within existing PI (additional PI), and expanding the functionality of PI (additional vectors in PI).
- **H4**: Implementing proposed changes to PI would improve the effectiveness of informing users about resource access by applications.

The following sections describe the findings of the user study and the survey.

### User Study Results

> Lack of awareness and incorrect settings can lead to significant privacy breaches. It's vital to regularly check and understand the permissions you grant.
{: .prompt-danger }

#### Demographics

Our user study was performed with 20 participants, of whom 15 were Android users and 5 were iOS users. Most Android users ensured that we received the most feedback from the perspective of Android users. However, considering that the PI should work for both accustomed and new users to be practical and usable, we also decided to include a few iOS users to obtain their insights.
Our study was conducted in our university graduate lab, so most participants were university students with technical backgrounds.

#### Effectiveness of the Current Implementation of PI

During the Tasks phase of the study, the users were randomly presented with the four applications to interact with and later questioned about resource usage.

| Observations               | Participants (n=20) |
|----------------------------|---------------------|
| Resource Usage             |                     |
| All resources identified   | 0                   |
| Some resources identified  | 15                  |
| No resources identified    | 5                   |
| Privacy Indicators (PI)    |                     |
| Observed PI during tasks   | 5                   |
| Believed PI were effective | 6                   |

The table above presents the observations from the tasks in our user study. None of the participants were able to identify all resource usage correctly. Additionally, only fifteen participants recognized resource usage with the application that actively required the users to access the resource(Astrovane). Lastly, five participants failed to recognize any resource usage at all. Five participants said that during the study, they observed the PI light at least once, and six participants believed that PI was practical before the proper functionality of the applications was revealed.

#### Mockup Solutions of PI

![SUS scores for Mockups](/assets/img/posts/android-1.jpg){: width="972" height="589" } *SUS scores for Mockups*

SUS scores were identified for each of the proposed mockups to perceive the usability of the different designs. The figure above shows all three mockups' SUS scores. The following observations were made:

- **Highest SUS Score**: Mockup 2 (85.25) involving additional PIs received the highest SUS score. This suggests that participants likely found the additional privacy indicators related to location and storage valuable and more effective in conveying information about resource usage.
- **Lower SUS Scores**: Both Mockup 1(Alternative Privacy Indicators, 74.875) and Mockup 3(Additional Vectors in Privacy Indicators, 73) received lower SUS scores compared to Mockup 2. This suggests that while these mockups have their merits, they must be implemented in ways that do not compromise usability or user satisfaction.

We also received qualitative feedback on the suggested mockups, and the following are some of the issues and concerns we identified:

- **Mockup 1 - Alternative PI**: Five participants found alternative indicators like vibrations/chimes annoying or distracting. Several users expressed the need for customization in identifying resource use. Three participants doubted the improvement in usability or noticeability with these additions. Some noted that keeping their phone on mute or low volume could diminish the effectiveness of these indicators. Lastly, they expressed the need for customization in identifying resource use.
- **Mockup 2 - Additional PI**: Four participants deemed incorporating more prominent location privacy indicators helpful. Internal storage use indicators were considered redundant, though helpful if they could highlight suspicious file access. Some participants were concerned about the possibility of overcrowding and overstimulation with additional indicators.
- **Mockup 3—Additional Vectors in PI**: Five participants felt that adding more vectors could confuse users. Several noted the complexity and potential technicality of these indicators.

The SUS scores align with the feedback received, suggesting that additional privacy indicators (Mockup 2) related to location and storage were more positively received and deemed more beneficial than the potential annoyance and complexity of alternative indicators (Mockup 1) and the added vectors (Mockup 3).

The participants were also asked for other solutions and suggestions to improve the effectiveness and usability of privacy indicators. Most participants suggested enhancing the noticeability by using pop-ups, highlighting the notification bar, or changing the LED colors. They also suggested associating PI LED colors with resources or applications.

### Survey Results

> The survey results indicate a strong desire for more detailed and customizable privacy indicators, reflecting a significant concern among users about their digital privacy.
{: .prompt-info }

#### Demographics

| Demographic           | Distribution |
|-----------------------|--------------|
| Age                   |              |
| 18-24                 | 39.6%        |
| 25-34                 | 20.7%        |
| 35-44                 | 19.8%        |
| 45 or older           | 19.8%        |
| Educational Level     |              |
| High School           | 9.0%         |
| Bachelor's Degree     | 35.1%        |
| Master's Degree       | 38.7%        |
| Doctoral Degree       | 17.1%        |
| Technical Background  |              |
| Yes                   | 46.8%        |
| No                    | 53.2%        |
| Smartphone Experience |              |
| More than 6 years     | 83.8%        |
| 5-6 years             | 9.9%         |
| 3-4 years             | 4.5%         |
| 1-2 years             | 0.9%         |
| Less than 1 year      | 0.9%         |

The table above shows the demographic distribution of our survey. One hundred eleven participants took our survey. Most participants were 18-24 (39.6%), followed by equal distribution in 25-34, 35-44, and 45 or older categories (19%-20%). Most participants held a Master's Degree (38.7%), followed by those with a Bachelor's Degree (35.1%), Doctoral Degree (17.1%), and High School education (9%). Most participants did not have a technical background (53.2%) but a considerable amount of smartphone experience (83.8%).

![User Familiarity with Android](/assets/img/posts/android-2.jpg){: width="972" height="589" } *User Familiarity with Android*

The figure above shows the distribution of participants' familiarity with Android smartphones. Participants were familiar with Android smartphones, with an average rating of 4.14 out of 5.

![Android Usage](/assets/img/posts/android-3.png){: width="972" height="589" } *Android Usage*

The figure above shows the distribution of participants who used Android. Most participants had an Android (61.3%), and very few had never used an Android (4.5%). Lastly, most of the population participating in our survey had used an Android smartphone after privacy indicators were publicly released in October 2021 (80.2%).

#### Privacy Concern and Awareness of PI

![Smartphone Privacy Concerns](/assets/img/posts/android-4.jpg){: width="972" height="589" } *Smartphone Privacy Concerns*

The figure above shows the participants' smartphone privacy concerns. On average, participants rated their concern about privacy at 4.08 out of 5, indicating a high level of concern. PI's average rating of noticeability was 3.26, suggesting that while some users notice these indicators, there is room for improvement. Additionally, most participants were previously aware of PI (68.5%).

#### Perceived Effectiveness of PI

![PI Analysis](/assets/img/posts/android-5.jpg){: width="972" height="589" } *PI Analysis*

The figure above shows the participants' perceived awareness, effectiveness, and desire for PI changes. Participants rated their effectiveness in understanding when sensitive resources are accessed through PI at 3.80 out of 5. Additionally, participants rated the impact of PI on permission settings at 3.31, suggesting that PI has influenced users to change app permissions. However, participants rated the information adequacy of current privacy indicators at 2.96 out of 5, suggesting that current indicators do not provide sufficient information about data usage. A high average of 4.15 indicated a strong desire for more detailed or customizable privacy indicators.

#### Proposed Solutions of PI

Through the open-ended response question asking for any improvements for PI, the participants suggested the following modifications to PI:
- **Warning for every Privacy Compromise**: Participants desired timely warnings whenever an application potentially compromised privacy.
- **Duration of Notification**: The duration for which the indicator was displayed was a concern; suggestions include extending the duration for better noticeability.
- **App-Specific Permission Requests**: Several participants wanted apps to request permission for data tracking each time it was needed.
- **User-Friendly Language**: Simplifying technical language used in privacy settings was requested for better understanding.
- **Clear Pre-Use Messages**: Users prefer clear messages displayed before using the app, particularly regarding privacy.

## Discussion

> Enhancing user awareness through better-designed privacy indicators could significantly improve digital security on mobile platforms.
{: .prompt-info }

### Findings

#### Literature Review

Previous research has identified several areas that require further investigation and has suggested ways to enhance their effectiveness. The proposed improvements are four-fold. Firstly, there is a need to educate users about permissions and privacy risks so they can better understand the consequences of their choices and the risks associated with data sharing. Secondly, creating a more user-friendly and transparent privacy interface is vital. This would make privacy settings more accessible and understandable to all users, leading to informed decision-making. Thirdly, the timing and context of privacy notifications should be carefully considered to ensure they are as effective as possible. Proper timing and relevant context can significantly influence how users perceive and respond to these notifications. Lastly, it is essential to consider both user and developer perspectives when developing privacy communication tools. This approach ensures that the tools created are technically sound and meet user expectations and needs, leading to a more secure and trustworthy digital environment.

#### User Study
Based on the findings from the user study, several important aspects regarding privacy indicators on Android were as follows:

- **Low Awareness and Identification**: None of the participants could correctly identify all resource usage, and some did not notice any, suggesting a general low awareness or visibility of PI. This implies that PI's current implementation may not effectively capture user attention or be too subtle to be noticed during regular app usage.
- **Need for Customization and User Control**: Several participants desired customization in PI and a more user-centric design. This suggests that users want to control how they are alerted about resource usage, preferring methods aligned with their usage patterns and preferences.
- **Effectiveness vs. Intrusiveness**: The feedback that alternative indicators could be annoying or overstimulating points to a delicate balance between effectiveness and intrusiveness. Users seek PIs that are noticeable without being disruptive to the Android usage experience.
- **Complexity vs. Simplicity**: Concerns about the complexity of additional vectors in PI(Mockup 3) indicate a preference for simplicity. Users may find overly technical or detailed indicators confusing, preferring straightforward and easy-to-understand alerts.
- **Overreliance on Permission Models**: The heavy reliance on permission models for privacy indicates a potential lack of understanding or trust in other privacy measures. Users may not fully grasp the role of PI or see them as secondary to permissions.
- **Improvements**: Suggestions for enhanced noticeability (e.g., pop-ups, color changes) reveal opportunities for design improvements. There is an apparent demand for more intuitive, noticeable, and informative PI.

#### Survey

Based on the findings from the self-reported survey, users claim to have a significant awareness and concern about privacy, especially among younger and highly educated demographics. While PI on Android has been noticed and has had some impact, there is a clear need for detail, customization, and usability enhancements. Participants were seeking more proactive and transparent measures from apps regarding privacy, indicating a gap in the current implementation.

#### Comprehensive Analysis

> Adopt privacy practices that ensure you are fully informed about how and when your data is being accessed.
{: .prompt-tip }

Based on both the user study, surveys, and our literature review, we establish the following key findings:

- **User Awareness and Preferences**: The survey and user study reveal that users are conscious of PI but have diverse preferences and awareness levels. There is a clear interest in more detailed and customizable PI, as indicated by higher SUS scores for mockups with additional PI.
- **Usability vs Overload**: While users seek more detailed PI, there is also a concern about overstimulation and complexity. It is essential to balance the amount and type of information provided without overwhelming or confusing the user.
  Potential for Improvement: The survey, user study, and literature review collectively suggest that the current PI needs to be improved. Users are looking for more proactive, informative, and customizable features.

### Prior Works

While not many studies have been done to evaluate the effectiveness of PI in Androids, our study aims to evaluate the effectiveness of PI in unfamiliar applications, which sets it apart from previous research that focused on popular applications. This approach presents a more realistic scenario for attackers who might create applications to exploit user device resources while appearing benign. Our findings will provide insights on how PI can be improved to prevent such instances.

In contrast to prior research, our study did not require participants to use their own devices. We evaluated the effectiveness of PI when observed through unfamiliar devices. We reasoned that unfamiliar devices could help users assess the effectiveness without any prior assumptions, thereby providing a broader range of results.

## Limitations and Future Work

### Limitations

> The findings from our controlled lab settings might not fully extend to real-world scenarios, which can involve a broader and more diverse range of interactions and privacy challenges.
{: .prompt-warning }

Through our research, we worked under certain assumptions and limitations. These are outlined in this section.

- **Technical Limitations**: We faced certain technical limitations during our study as we were restricted from using the technology available. We had to rely on a single Android device to conduct the user study tasks, and we also had to simulate the study in the Graduate Study lab at our university. Though we obtained results, these may not completely capture the nuances of how users interact with PI in their everyday device usage, which could lead to different results.
- **iOS vs Android**: We decided to research the Android platform due to its popularity, ease of developing applications, and accessibility. It is worth noting that each platform has a unique mental model that drives user expectations. For instance, IOS consumers expect a higher level of privacy than Android users, even though both populations are concerned about privacy risks. Therefore, conducting the study on iOS devices could lead to different results.
- **User Study Recruitment**: The majority of our participants in the user study were university students with technical backgrounds. Although we did have some variations, we designed our study to avoid leading users or giving them assumptions to work under and using deception to avoid biasing them towards privacy indicators. However, the results could represent a bias towards the technically inclined. Therefore, the general population might perform worse than our user study results.
- **Self-Reported Survey**: We conducted our survey using Google Forms, which did not require users to provide personal information. Although we used participant emails to ensure there were no duplicate responses, the survey was done online in a self-reported way. Therefore, the reactions stated by users might not reflect what happens and could be influenced by various factors.

### Future Work

Our research has identified several areas where further investigation could provide valuable insights. These areas include:

- **iOS PI Effectiveness**: We recommend additional research to compare the effectiveness of privacy indicators on iOS and Android devices. Specifically, we suggest exploring differences in their workings and whether one is more or less effective than the other.
- **Changes to Study Design**: Future research should evaluate the effectiveness of privacy indicators in more realistic scenarios to better understand their effectiveness. Conducting long-term studies rather than deception studies could also yield valuable insights.
- **Evaluating Proposed Solutions**: While we received feedback on proposed solutions to privacy indicators on Android devices through mock-ups, additional research could focus on implementing these solutions and directly comparing their effectiveness to that of Android.

## Acknowledgement

This project was a joint effort with my skilled colleague, Bhavana Avirneni. Together, we worked on the design and implementations of this project as part of our assignment for the CSEC-729 Human Factors in Security and Privacy course at RIT.

You can access the project by clicking [here](/assets/docs/Improving%20the%20Usability%20and%20Effectiveness%20of%20Privacy%20Indicators.pdf).

# References

- [Alshomrani et al. - Assessing User Understanding, Perception and Behaviour with Privacy and Permission Settings](https://dl.acm.org/doi/abs/10.1007/978-3-031-35822-7_36)
- [Android statistics and facts - Statista](https://www.statista.com/topics/876/android/#topicOverview)
- [Android version history - Wikipedia](https://en.wikipedia.org/wiki/Android_version_history)
- [Bal et al. - Styx: Privacy risk communication for the Android smartphone platform based on apps’ data-access behavior patterns](https://www.sciencedirect.com/science/article/abs/pii/S0167404815000541)
- [Sven Bock and Nurul Momen - Nudging the User with Privacy Indicator: A Study on the App Selection Behavior of the User](https://dl.acm.org/doi/abs/10.1145/3419249.3420111)
- [Felt et al. - Android permissions: User attention, comprehension, and behavior](https://dl.acm.org/doi/10.1145/2335356.2335360)
- [Guerra et al. - An Empirical Study on the Effectiveness of Privacy Indicators](https://ieeexplore.ieee.org/abstract/document/10232926)
- [Antonios Hazim - Privacy Visualizations: Introducing an interactive visualization of privacy indicators based on Exodus Privacy to F-Droid](https://www.mi.fu-berlin.de/en/inf/groups/hcc/theses/finished/2023-Theses/privacy_visualizations/index.html)
- [IT threat evolution in Q2 2023. Mobile statistics - Securelist](https://securelist.com/it-threat-evolution-q2-2023-mobile-statistics/110427/)
- [Lin et al. - Expectation and purpose: understanding users’ mental models of mobile app privacy through crowdsourcing](https://dl.acm.org/doi/10.1145/2370216.2370290)
- [Veljko Pejovi´c and Mirco Musolesi - InterruptMe: designing intelligent prompting mechanisms for pervasive applications](https://dl.acm.org/doi/10.1145/2632048.2632062)
- [St¨over et al. - Investigating simple privacy indicators for supporting users when installing new mobile apps](https://dl.acm.org/doi/10.1145/3411763.3451791)
- [Tahaei et al. - Stuck in the Permissions With You: Developer & End-User Perspectives on App Permissions & Their Privacy Ramification](https://dl.acm.org/doi/abs/10.1145/3544548.3581060)
