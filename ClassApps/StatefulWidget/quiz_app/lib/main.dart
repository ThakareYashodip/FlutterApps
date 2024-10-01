import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizApp();
}

class _QuizApp extends State {
  List<Map> DartQuestions = [
    {
      "Question": "What does Dart primarily use for building user interfaces?",
      "Options": ["Widgets", "Components", "Modules", "Classes"],
      "correctAnswer": 0
    },
    {
      "Question":
          "Which of the following is a state management solution for Flutter?",
      "Options": ["BLoC", "MVP", "MVC", "Flux"],
      "correctAnswer": 0
    },
    {
      "Question":
          "What is the purpose of the 'pubspec.yaml' file in a Flutter project?",
      "Options": [
        "Manage dependencies",
        "Run the app",
        "Build UI",
        "Write tests"
      ],
      "correctAnswer": 0
    },
    {
      "Question":
          "Which method is called when a Flutter widget is inserted into the widget tree?",
      "Options": ["initState()", "build()", "createState()", "dispose()"],
      "correctAnswer": 0
    },
    {
      "Question": "What is the default method to create a Flutter app?",
      "Options": ["main()", "runApp()", "startApp()", "initApp()"],
      "correctAnswer": 1
    },
    {
      "Question": "Which of these is a commonly used layout widget in Flutter?",
      "Options": ["Container", "ListView", "Column", "All of the above"],
      "correctAnswer": 3
    },
    {
      "Question": "How do you declare a variable in Dart?",
      "Options": ["var x = 10;", "int x : 10;", "let x = 10;", "x = 10;"],
      "correctAnswer": 0
    },
    {
      "Question": "What package is commonly used for HTTP requests in Flutter?",
      "Options": ["http", "dio", "httpClient", "request"],
      "correctAnswer": 0
    },
    {
      "Question": "Which widget is used to create a material app in Flutter?",
      "Options": ["MaterialApp", "CupertinoApp", "Scaffold", "AppBar"],
      "correctAnswer": 0
    },
    {
      "Question": "What does 'hot reload' do in Flutter?",
      "Options": [
        "Reloads the app from scratch",
        "Updates the UI without losing state",
        "Reinstalls the app",
        "Restarts the device"
      ],
      "correctAnswer": 1
    }
  ];

  int currentQuestionsIndex = 0;
  int selectedIndex = -1;
  int marks = 0;
  bool scaffoldChange = true;

  WidgetStateProperty<Color?>? changeColor(int optionIndex) {
    if (selectedIndex != -1) {
      if (optionIndex ==
          DartQuestions[currentQuestionsIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedIndex == optionIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  String ScoreText(){
    if( marks <= 6 ){
      return "BetterLuck NextTime ! ";
    }else if(marks == 7 ){
      return " GoodJob ! ";
    }else{
      return " Excellent !!";
    }
  }

  Scaffold questionPage() {
    if (scaffoldChange) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 8, 170, 245),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/premium-vector/abstract-blue-background-acrylic-painting-abstract-blue-background-acrylic-painting_912214-117514.jpg?ga=GA1.1.915554636.1727464067&semt=ais_hybrid'), // replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Question : ${currentQuestionsIndex + 1}/${DartQuestions.length}",
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 350,
                height: 150,
                child: Text(
                  DartQuestions[currentQuestionsIndex]["Question"],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 0;
                      if (selectedIndex ==
                          DartQuestions[currentQuestionsIndex]
                              ['correctAnswer']) {
                        marks++;
                      }
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: changeColor(0),
                  ),
                  child: Text(
                    "A. ${DartQuestions[currentQuestionsIndex]["Options"][0]}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 1;
                      if (selectedIndex ==
                          DartQuestions[currentQuestionsIndex]
                              ['correctAnswer']) {
                        marks++;
                      }
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: changeColor(1),
                  ),
                  child: Text(
                    "B. ${DartQuestions[currentQuestionsIndex]["Options"][1]}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 2;
                      if (selectedIndex ==
                          DartQuestions[currentQuestionsIndex]
                              ["correctAnswer"]) {
                        marks++;
                      }
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: changeColor(2),
                  ),
                  child: Text(
                    "C. ${DartQuestions[currentQuestionsIndex]["Options"][2]}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 3;
                      if (selectedIndex ==
                          DartQuestions[currentQuestionsIndex]
                              ["correctAnswer"]) {
                        marks++;
                      }
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: changeColor(3),
                  ),
                  child: Text(
                    "D. ${DartQuestions[currentQuestionsIndex]["Options"][3]}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(width: 30),
          FloatingActionButton(
            onPressed: () {
              if (currentQuestionsIndex > 0) {
                currentQuestionsIndex--;
                if (selectedIndex != -1) {
                  selectedIndex = -1;
                }
              }
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(255, 255, 87, 34),
            child: const Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 55,
            ),
          ),
          const SizedBox(
            width: 200,
          ),
          FloatingActionButton(
            onPressed: () {
              if (selectedIndex != -1) {
                selectedIndex = -1;
                if (currentQuestionsIndex < DartQuestions.length - 1) {
                  currentQuestionsIndex++;
                  scaffoldChange = true;
                } else {
                  scaffoldChange = false;
                }
              }
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(255, 255, 87, 34),
            child: const Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 55,
            ),
          )
        ]),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 170, 245),
          centerTitle: true,
          title: const Text(
            "Result Screen",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/premium-vector/abstract-blue-background-acrylic-painting-abstract-blue-background-acrylic-painting_912214-117514.jpg?ga=GA1.1.915554636.1727464067&semt=ais_hybrid'), // replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ScoreText(),style: const TextStyle(
                        fontWeight: FontWeight.w700 , fontSize: 30 , color: Color.fromARGB(255, 255, 233, 38) 
                      ),),
                  ],
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 340,
                  width: 350,
                  child: Image.network(
                      "https://img.freepik.com/free-vector/video-game-trophy_24877-81612.jpg?ga=GA1.1.915554636.1727464067&semt=ais_hybrid",
                      fit: BoxFit.cover),
                ),
                const SizedBox(height: 0),
                SizedBox(
                    height: 81.5,
                    width: 350,
                    child: Image.network(
                      "https://t4.ftcdn.net/jpg/01/07/31/47/240_F_107314733_rQLzIzEiGr4WgtUmFMZwXLEW2HXQfSlN.jpg",
                      fit: BoxFit.cover,
                      semanticLabel: "CONGRATULATIONS",
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 0,
                    ),
                    Text(
                      " Marks : $marks / ${DartQuestions.length}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Color.fromARGB(255, 255, 240, 186)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 0),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      scaffoldChange = true;
                      currentQuestionsIndex = 0;
                      marks = 0;
                      setState(() {});
                    },
                    backgroundColor: const Color.fromARGB(255, 255, 87, 34),
                    child: const Icon(
                      Icons.restart_alt_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      "RESET",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 255, 87, 34),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      "HOME",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return questionPage();
  }
}
