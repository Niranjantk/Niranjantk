import 'package:flutter/material.dart';

class WalletSettingScreen extends StatefulWidget {
  const WalletSettingScreen({Key? key}) : super(key: key);

  @override
  _WalletSettingScreenState createState() => _WalletSettingScreenState();
}

class _WalletSettingScreenState extends State<WalletSettingScreen> {
  final _walletNameController = TextEditingController();
  final _walletAmountController = TextEditingController();
  String? _selectedThemeColor;
  String? _errorMessageWalletName;
  String? _errorMessageWalletAmount;

  // Theme colors options
  final List<Color> _themeColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.cyan,
    Colors.orange
  ];

  // Validate wallet name
  String? _validateWalletName(String walletName) {
    if (walletName.isEmpty) {
      return 'Wallet name cannot be empty';
    }
    return null;
  }

  // Validate wallet amount
  String? _validateWalletAmount(String amount) {
    if (amount.isEmpty) {
      return 'Amount cannot be empty';
    }
    if (double.tryParse(amount) == null) {
      return 'Please enter a valid amount';
    }
    return null;
  }

  // Validate the form
  void _validateAndSubmit() {
    setState(() {
      _errorMessageWalletName = _validateWalletName(_walletNameController.text);
      _errorMessageWalletAmount = _validateWalletAmount(_walletAmountController.text);
    });

    if (_errorMessageWalletName == null && _errorMessageWalletAmount == null && _selectedThemeColor != null) {
      // Handle form submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    } else {
      // Handle form errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 38, 63),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),

            // Wallet Name Field with Outlined Border
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _walletNameController,
              decoration: InputDecoration(
                labelText: 'Wallet Name',
                errorText: _errorMessageWalletName,
                filled: true,
                fillColor: Colors.black12,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Wallet Amount Field with Outlined Border and Icon outside
            Row(
              children: [
                const Icon(Icons.account_balance_wallet, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(



                    
                    
                    style: const TextStyle(color: Colors.white),
                    controller: _walletAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                       icon: Container(child: const Center(child: Text('\$',style: 
                        TextStyle(color: Colors.white),),),),
                      labelText: 'Wallet Amount',
                      errorText: _errorMessageWalletAmount,
                      filled: true,
                      fillColor: Colors.black12,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Theme Color Selection (Row of color containers)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _themeColors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedThemeColor = color.toString();
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _selectedThemeColor == color.toString() ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const Spacer(),

            // Submit Button (aligned at the bottom-right)
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: _validateAndSubmit,
                icon: const Icon(Icons.check_circle),
                label: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
