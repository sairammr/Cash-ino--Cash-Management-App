// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';


class learnpage extends StatefulWidget {
   learnpage({super.key});

  @override
  State<learnpage> createState() => _learnpageState();
}

class _learnpageState extends State<learnpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 0, 0, 0),
  appBar: AppBar(
    toolbarHeight:40,
    
    backgroundColor:  Color.fromARGB(143, 37, 37, 37),
    title: Text("L E A R N",
    style: TextStyle(

        fontSize: 18,
        fontWeight:FontWeight.w300,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
  ),
body: MyExpandableWidget(),
    );
  }
}
class MyExpandableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          MyExpandableTile(title: 'Index Funds', content: 'Index funds are a type of investment fund designed to replicate the performance of a specific market index, such as the S&P 500. These funds aim to provide investors with a diversified portfolio that mirrors the composition of the chosen index, offering a low-cost and passive investment strategy. Index funds operate by holding a proportional share of the securities listed in the index they track, eliminating the need for active management decisions. The appeal of index funds lies in their simplicity, cost-effectiveness, and the potential to achieve returns in line with the overall market. Investors benefit from reduced management fees compared to actively managed funds, making index funds an attractive option for those seeking broad market exposure with a long-term investment horizon. The popularity of index funds has grown significantly as investors increasingly recognize the advantages of this passive approach in building a diversified and low-cost investment portfolio.'),
          MyExpandableTile(title: 'Stocks', content: 'Stocks, also known as shares or equity, represent ownership in a company and are a key component of the financial markets. When individuals buy stocks, they become shareholders and acquire a claim on a portion of the company\'s assets and earnings. Stocks are typically traded on stock exchanges, where buyers and sellers come together to facilitate transactions. The price of a stock is determined by market forces, reflecting the perceived value of the company and its future growth potential.Investing in stocks can offer the potential for capital appreciation as the company\'s value increases over time. Additionally, shareholders may receive dividends, which are a portion of the company\'s profits distributed to investors. However, stock prices are subject to market volatility and can be influenced by various factors, including economic conditions, company performance, and global events.Stocks are categorized into different types, such as common and preferred stock, and are often classified by market capitalization (large-cap, mid-cap, and small-cap) or industry sectors. Investors employ various strategies, including fundamental analysis and technical analysis, to make informed decisions about buying or selling stocks. While investing in stocks can offer significant returns, it also involves risks, and individuals are encouraged to conduct thorough research and consider their risk tolerance before entering the stock market.'),
          MyExpandableTile(title: 'Crypto', content: 'Cryptocurrency, short for cryptographic currency," is a type of digital or virtual currency that uses cryptography for security. Unlike traditional currencies issued by governments and central banks, cryptocurrencies operate on decentralized networks based on blockchain technology. Blockchain is a distributed ledger that records all transactions across a network of computers, ensuring transparency, security, and immutability.Bitcoin, created in 2009 by an anonymous person or group using the pseudonym Satoshi Nakamoto, was the first cryptocurrency and remains the most well-known and valuable. Since then, thousands of alternative cryptocurrencies, often referred to as altcoins, have been developed, each with its unique features and use cases. Examples include Ethereum, Ripple (XRP), Litecoin, and many others.Cryptocurrencies enable peer-to-peer transactions without the need for intermediaries like banks. Participants in the network, known as miners or validators, use computational power to secure the network and validate transactions. Cryptocurrencies can be bought and sold on various online platforms called exchanges.One of the defining features of cryptocurrencies is their potential for price volatility. Prices can be influenced by factors such as market demand, regulatory developments, technological advancements, and macroeconomic trends. Additionally, the decentralized and pseudonymous nature of many cryptocurrencies has led to their use in various applications, including decentralized finance (DeFi), non-fungible tokens (NFTs), and smart contracts.While cryptocurrencies offer the potential for financial innovation and inclusivity, they also pose risks, including regulatory uncertainties, security concerns, and the potential for market manipulation. Investors and users are advised to exercise caution, conduct thorough research, and consider their risk tolerance before engaging in cryptocurrency-related activities.'),
          MyExpandableTile(title: 'Mutual Funds', content: 'Mutual funds are investment vehicles that pool money from multiple investors to invest in a diversified portfolio of stocks, bonds, or other securities. They are managed by professional fund managers, providing individual investors with an opportunity to access a diverse range of investments without having to directly manage them. Mutual funds are a popular investment choice due to their simplicity, diversification benefits, and professional management.When an investor buys shares in a mutual fund, they become a shareholder and, in turn, own a portion of the fund\'s overall portfolio. The value of the mutual fund\'s shares, known as net asset value (NAV), fluctuates based on the performance of the underlying securities.There are various types of mutual funds, each designed to meet different investment objectives and risk tolerances. Equity funds invest primarily in stocks, bond funds focus on fixed-income securities, and balanced or hybrid funds allocate assets between stocks and bonds. Additionally, there are money market funds that invest in short-term, low-risk securities.Investors can choose between actively managed and passively managed (index) funds. Actively managed funds involve professional portfolio managers making investment decisions to outperform the market, while index funds aim to replicate the performance of a specific market index. The latter often comes with lower fees.Mutual funds provide diversification, reducing risk by spreading investments across various assets. They are also known for liquidity, allowing investors to buy or sell shares on any business day. However, investors should be mindful of fees associated with mutual funds, including expense ratios and potential front-end or back-end loads.')        ],
      ),
    );
  }
}

class MyExpandableTile extends StatefulWidget {
  final String title;
  final String content;

  const MyExpandableTile({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  _MyExpandableTileState createState() => _MyExpandableTileState();
}

class _MyExpandableTileState extends State<MyExpandableTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        collapsedBackgroundColor: Color.fromARGB(255, 91, 91, 91),
        backgroundColor: Color.fromARGB(255, 91, 91, 91),
        collapsedTextColor: Color.fromARGB(255, 102, 255, 78),
        textColor: Color.fromARGB(255, 102, 255, 78),
        iconColor: Color.fromARGB(255, 255, 255, 255),
        collapsedIconColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(widget.title,style: TextStyle(fontSize: 19,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 255, 255, 255))),
        onExpansionChanged: (isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.content,style: TextStyle(fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 220, 220, 220)),),
          ),
        ],
      ),
    );
  }
}