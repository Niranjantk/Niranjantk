import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class AddExpenceScreen extends StatefulWidget {
  const AddExpenceScreen({super.key});

  @override
  _AddExpenceScreenState createState() => _AddExpenceScreenState();
}

class _AddExpenceScreenState extends State<AddExpenceScreen> {
  String transactionType = "Income";
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 43, 69),
        elevation: 0,
        title: const Text(
          "Wallet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wallet name",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Icon(Icons.home, color: Colors.black),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "XYZ Bank name",
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 43, 69),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        '\$',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = "Income";
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: transactionType == "Income"
                            ?  const Color.fromARGB(255, 10, 43, 69)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Income",
                        style: TextStyle(
                          color: transactionType == "Income"
                              ? Colors.white
                              :  const Color.fromARGB(255, 10, 43, 69)
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = "Expense";
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: transactionType == "Expense"
                            ? Colors.black
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Expense",
                        style: TextStyle(
                          color: transactionType == "Expense"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Description",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('MMMM d, y').format(selectedDate),
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color.fromARGB(255, 10, 43, 69),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Add Transaction",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
