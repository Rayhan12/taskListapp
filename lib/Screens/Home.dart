import 'package:flutter/material.dart';

import 'Task List Page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome To"),
            const Text("Plan IT", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
            SizedBox(
              height: size.height*0.4,
            ),
            const Text(
                  "Your Personal task management \nand planning solution",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
            GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TaskListPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Text("Let's Get Started", style: TextStyle(color: Colors.white)),
                  ),
                )

          ]
        ),
      ),



      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text("Welcome To"),
      //       const Text("Plan IT", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
      //       SizedBox(
      //         height: size.height * 0.4,
      //       ),
      //       const Text(
      //         "Your Personal task management \nand planning solution",
      //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      //         textAlign: TextAlign.center,
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TaskListPage()));
      //         },
      //         child: Container(
      //           margin: const EdgeInsets.only(top: 10),
      //           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
      //           decoration: BoxDecoration(
      //               color: Colors.black87,
      //               borderRadius: BorderRadius.circular(10)
      //           ),
      //           child: const Text("Let's Get Started", style: TextStyle(color: Colors.white)),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}


