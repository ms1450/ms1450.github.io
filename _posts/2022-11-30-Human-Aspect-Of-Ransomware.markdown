---
title: The Human Aspect of Ransomware
author: mehul
date: 2022-11-30 21:28:00
categories: [Blogging, Research]
tags: [Ransomware, Extortion, Cryptocurrencies, Societal Responsibility]
image:
  path: '/assets/img/headers/ransomware.webp'
  alt: DALL-E Image of Ransomware created using small geometric shapes in a monochrome design on a black background.
---

## Introduction

In its very fundamental form, ransomware is malicious software that obstructs the workings of a machine or a user’s access to data and its programs until a demand is fulfilled. This demand is usually the victim’s money as a ransom, and their devices are held as hostages by the attackers.

> Always keep your antivirus software and operating system up to date to reduce the risk of ransomware infection.
{: .prompt-tip }

However, the attackers can ask their victims for anything besides money, such as spreading the malware to other machines, revealing sensitive information they might be privy to, or even disclosing their attack publicly to humiliate the victims. Other malware, like viruses or remote access tools, might try to hide its tracks and stay within the network for as long as possible, collecting information and causing indirect disruptions.

Ransomware’s main objective is to hold the victim’s machine hostage and demand a ransom to get the victim’s attention; the ransomware is as loud and apparent as possible.

While the goal of ransomware is to extort a victim, there are four types of ransomware malware: scare, lock, crypto, and wipe. Scare ransomware is malicious software that claims to detect a virus or an issue on your computer; it then asks you to pay the attackers to resolve the problem. While some Scare ransomware flood the computer screen with pop-up alerts without modifying or deleting files, others might lock the victim’s device. The Lock ransomware locks the user out of their device, making it inaccessible. The lock screen displays information like the attacker’s payment address, their ransom demand, and sometimes a clock that is counting down to instill a sense of urgency for the victims to act. Besides making the device inaccessible, the Wipe ransomware starts erasing random software and files from the machine. This forces their victims to act fast to get as much of their data back as possible. Lastly, the Crypto ransomware encrypts the data on a machine. This way, even though the victim can access their computer, they cannot work or open any of their files without a decryption key, which the attackers provide if they are paid their ransom.

> Scareware often uses intimidation tactics but does not typically damage files, while Crypto ransomware encrypts your data, making it inaccessible without a decryption key.
{: .prompt-info }

Crypto ransomware is one of the most well-known, familiar, and dangerous types of ransomware and is primarily what we think of when we talk about ransomware today.

The first instance of ransomware dates to 1989 when Harvard biologist Joseph L. Popp created “AIDS Trojan.” This was distributed on a floppy disk at the World Health Organization’s International AIDS conference, and it would encrypt the files and demand a $189 ransom from its victims. The very first modern ransomware is “Trojan.Gpcoder,” released in May 2005 and created by Russian criminals to target victims in Russia, Belarus, Ukraine, and Kazakhstan. The most notorious ransomware to date is the family of “CryptoLocker,” which rose to infamy around late 2013. They targeted Microsoft Windows machines and spread via malicious email attachments; once infected, the machines would then encrypt their local and network files and ask for a ransom to be paid through Bitcoin or a prepaid cash voucher before a set deadline. If the deadline were not met, the malware would provide an online service to decrypt data for a significantly higher price without guaranteeing the data would be released. It took a joint operation conducted by various law enforcement agencies, including the FBI and Interpol, in “Operation Tovar” in June 2014 to take down the botnet used to distribute and maintain this malware.

> Operation Tovar was a multinational law enforcement operation that successfully dismantled the Gameover ZeuS botnet, used to spread the CryptoLocker ransomware.
{: .prompt-info }

More recently, ransomware has taken a newer approach instead of being created, distributed, and maintained by one organization. Ransomware is now being sold as a product to other less technologically inclined criminals. These criminals can then use this malicious service to easily target victims and give a share of their earnings to the criminals maintaining the ransomware. Ransomware as a Service (RaaS) has made it extremely difficult for authorities to detect and prevent the spread of ransomware.

