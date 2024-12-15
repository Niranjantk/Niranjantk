import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final _usernameController = TextEditingController();
  File? _pickedImage;
  String? _errorMessage;
  String? _selectedCategory;
  final List<String> _categories = ['Student', 'Business', 'Job', 'Other'];

  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  // Username validation function
  String? _validateUsername(String username) {
    final regex = RegExp(r'^[a-zA-Z0-9_]{3,15}$');
    if (!regex.hasMatch(username)) {
      return 'Username must be between 3 to 15 characters and contain only letters, numbers, or underscores';
    }
    return null;
  }

  // Category validation
  String? _validateCategory(String? category) {
    if (category == null || category.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  // Check if the username and category are valid
  void _validateAndContinue() {
    setState(() {
      _errorMessage = _validateUsername(_usernameController.text);
    });

    final categoryError = _validateCategory(_selectedCategory);
    
    if (_errorMessage == null && categoryError == null && _pickedImage != null) {
      // Navigator.push(context, MaterialPageRoute(builder: (ctxt)=>));
     
    } else if (_pickedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick a profile image')),
      );
    } else if (categoryError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(categoryError)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 38, 63),
      // appBar: AppBar(
      //   title: const Text('Set Profile'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),

            // Image Picker
            GestureDetector(
              onTap: _pickImage,
              child: _pickedImage == null
                  ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.add,size: 37,),
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(_pickedImage!),
                    ),
            ),
            const SizedBox(height: 20),

            // Username Field
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _errorMessage,
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown for Category Selection
            Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color:Colors.black12,),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  dropdownColor: const Color.fromARGB(255, 67, 71, 97),
                  style: const TextStyle(color: Colors.white),
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    errorText: _validateCategory(_selectedCategory),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  items: _categories.map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ),
            ),

            const Spacer(),

            // Continue Button (at the bottom right)
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: _validateAndContinue,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
