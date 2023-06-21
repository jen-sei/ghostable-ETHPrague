# GHOSTable-ETHPrague
We have explored a dynamic market based interest rate mechanism for the GHO stablecoin.
![logo_ghstbl (1)](https://github.com/jen-sei/ghostable-ETHPrague/assets/101796507/fef55cfe-2352-4e56-b4b8-a06b8089814f)

![Slide 16_9 - 2 (1)](https://github.com/jen-sei/ghostable-ETHPrague/assets/101796507/1bac3f02-d260-4c17-9daa-e1920450b222)

![Slide 16_9 - 3 (1)](https://github.com/jen-sei/ghostable-ETHPrague/assets/101796507/060a5b20-f3cb-4ae4-9c7b-ec79d559a868)

![Slide 16_9 - 4 (1)](https://github.com/jen-sei/ghostable-ETHPrague/assets/101796507/12b4b38d-e5f6-4a3a-b67b-85049d9a6bba)

![Slide 16_9 - 5](https://github.com/jen-sei/ghostable-ETHPrague/assets/101796507/2d7ac4d1-97e1-478f-a7cb-1f9f802cc7dd)

Our solution allows for a dynamic market-based interest rate in place of a static hard coded value determined through governance and historical data proposed by risk providers for optimization. Ultimately, the GHO stable coin designed a governance based interest rate to help stablize the markets. 

Although, while this was a design choice, our team thinks that a better long term solution is to explicitlly expose a two sided market mechanism by setting the borrow rate upon a set of indices of market data ("Historical Data", which is currently hard to obtain for GHO, Utilization Ratio, and potentially using a double slop utilization strategy similar to compound). Setting a supply rate mechanism isn't neccessary here since GHO already implements a reserve mechanism based off the borrow rate and the fact that GHO doesn't have suppliers since the minting is done at a facilitator level. Aave core already has many mechanisms to implement this with the core code which further alude to the fact that it was a design decision with market stability as the priority. However, the real problem is that this strategy leads to a weaker montary policy, less flexible rates, and a less competitive model to the going market rate of other stable coins. 

Our mechanism design is more of a long term solution building on top of a proposal like this: https://governance.aave.com/t/temp-check-gho-stewards-agile-parameter-changes/13370/2. The market rate needs to be more agile given the demands of a fast moving environment, however, trying to maintain the decentralized ethos of using governance for interest rate doesn't seem to be a viable option.

# Challenges
@jscottoz - At the moment, there is no demo to show unfortunately. 

This implementation should involve a few smart contracts: 
1. Facilitator Contract
2. GHOCoin Contract and
3. InteresRateStrategy Contract

# Moving Forward
1. We need to find an oracle or an on chain set of parameters to set our agile data indicators to calculate a market based rate for interest.
2. Create risk analysis and data analysis with agent based simulation testing a new market based interest rate.
3. Build out an automated process for the market to set a floating interest rate value.

# Hackathon Difficulties
From the beginning there was a shortage of technical expertise. This ended up surfacing some details when it came to implementing our idea. Most of our time spent at the hackathon was onboarding into the ecosystem that we were wanting to build on top of. Our idea was quite ambitious and complex to reason through. In short, we came up on a time crunch and didn't have enough time to deliver our technical contracts. For example, setting up a coding environment gave a lot of difficulty. We also had difficulties with our data pipeline, learning how to use the tools competently and trying to integrate the sponsor tools into our tech stack. This alone served as many different blockers for our team. 

Our ideation from idea to technical implementation was sound, however, delivering is what served as a challenge. In general, all of our team members learned a lot of felt very humbled by our experiences.