## Analysis of Ransomware

The first Ransomware, “AIDS Trojan,” had a timer that would wait until the infected devices boot cycled 90 times before the ransom demand popped up. This was done to hide the source of the Ransomware and prevent anyone from tracking down the attacker. However, since the ransom money was to be sent to a post office, law enforcement was able to track down the attacker and put an end to the “AIDS Trojan.” In the early 2000s, since electronic payment was not yet introduced, the victims had to send money through mail, making it very easy to track down and stop. This made it difficult, if not impossible, for hackers to hide the footprint that the paid ransom left behind.
In 2005, E-gold and Liberty Reserve services were launched, offering digital currencies that allowed users to register and transfer money to other users using only a name, email address, and date of birth. The lack of identity verification made it an attractive option for attackers to demand ransom through. However, as the cybersecurity landscape improved, email tracking allowed the government to trace any purchases made on these platforms.

It wasn’t until 2013 with the rise of cryptocurrencies such as Ethereum and Bitcoin, that Ransomware became a pervasive threat. Unlike regular payment services, cryptocurrencies allowed for anonymous transfer of funds across borders without any monitoring and it was very cheap to set up.

> Cryptocurrency transactions are difficult to trace, increasing the risk of unrecoverable losses if you pay a ransom. Always consult with cybersecurity professionals before responding to ransom demands.
{: .prompt-warning }

This made it extremely difficult for governments to regulate and track cryptocurrency payments, leading to a surge in Ransomware.
Threat intelligence predicts a continued rise in ransomware attacks in the coming years. This is driven by several factors, including the hybrid business model for monetization through Ransomware as a Service (RaaS), which has professionalized and established the ransomware business. Hackers now offer their victims 24/7 help to expedite the ransom payment. The increase in the sophistication of deployment methods that attackers use to gain access to networks is another contributing factor. Attackers are learning from past ransomware attacks and improving their tactics to make this attack process as streamlined and efficient as possible. The ease with which attackers can conduct ransomware attacks and the potential for large profits further fuel this trend. The high return on investment from such attacks makes them an attractive option for cybercriminals to pursue.

## Science of Ransomware

Ransomware stands out from other conventional malware not only by its methodology but also its approach. It does not explicitly target a vulnerability or a flaw in the infected computer. Instead, it plays with its victim’s emotions and human nature.

It convinces the victim that paying the ransom for their data is much more viable than starting over from scratch. Like any hostage situation, it convinces the victim that what is being taken from them is worth spending their money on.

> Paying the ransom does not guarantee the recovery of your data and may encourage attackers to target you again. Assess all options carefully.
{: .prompt-warning }

Ransomware attacks conventionally involve three conflicting parties: the victim, the attacker, and the law enforcement agencies. While they all have varying motivations and ideologies, they are all linked to the central theme of ransomware. We can get a clear understanding of how ransomware attacks work if we break down the attack and understand the situation from the perspectives of these three parties.
The victim is the owner of the infected machine; they are the metaphorical flies trapped in the attacker’s cobweb. Their primary motivation throughout the attack is to go back to a state of normalcy. This could be done by paying the attackers the requested ransom or starting over from scratch. A ransomware attack heavily disrupts work, and the affected organizations significantly impact their sales and workflow. This occurs not only through the ransomware but also through any public disclosures that might take place if they decide to inform the authorities or the media about the attack. To minimize the damage caused by the attack, organizations often find it better to pay off the ransom than deal with the fallout not paying the ransom would cause. However, another issue that looms over the victim is the uncertainty that the attackers would follow through with the agreed-upon transaction. There is no guarantee that an attacker would follow through and provide the decryption key or stolen data once the ransom is paid. Their only way of assessing the reliability of an attacker is to interact directly with them or review other companies’ interactions with ransomware and how the attackers had responded, which might not be disclosed in many instances.
The attacker is often the creator and the handler of ransomware; they must maintain control over their interaction with the victim to get them to pay the ransom. They must portray a sense of authority and seriousness so the victim pays the ransom. However, they must appear trustworthy and reliable so the victim believes they can get their data back. The attacker’s primary motivation is to create the perfect cobweb so the victim gets trapped. Their interaction with the victims is exploitative in a way where, after the initial attack, the victim becomes their customer, and the product becomes the decryption key or the victim’s data being held ransom.
Law enforcement agencies also play a vital role in ransomware attacks. At the same time, they are not impacted directly if one or two small to medium-sized organizations get hit with a ransomware attack. Much like how many cobwebs can accumulate to cause trouble, multiple ransomware attacks can cause significant destabilization in a government’s economy. The primary motivation for law enforcement agencies is not to recover the victim’s data but to reduce the impact caused by ransomware. While they help victims by providing their services and attempting to track down attackers, following the ransom money, and spreading awareness about such attacks and how to defend against them, they also must demotivate victims from paying the ransom to the attackers. This is because this ransom money directly goes to the attackers, providing them with the motivation and the funds to attack more organizations. Besides tracking down the attackers, they also blacklist the organization that pays the ransom to the extortionists and imposes heavy fines on them.
The complicated interactions between these parties are what make ransomware a challenging malware to stop. While there are ways to improve cybersecurity and lower the chances of an attack occurring, the human factor behind ransomware and these motivations are why it is such a difficult issue to resolve.

