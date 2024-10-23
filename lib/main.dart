import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE8ECF4), // fundalul gri
        appBar: AppBar(
          title: Text('BMI Calculator'),
          backgroundColor: Color(0xFFE8ECF4),
          elevation: 0,
        ),
        body: BMICalculatorScreen(),
        resizeToAvoidBottomInset: true, // Redimensionare cand e tastatura
      ),
    );
  }
}

class BMICalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // faci scroll daca e mai mult continut
      child: Padding(
        padding: const EdgeInsets.all(20.0), //spatiere in jurul elementelor
        child: Column( // le aseaza pe verticala
          children: [
            // Welcome Text
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome 😊",
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black,),
              ),
            ),
            SizedBox(height: 10),

            // BMI Calculator Text
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "BMI Calculator",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Butoanele pentru gen
            Row( //le aseaza pe orizontala
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genderButton("Male", true),
                genderButton("Female", false),
              ],
            ),
            SizedBox(height: 20),

            // selector de vrsta si greutate
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                numberSelector("Weight", 70),
                numberSelector("Age", 23),
              ],
            ),
            SizedBox(height: 20),

            // introducerea inaltimii
            TextField(
              decoration: InputDecoration(
                hintText: 'Height (in meters)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // BMI Result
            Text(
              "20.4",  // valoarea doar pentru design
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C4ED8),
              ),
            ),
            Text(
              "Underweight",  // valoarea doar pentru design
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20), // justare de spatiu

            // Let's Go Button
            ElevatedButton(
              onPressed: () {
                // Buton fara functionalitate
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Color(0xFF1C4ED8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Let's Go",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Gender Selection Button Widget
  Widget genderButton(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: () {
          // doar design
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: isSelected ? Color(0xFF1C4ED8) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected ? Color(0xFF1C4ED8) : Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.male : Icons.female,
              color: isSelected ? Colors.white : Colors.black,
            ),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Number Selector Widget pentru greutate si varsta
  Widget numberSelector(String label, int value) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
          SizedBox(height: 10),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // doar design
                },
                child: Icon(Icons.remove),
                mini: true,
              ),
              FloatingActionButton(
                onPressed: () {
                  // doar design
                },
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}