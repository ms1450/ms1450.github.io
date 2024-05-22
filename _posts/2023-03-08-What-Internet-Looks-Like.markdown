---
title: What the Internet REALLY looks like?
author: mehul
date: 2023-03-08 09:03:00
categories: [Blogging, Opinion]
tags: [BGP, BGP Poisoning, Autonomous Systems, Internet Simulation, Network Topology, AS Level Connections, Internet Hierarchy, P2C Connections, P2P Connections, Internet Exchange Points (IXPs), Network Protocols, Internet Mapping, Tier-1 ASes, Transit ASes, Stub ASes, Internet Dynamics, Network Evolution, Internet Measurements, Internet Datasets, Cybersecurity, Network Security]
image:
  path: '/assets/img/headers/internet.png'
  alt: Image of Internet created using small geometric shapes in a monochrome design on a black background.
---
Recently, I worked on a project to simulate the Internet, observe the effects of BGP (Border Gateway Protocol) poisoning on ASes (Autonomous Systems), and understand how effective it is for topology discovery. However, one of my biggest challenges is simulating the Internet.

The Internet is made up of connections between networks on a global scale; it is tough to understand how these connections are formed and shaped.

> Understanding Internet connections requires knowledge of various network protocols, the hierarchical structure of networks, and the dynamic interactions between different types of networks.
{: .prompt-info }

## Background
BGP (Border Gateway Protocol) is the routing protocol for the Internet. It connects independently operated systems with their unique policies called ASes (Autonomous Systems). These ASes interact through BGP on IXPs (Internet Exchange Points).

### Mapping the Internet's Topology
When defining the Internet's topology or trying to understand what the Internet looks like, you need to understand some crucial factors:
- **Internet is Constantly Changing**: New networks always appear, and old ones constantly decrease. Even if you have a detailed map listing every possible connection imaginable, it would be useless in mere seconds after creation due to the constant worldwide changes.
- **The Internet has various levels of visibility**: The Internet topology can be defined over several levels. There is Layer 2 mapping, which maps physical connections and wiring across the Internet. There is Layer 3 mapping, which maps logical connections across the world. Lastly, there is the AS-level mapping, which maps the different independent ASes and how they interact.

### AS Level Connections
While there exist many types of AS-level connections, the standard model of routing policies contains two kinds of relationships:
- **P2C (Provider-Customer Relationship)**: The customer AS pays the provider AS to carry their traffic.
- **P2P (Peer-Peer Relationship)**: ASes decide to connect and exchange their traffic without any cost directly.

> Understanding the differences between P2C and P2P relationships is essential for grasping the economic and policy dynamics of Internet routing.
{: .prompt-info }

### AS Categories
The Internet is hierarchical in nature. We can consider three categories of ASes that exist throughout the Internet:
- **Tier-1 ASes**: These are the ASes at the top of the hierarchy. They provide connections to everyone and tend to peer only amongst themselves.
- **Transit ASes**: These lie in the middle of the hierarchy. They act as providers to Stub ASes while customers to Tier-1 ASes. They tend to peer amongst themselves or, in rare cases, with some Stub ASes.
- **Stub ASes**: These are at the bottom of the hierarchy. They do not provide connections to other ASes and are commonly the customers of Transit ASes. They tend to peer amongst themselves.

> Tier-1 ASes form the backbone of the Internet, providing global connectivity. Transit ASes facilitate regional and local traffic, while Stub ASes typically represent end-user networks.
{: .prompt-info }

> This is a simplified understanding of the Internet and the AS-level topology. The true Internet comprises many more complexities, including different AS categories and many types of inter-AS connections.
{: .prompt-warning }

## The Constraints
To understand the shape and size of the Internet, we can create Constraints and values that define it! I considered the following four questions that we could answer to get an idea of the Internet:
- How many ASes exist worldwide, and what type of connections exist?
- How many connections does each type of AS make with an IXP?
- How many P2C connections exist for each type of AS?
- How many P2P connections exist for each type of AS?

Since the Internet is constantly evolving and has varying levels of visibility, finding out what the Internet looks like is nearly impossible. We can try to understand a small part of the Internet clearly, but each part has the property to vary from other parts broadly. So, with these four constraints, my goal is to develop a collective "average" of a small part of the Internet. At the same time, this won't represent the Internet accurately, but it might be as accurate as it gets, considering the vastness of the Internet.

## Finding the Answers

> To obtain current data on ASes and their connections, consider consulting sources like CAIDA, RIPE NCC, and other Internet measurement projects that provide up-to-date and comprehensive datasets.
{: .prompt-tip }