## Social Consequences of Ransomware

The human factor plays a pivotal role in ransomware. Even with the use of evolving cybersecurity measures, automated systems, and complex intrusion detection systems, attackers are still able to gain access to targeted systems by exploiting human error. This proves that technology alone cannot eradicate human-induced mistakes. Society also impacts and is impacted by ransomware attacks.
Over time, almost every organization that intends to keep up with the technologies has established a digital presence. This has enabled organizations to not only cater to a large number of customers but also provide fast and efficient services. However, with an increased reach, organizations also reveal themselves to more malicious actors seeking to exploit their infrastructure. Computers, tablets, and smartphones have become significant in our daily lives. Besides work, these devices now act as our only means of communication with the digital society we have created for ourselves. Our digital presence holds more significance to us than it has ever held before. Businesses rely heavily on their digital footprint; in many cases, these devices are their only source of income.
Ransomware attacks use this greater reliance on technology to extort considerable funds from their victims. Every victim has a set willingness to pay (WTP), this is the amount of ransom an attacker can extort from their victims. At the same time, this depends on various factors, such as whether the victim has backups of their data, their budget, and the contents of their data.

> Regularly back up your data and store backups in a secure, offline location. This practice can minimize the damage from ransomware attacks and other data loss scenarios.
{: .prompt-tip }

The attackers can get a good idea about their victim’s WTP based on their operational information. They can do this by researching the victim’s business online and studying their infrastructure.
Given that data accumulates over time, and organizations value their data more, the more extensive and comprehensive it is, the more their WTP also increases. A larger WTP directly impacts an attacker’s asked ransom, affecting the victim’s valuation of their data.

Therefore, the more an organization interacts with and impacts society, the greater the potential ransom an attacker might ask.

Besides the victims, there are also social implications for the attackers, whilst they can, and there have been cases where attackers have failed to hold their end of the transaction. This attack relies on the victim’s belief that they will regain their data. The attackers are responsible for following through with their end of the deal and helping the victim recover their data. If they don’t, this model can no longer sustain itself and collapses, collectively impacting all the ransomware attackers.
This way, society plays an active role in shaping ransomware attacks into what they are today and how they change going forward. Ransomware itself shapes our opinions of the valuations we place on our data. Ransomware attacks greatly impact society’s views of an organization, impacting the organization itself.
Attackers use this to increase their profits and raise the demanded ransom. The social impact and consequences can also be used for defensive measures.

Technological cybersecurity measures can protect against some of an organization’s threats, but understanding why ransomware works can also help us develop non-technological defenses that could protect against exploiting the human aspect of technology.

