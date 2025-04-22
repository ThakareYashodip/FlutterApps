import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          titleSpacing: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.white,
                  ));
            },
          ),
          title: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/Images/KotakLogo.jpg",
                    height: 30,
                    width: 30,
                  )),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kotak",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Kotak Mahindra Bank",
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_rounded,
                  size: 30, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 30, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.red[300],
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Savings',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                '${3248554466}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const Spacer(),
                              Container(
                                height: 40,
                                width: 120,
                                color: Colors.red[800],
                                child: const Center(
                                  child: Text(
                                    'View Balance',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //2nd Part
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Quick Access',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 5, left: 20, right: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                      "assets/Images/KotakLogo.jpg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 5, left: 20, right: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                      "assets/Images/KotakLogo.jpg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 5, left: 20, right: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                      "assets/Images/KotakLogo.jpg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 5, left: 20, right: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                      "assets/Images/KotakLogo.jpg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Text(
                                  'Transfer Money',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  'Loan and Card Offers',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  'Purchase Mutual Funds',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  'Pay your Contact',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Image.network(
                              "https://www.kotak.com/content/dam/Kotak/herosliderbanner/MF-NFO.jpg",
                              height: 150,
                              width: 350,
                              fit: BoxFit.fitWidth),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 242, 240, 240),
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Quick Access',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                //1st Line
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Transfer Money',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Loan and Card Offers',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Purchase Mutual Funds',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Pay your Contact',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                //2nd Line
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 5,
                                            left: 20,
                                            right: 20),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            "assets/Images/KotakLogo.jpg",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 10, left: 20, right: 20),
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 25,
                                          )),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Transfer Money',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Loan and Card Offers',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'Purchase Mutual Funds',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        'See more',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 6, 43, 99),
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 20, right: 20),
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                    "assets/Images/KotakLogo.jpg",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            '${resources[0]['name']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> resources = [
  {
    'name': 'Bank',
    'logo': ['assets/Images/KotakLogo.jpg'],
    'description': [
      'Kotak811',
      'Account Overview',
      'Account Activity',
      'Statement',
      'Fixed Deposits',
      'Digital Rupee',
      'Active Money',
      'See More'
    ]
  },
  {
    'name': 'Pay & Transfer',
    'logo': ['assets/Images/KotakLogo.jpg'],
    'description': [
      'Transfer Money',
      'Bill Pay & Recharge',
      'BHIM UPI',
      'Scan Any QR',
      'One Time Transfer',
      'Pay your contact',
      'Add/Manage Beneficiary',
      'see more'
    ],
  },
  {'name':'Loans',
  'logo':['assets/Images/KotakLogo.jpg'],
  'description':['Free Credit Cards','Loan and Card Offers','Personal Loan','Home Loan','Pay Day Loan','Consumer Durable loan','Pay Overdue EMI','See more']
  },
  {'name':'Cards',
  'logo':['assets/Images/KotakLogo.jpg'],
  'description':['Free Credit Cards','Loan and Card Offers','Personal Loan','Home Loan','Pay Day Loan','Consumer Durable loan','Pay Overdue EMI','See more']},
  {'name':'Invest',
  'logo':['assets/Images/KotakLogo.jpg'],
  'description':['Free Credit Cards','Loan and Card Offers','Personal Loan','Home Loan','Pay Day Loan','Consumer Durable loan','Pay Overdue EMI','See more']},
  {'name':'Apply Now',
  'logo':['assets/Images/KotakLogo.jpg'],
  'description':['Free Credit Cards','Loan and Card Offers','Personal Loan','Home Loan','Pay Day Loan','Consumer Durable loan','Pay Overdue EMI','See more']},
  {'name':'Service Requests',
  'logo':['assets/Images/KotakLogo.jpg'],
  'description':['Free Credit Cards','Loan and Card Offers','Personal Loan','Home Loan','Pay Day Loan','Consumer Durable loan','Pay Overdue EMI','See more']},
  {'name':'Insure',
  'logo':['assets/Images/KotakLogo.jpg'],
  'description':['Free Credit Cards','Loan and Card Offers','Personal Loan','Home Loan','Pay Day Loan','Consumer Durable loan','Pay Overdue EMI','See more']}
];
