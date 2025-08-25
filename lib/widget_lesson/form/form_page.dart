import 'package:flutter/material.dart';
import 'package:kayaku_widget_app/models/category.dart';
import 'package:kayaku_widget_app/models/gender.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Category? selectedCategory;
  bool isTnCChecked = false;
  Gender? selectedGender;

  String selectedFruit = 'Apple'; // Default selected fruit

  List<String> checkListCity = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Medan',
    'Yogyakarta',
  ];

  List<String> selectedCities = [];

  DateTime selectedDate = DateTime.now();

  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose(); // Dispose the controller to free resources
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Page Example')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null; // Return null if the input is valid
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Simple email validation
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null; // Return null if the input is valid
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16.0),
            //password field
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                  child: Icon(
                    isObscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
              obscureText: isObscurePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null; // Return null if the input is valid
              },
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16.0),
            //phone number field
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            //dropdown button
            DropdownButtonFormField<Category>(
              decoration: InputDecoration(
                labelText: 'Select Option',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedCategory,
              items: categories.map((Category category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select an option';
                }
                return null; // Return null if the input is valid
              },
            ),
            const SizedBox(height: 16.0),
            //switch widget
            SwitchListTile(
              title: const Text('Accept Terms and Conditions'),
              value: isTnCChecked,

              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              subtitle: const Text(
                'You must accept the terms and conditions to proceed.',
              ),
              onChanged: (bool value) {
                setState(() {
                  // Toggle the switch state
                  isTnCChecked = value;
                });
              },
              secondary: Icon(
                isTnCChecked ? Icons.check_circle : Icons.check_circle_outline,
              ),
            ),
            const SizedBox(height: 16.0),
            //radio widget
            RadioListTile<String>(
              value: 'Apple',
              groupValue: selectedFruit,
              onChanged: (value) {
                setState(() {
                  selectedFruit =
                      value ?? 'Apple'; // Default to 'Apple' if null
                });
              },
              title: const Text('Apple'),
            ),
            RadioListTile<String>(
              value: 'Banana',
              groupValue: selectedFruit,
              onChanged: (value) {
                setState(() {
                  selectedFruit =
                      value ?? 'Apple'; // Default to 'Apple' if null
                });
              },
              title: const Text('Banana'),
            ),
            RadioListTile<String>(
              value: 'Orange',
              groupValue: selectedFruit,
              onChanged: (value) {
                setState(() {
                  selectedFruit =
                      value ?? 'Apple'; // Default to 'Apple' if null
                });
              },
              title: const Text('Orange'),
            ),
            const SizedBox(height: 16.0),
            //checkbox widget
            ...checkListCity.map((city) {
              return CheckboxListTile(
                title: Text(city),
                value: selectedCities.contains(city),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedCities.add(city);
                    } else {
                      selectedCities.remove(city);
                    }
                  });
                },
              );
            }),
            const SizedBox(height: 16.0),
            //date picker widget
            InkWell(
              onTap: () async {
                final dataDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (dataDate != null) {
                  setState(() {
                    selectedDate = dataDate;
                  });
                }
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    '${selectedDate.toLocal()}'.split(' ')[0],
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final String email = emailController.text;
                final String password = passwordController.text;

                // if (_formKey.currentState?.validate() ?? false) {
                //   // If the form is valid, show a snackbar with the name
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Hello, $name!'),
                //       duration: const Duration(seconds: 2),
                //       backgroundColor: Colors.green,
                //     ),
                //   );
                // }
                // if (name.isEmpty || email.isEmpty || password.isEmpty) {
                //   showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: const Text('Error'),
                //         content: const Text('Please fill in all fields.'),
                //         actions: [
                //           TextButton(
                //             onPressed: () {
                //               Navigator.of(context).pop();
                //             },
                //             child: const Text('OK'),
                //           ),
                //         ],
                //       );
                //     },
                //   );
                // }
                //show dialog for category selection
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Selected Category'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedCategory != null
                                ? 'You selected: ${selectedCategory!.name}'
                                : 'No category selected',
                          ),
                          const SizedBox(height: 10),
                          Text('Selected Fruit: $selectedFruit'),
                          const SizedBox(height: 10),
                          Text('Selected Cities: ${selectedCities.join(', ')}'),
                        ],
                      ),
                      actions: [
                        //cancel button
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16.0),
            //bottomsheet
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      height: 0.5 * MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Simple email validation
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null; // Return null if the input is valid
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 16.0),
                          //password field
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscurePassword = !isObscurePassword;
                                  });
                                },
                                child: Icon(
                                  isObscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            obscureText: isObscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null; // Return null if the input is valid
                            },
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Show Bottom Sheet'),
            ),
            const SizedBox(height: 16.0),
            //show snackbar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('This is a Snackbar message!'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              child: const Text('Show Snackbar'),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
