import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExpensesListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> expenses = [
    {"date": DateTime(2024, 12, 8), "amount": 50.0, "description": "Walmart shopping"},
    {"date": DateTime(2024, 12, 8), "amount": 15.0, "description": "Uber ride"},
    {"date": DateTime(2024, 12, 7), "amount": 5.0, "description": "Morning coffee"},
  ];

  const ExpensesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> groupedExpenses = {};

    for (var expense in expenses) {
      String formattedDate = DateFormat('MMMM d, y').format(expense['date']);
      if (groupedExpenses.containsKey(formattedDate)) {
        groupedExpenses[formattedDate]?.add(expense);
      } else {
        groupedExpenses[formattedDate] = [expense];
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 10, 43, 69),
        
        title: const Text('Transactions',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: groupedExpenses.keys.length,
        itemBuilder: (context, index) {
          String date = groupedExpenses.keys.elementAt(index);
          List<Map<String, dynamic>> items = groupedExpenses[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 43, 69),
                  ),
                ),
              ),
              ...items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item["description"],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[800],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\$${item["amount"].toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