The answer to [1] lay in a paper by Oliveira et al. The data they collected (Table IV) shows that Stub ASes make up 92% of all the ASes, Transit (both large and small) ASes make up 7.95%, and Tier-1 ASes account for only 0.05% of all the ASes they discovered. Dimitropoulos et al. (Table III) found that P2C connections accounted for 90.26% of all their observed links, while P2P connections accounted for 9.28%.

Answering [2] was a bit more tricky, as I could not find any specific metrics. Böttger et al. found several trends for each type of AS and their relationship with IXPs. They had made the following discoveries:
- The number of IXPs has grown over the last few years, along with the number of members within each IXP.
- Tier-1 ASes play a crucial role within IXPs.
- Transit and Stub ASes are increasingly getting connected to more IXPs.
- Larger ASes and content providers prefer having more IXP connections to reach more ASes directly.

Answers to [3] and [4] involve using mathematics to find the information we seek. Subramanian et al. (Table 6) presented statistics about P2C connections between several types of ASes. Assuming that the connections between the same kinds of ASes are peering (P2P), and those between different types are P2C (this is usually the standard since you would rather make someone your customer and have them pay you for carrying their traffic than a peer with them). We can make the following observations:

For Tier-1 ASes (Dense Core):
- P2P Connections: ``329``
- P2C Connections: ``9523 (776 Transit Core + 931 Outer Core + 964 Small region ISPs + 6852 Customers)``

For Transit ASes (Transit Core + Outer Core + Small region ISPs):
- P2P Connections: ``2324 (1052 Transit Core + 1070 Outer Core + 202 Small region ISPs)``
- P2C Connections: ``11989 (5945 Transit Core + 3668 Outer Core + 2376 Small region ISPs)``

For Stub ASes (Customers):
- P2P Connections: ``N/A``
- P2C Connections: ``16084 (6852 Dense Core + 3660 Transit Core + 3196 Outer Core + 2376 Small region ISPs)``

Using these, we can draw several insights:
- Out of all the types of ASes (Tier 1, Transit, and Stub), there are 40,249 connections, excluding P2P connections for Stubs. P2P connections make up 6.59% of the total, while P2C connections make up 93.41%. These findings align with the results from [1].
- Regarding the distribution of connections, Tier 1 ASes have 24.48% of the total connections, while Transit and Stub ASes have 35.56% and 39.96%, respectively.
- For Tier 1 ASes, P2P connections account for 3.34% of the total Tier 1 connections, while P2C connections make up 96.66%.
- For Transit ASes, P2P connections constitute 16.24% of the total, while P2C connections constitute 83.76%.

Peer-to-peer links through route collectors and vantage points are challenging to find, which may explain why stub P2P connections are not mentioned. Nonetheless, this provides a general idea of what an average connection might resemble.

## What does the Internet look like?

While a definable, clear-cut answer would be nearly impossible, we can find out the average shape of each type of AS to get an idea of what the Internet looks like. The following is what the Internet is likely shaped as:
- The Internet consists of about 92% Stub ASes, 7.95% Transit ASes, and 0.05% Tier 1 ASes.
- Out of all the connections, P2P makes up about 6-10%, while P2C makes up about 90-94%.
- Tier 1 ASes comprise approximately 24.5% of all connections, out of which 96.66% are P2C and 3.34% are P2P
- Transit ASes include about 35.6% of all connections, out of which 83.8% are P2C and 16.2% are P2P
- Stub ASes comprise about 40% of all connections. However, we do not know how many of these are P2P.

> The studies I referred to are quite old, with some dating back to 2001. Due to the constantly evolving nature of the Internet and the fact that we cannot observe it from all the perspectives we would have liked to, these statistics might only be partially accurate. They are simply an attempt to imagine what the Internet truly looks like.
{: .prompt-warning }

# References

- [Cloudflare - What is BGP?](https://www.cloudflare.com/learning/security/glossary/what-is-bgp/)
- [Cloudflare - What is an Internet exchange point?](https://www.cloudflare.com/learning/cdn/glossary/internet-exchange-point-ixp/)
- [Subramanian et al. - Characterizing the Internet hierarchy from multiple vantage points](https://ieeexplore.ieee.org/document/1019307/?arnumber=1019307)
- [Oliveira et al. - The (In)Completeness of the Observed Internet AS-level Structure](https://ieeexplore.ieee.org/abstract/document/5200324)
- [Dimitropoulos et al. - AS relationships: inference and validation](https://dl.acm.org/doi/10.1145/1198255.1198259)
- [Böttger et al. - Shaping the Internet: 10 Years of IXP Growth](https://arxiv.org/abs/1810.10963)
