import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator Pro',
      theme: ThemeData.dark(),
      home: const BMIHomePage(),
    );
  }
}

class BMIHomePage extends StatefulWidget {
  const BMIHomePage({super.key});

  @override
  State<BMIHomePage> createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  double height = 170;
  double weight = 70;
  double bmi = 0;

  int age = 22;
  bool isMale = true;

  String result = '';
  Color resultColor = Colors.white;

  void calculateBMI() {
    final h = height / 100;
    final calculatedBMI = weight / (h * h);

    String bmiResult;
    Color color;

    if (calculatedBMI < 18.5) {
      bmiResult = 'Underweight';
      color = Colors.orange;
    } else if (calculatedBMI < 25) {
      bmiResult = 'Normal';
      color = Colors.green;
    } else if (calculatedBMI < 30) {
      bmiResult = 'Overweight';
      color = Colors.amber;
    } else {
      bmiResult = 'Obese';
      color = Colors.red;
    }

    setState(() {
      bmi = calculatedBMI;
      result = bmiResult;
      resultColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final idealMin =
    (18.5 * (height / 100) * (height / 100)).toStringAsFixed(1);

    final idealMax =
    (24.9 * (height / 100) * (height / 100)).toStringAsFixed(1);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1E293B),
              Color(0xFF334155),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width > 700
                    ? 550
                    : MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'BMI Calculator Pro',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: isMale
                                    ? Colors.blue
                                    : Colors.white10,
                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.male, size: 40),
                                  SizedBox(height: 10),
                                  Text('Male'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: !isMale
                                    ? Colors.pink
                                    : Colors.white10,
                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.female, size: 40),
                                  SizedBox(height: 10),
                                  Text('Female'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Text(
                      'Height: ${height.toInt()} cm',
                      style: const TextStyle(fontSize: 20),
                    ),

                    Slider(
                      value: height,
                      min: 100,
                      max: 220,
                      activeColor: Colors.cyan,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Weight: ${weight.toInt()} kg',
                      style: const TextStyle(fontSize: 20),
                    ),

                    Slider(
                      value: weight,
                      min: 30,
                      max: 150,
                      activeColor: Colors.pink,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Age',
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (age > 1) age--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            size: 35,
                          ),
                        ),
                        Text(
                          '$age',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            size: 35,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: calculateBMI,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Calculate BMI',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    if (bmi > 0) ...[
                      Text(
                        bmi.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        result,
                        style: TextStyle(
                          color: resultColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Ideal Weight Range',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),

                      Text(
                        '$idealMin kg - $idealMax kg',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Health Tips',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),

                            if (result == 'Underweight') ...[
                              const Text(
                                  '• Eat more nutritious foods'),
                              const Text(
                                  '• Increase protein intake'),
                              const Text(
                                  '• Strength training recommended'),
                            ],

                            if (result == 'Normal') ...[
                              const Text(
                                  '• Maintain current lifestyle'),
                              const Text(
                                  '• Exercise regularly'),
                              const Text(
                                  '• Keep a balanced diet'),
                            ],

                            if (result == 'Overweight') ...[
                              const Text(
                                  '• Reduce sugary foods'),
                              const Text(
                                  '• Walk 30 minutes daily'),
                              const Text(
                                  '• Drink more water'),
                            ],

                            if (result == 'Obese') ...[
                              const Text(
                                  '• Consult a healthcare professional'),
                              const Text(
                                  '• Follow a calorie deficit plan'),
                              const Text(
                                  '• Regular exercise is important'),
                            ],
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),

                    const Text(
                      'Developed with Flutter Web • 2026',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}