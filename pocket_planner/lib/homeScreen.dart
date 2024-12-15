import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pocket_planner/customeWidgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 10, 43, 69),
        title: const Text(
          'Wallete',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle logout action
            },
          ),
        ],
      ),
      drawer:const CustomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   'Account',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18),
              // ),
              Card(
                                color: const Color.fromARGB(255, 109, 116, 121),

                child: SizedBox(
                  // height: 100,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color:  const Color.fromARGB(255, 220, 234, 245),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tuesday 23 rd 2024'),
                              Text(
                                'Balance Amount',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '200000',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color:  const Color.fromARGB(255, 220, 234, 245),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  color: Colors.green,
                                  value: 50, // Total income
                                  title: 'Income',
                                  radius: 50,
                                ),
                                PieChartSectionData(
                                  color: Colors.red,
                                  value:50, // Total expense
                                  title: 'Expenses',
                                  radius: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 8),
                                const Text('Income: 70%'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                const Text('Expenses: 30%'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(174, 45, 80, 94),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color:  const Color.fromARGB(255, 220, 234, 245),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Food', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                '22/04/2024',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("20000"),
                        Icon(Icons.food_bank),
                      ],
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(174, 45, 80, 94),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color:  const Color.fromARGB(255, 220, 234, 245),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('work', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                '22/04/2024',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("20000"),
                        Icon(Icons.work),
                      ],
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(174, 45, 80, 94),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color:  const Color.fromARGB(255, 220, 234, 245),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shopping', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                '22/04/2024',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("20000"),
                        Icon(Icons.shopping_cart),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
