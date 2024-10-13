import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> appNames = [
    "Telegram",
    "Facebook",
    "Pinterest",
    "Instagram",
    "Messenger",
    "Twitter",
    "Discord",
    "LinkedIn",
    "Headway",
    "Roblog",
    "Snapchat"
  ];

  List<String> appLinks = [
    "https://cdn.logojoy.com/wp-content/uploads/20220329171710/telegram-app-logo.png",
    "https://cdn.logojoy.com/wp-content/uploads/20220329172048/facebook-app-logo.jpeg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171721/social-media-app-logo-pinterest.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171724/social-media-app-logo-instagram.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171728/socail-messenger-app-logo.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171747/blue-app-logo-twitter.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171749/discord-blue-app-logo.png",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171743/linkedin-blue-app-logo.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171752/Blue-app-logo-headway.png",
    "https://cdn.logojoy.com/wp-content/uploads/20240319115436/roblog-app-logo.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/20220329171613/snapchat-social-media-app-logo.jpg"
  ];

  List NewsimageUrls = [
    "https://www.hindustantimes.com/ht-img/img/2024/10/12/550x309/Baba_Siddiqui_1728755592734_1728755592904.png",
    "https://www.hindustantimes.com/ht-img/img/2024/10/12/148x111/CRICKET-IND-BAN-T20-97_1728758565686_1728758579903.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/10/12/400x225/sky2500_1728751542071_1728751554759.webp",
    "https://www.hindustantimes.com/ht-img/img/2024/10/12/400x225/Worlds_First_Commercial_Space_Station_Final_Design_1728727149053_1728727153746.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/10/10/400x225/MixCollage-10-Oct-2024-01-52-PM-3216_1728555277058_1728555282406.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/10/09/400x225/photo-1596558450268-9c27524ba856_1723108086637_1728456976888.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/10/12/400x225/dhoni_1728717140664_1728717164814.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/05/29/400x225/heatwave_1682126178495_1717001728091_1717001745747.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/10/11/400x225/State-government-approves--1-crore-to-prepare-alte_1728679370578.jpg",
    "https://www.hindustantimes.com/ht-img/img/2024/10/11/400x225/A-weather-expert-said-that-there-was-a-sudden-deve_1728675529812.jpg"
];

List Newsheadlines = [
    "Baba Siddique shot dead LIVE updates: Two arrested in connection with shooting",
    "Ton-up Sanju Samson powers record-breaking India to massive win, complete 3-0 whitewash over Bangladesh",
    "Suryakumar Yadav misses Virat Kohli's record by just 3 innings, surpasses Rohit Sharma for stellar T20I milestone",
    "Want to enjoy Earth's beauty from space? Luxurious final design of 'World's first commercial space station' revealed",
    "Amazon Great Indian Festival: New deals unlocked on laptops under ₹60000; Offer limited for today",
    "iPhone SE 4 launch soon: Will Apple Intelligence drive sales for mid-ranger?",
    "Mahendra Singh Dhoni's new hairstyle leaves fans swooning. Internet says, reverse age mode is on",
    "Pune Weather and AQI Today: Warm start at 23.17 °C, check weather forecast for October 12, 2024",
    "State approves ₹1cr to prepare Pune Metro Phase 2 reports",
    "Pune city records 18.2 mm rainfall on eve of Dussehra"
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.home_rounded,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {},
            );
          },
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
                "https://wallpapers.com/images/high/anime-profile-sage-mode-qf0v9vgsdv11p69h.webp"),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
            iconSize: 25,
            color: Colors.white,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 25,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Google",
                style: GoogleFonts.lato(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 69, 96, 118),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 280,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search or type URL",
                            hintStyle: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 25,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 380,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 49, 49),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appLinks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Pressed Recently open");
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 5),
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Center(
                                  child: Image.network(appLinks[index],
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Text(
                            appNames[index],
                            style: GoogleFonts.lato(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                  itemCount: Newsheadlines.length~/2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 380,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 49, 49),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.5, horizontal: 16),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Discover',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.more_vert_outlined,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     SizedBox(
                                      width: 200,
                                       child: Column(
                                         children: [
                                           Text(
                                             Newsheadlines[index],
                                             style: const TextStyle(
                                                 fontSize: 16, color: Colors.white),
                                                textAlign: TextAlign.start,
                                           ),
                                         ],
                                       ),
                                     ),
                                    ClipRRect(borderRadius: BorderRadius.circular(10),
                                    child: Image.network(NewsimageUrls[index],height: 100,width: 140,fit: BoxFit.cover,)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://cdn.logojoy.com/wp-content/uploads/20220329171710/telegram-app-logo.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'India TV',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 380,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 49, 49),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(NewsimageUrls[index+5],height: 150,fit: BoxFit.cover,))),
                                const SizedBox(height: 10,),
                                Text(Newsheadlines[index+5],style: const TextStyle(fontSize: 16,color: Colors.white),),
                                Row(
                                  children: [
                                    Image.network(
                                      "https://cdn.logojoy.com/wp-content/uploads/20220329171710/telegram-app-logo.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'India TV',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