This could be done by spreading awareness about the techniques used by the attackers, removing the victim’s ability to trust their attackers, or making it difficult for attackers to get an idea of a victim’s WTP.

## Conclusion

Ransomware is unique malware that stands out from its counterparts because of both its operations and its approach. While other malware might hide within a device and exploit vulnerabilities within a system, ransomware seeks to grab its victims' attention and extort money from them. Where different types of malware might become less practical and threatening, ransomware remains a significant threat to small and medium-sized organizations and individuals due to its nature of exploiting the human factor in technology.
With more of our lives moving to the digital domain in these last few years, along with the progress we have made in encryption and cryptographic algorithms, malware has evolved into ransomware to take advantage of these changes in our society. The motivations and ideologies of the three parties involved—the victim, the attacker, and law enforcement agencies—shape modern ransomware into what it is.
I believe that besides using technological advancements, understanding the social impact and consequences of ransomware better prepares us to defend against it.

> Stay informed about the latest ransomware threats and protective measures by subscribing to cybersecurity news feeds and attending relevant training sessions.
{: .prompt-info }

# References

- [Kurt Baker - Crowdstrike, 5 Types of Ransomware](https://www.crowdstrike.com/cybersecurity-101/ransomware/types-of-ransomware/)
- [CISA - 2021 Trends Show Increased Globalized Threat of Ransomware](https://www.cisa.gov/news-events/cybersecurity-advisories/aa22-040a)
- [Berlin J. The Rise of Ransomware](https://pubmed.ncbi.nlm.nih.gov/27532812/)
- [Cartwright et al. - To pay or not: game theoretic models of ransomware](https://academic.oup.com/cybersecurity/article/5/1/tyz009/5554879)
- [Kurt Fanning - Minimizing the Cost of Malware](https://onlinelibrary.wiley.com/doi/abs/10.1002/jcaf.22029#:~:text=The%20article%20discusses%20how%20malware%20gets%20into%20the,to%20find%20and%20eliminate%20holes%20in%20the%20firewall)
- [Marcio Ricardo Ferreira - Ransomware - Kidnapping personal data for ransom and the information as hostage](https://revistas.usal.es/cinco/index.php/2255-2863/article/view/ADCAIJ201873514/19661)
- [Ransomware victims who pay up could face fines of up to $20m](https://www.finextra.com/newsarticle/36673/ransomware-victims-who-pay-up-could-face-fines-of-up-to-20m)
- [Are ransomware and cryptocurrencies intrinsically linked?](https://techmonitor.ai/technology/cybersecurity/ransomware-and-cryptocurrencies)
- [Hernandez-Castro et al. - An Economic Analysis of Ransomware and Its Welfare Consequences](https://royalsocietypublishing.org/doi/10.1098/rsos.190023)
- [Sultan et al. - A SURVEY ON RANSOMEWARE: EVOLUTION, GROWTH, AND IMPACT](https://www.researchgate.net/publication/328530628_A_SURVEY_ON_RANSOMEWARE_EVOLUTION_GROWTH_AND_IMPACT)
- [Hull et al. - Ransomware deployment methods and analysis: views from a predictive model and human responses](https://doaj.org/article/8566f618d7274ebaa8aefb647fce2f36)
- [Nir Kshetri, Jeffrey Voas - Ransomware as a Business (RaaB)](https://ieeexplore.ieee.org/document/9770445)
- [Leo et al. - The Ransomware Dilemma](https://sloanreview.mit.edu/article/the-ransomware-dilemma/)
- [Nobles Calvin - Botching Human Factors in Cybersecurity in Business Organizations](https://ideas.repec.org/a/vrs/hjobpa/v9y2018i3p71-88n6.html#:~:text=Botching%20Human%20Factors%20in%20Cybersecurity%20in%20Business%20Organizations,...%203%20Suggested%20Citation%20Nobles%20Calvin%2C%202018.%20)
- [Ronny Richardson, Max M. North - Ransomware: Evolution, Mitigation and Prevention](https://digitalcommons.kennesaw.edu/cgi/viewcontent.cgi?article=5312&context=facpubs)
