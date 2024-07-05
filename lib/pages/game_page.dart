import 'package:flutter/material.dart';
import 'dart:math';

class Rps extends StatefulWidget {
  const Rps({super.key});
  @override
  State<Rps> createState() {
    return _Rps();
  }
}

class _Rps extends State<Rps> {
  String status = "your turn";
  int imgno = 0;
  String imgpath = "assets/images/rock.png";
  void onpressed(int pchoice) {
    setState(() {
      imgno = Random().nextInt(3);
      if (imgno == 0) {
        imgpath = "assets/images/rock.png";
      } else if (imgno == 1) {
        imgpath = "assets/images/paper.png";
      } else {
        imgpath = "assets/images/scissors.png";
      }
      if (imgno == pchoice) {
        status = "draw";
      } else {
        if (imgno == 0) {
          if (pchoice == 1) {
            status = "you win";
          } else {
            status = "you lose";
          }
        } else if (imgno == 1) {
          if (pchoice == 0) {
            status = "you lose";
          } else {
            status = "you win";
          }
        } else {
          if (pchoice == 1) {
            status = "you lose";
          } else {
            status = "you win";
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 10,
        title: const Text(
          "Rock Paper Scissors",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // border color
                width: 4.0, // border width
              ),
              borderRadius: BorderRadius.circular(12), // border radius
            ),
            child: Image.asset(
              imgpath,
              height: 250, // Set the desired height
              width: 250, // Set the desired width
              fit: BoxFit.cover, // Adjust the fit to your needs
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () => onpressed(0),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[200]),
                    child: const Text(
                      "R",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () => onpressed(1),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[200]),
                    child: const Text(
                      "P",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () => onpressed(2),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[200]),
                    child: const Text(
                      "S",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            status,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
