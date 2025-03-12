import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/constants.dart';

class ItemListing extends StatefulWidget {
  const ItemListing({super.key});

  @override
  State<ItemListing> createState() => _ItemListingState();
}

class _ItemListingState extends State<ItemListing> {
  final TextEditingController _controller = TextEditingController();
  final int MAX_PRICE_VALUE = 1000000;
  String? _selectedCategory = "الأدوات اليدوية";
  String? _selectedState = "جديد";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, HirafiConstants().hirafi_blue], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(
              "List A Tool",
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:16.0),
                          child: Text("Tool Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("General Information:",style: TextStyle(fontSize: 12),)
                      ],
                    ),

                    ///title text field:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade300)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade300)
                                ),
                                hintText: "Tool Title"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    /// description text field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: 5,
                              minLines: 1,
                              maxLength: 1000,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "About"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    /// price text fields:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.number, // For numbers with decimals
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly // Allows positive double values
                              ],
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "Price In Dinars"
                              ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    int? enteredValue = int.tryParse(value);
                                    if (enteredValue != null && enteredValue > MAX_PRICE_VALUE) {
                                      // If the entered value exceeds the maxValue, reset it
                                      _controller.text = MAX_PRICE_VALUE.toString();
                                      _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
                                    }
                                  }
                                }
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0,bottom: 16.0),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:16.0),
                          child: Text("Tool Specifications",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Specifications And Conditions:",style: TextStyle(fontSize: 12),)
                      ],
                    ),

                    ///Brand Text field:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "Brand"
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Category:"),
                        ),
                      ],
                    ),

                    /// Category dropdown menu:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Set button field to white
                                borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
                                border: Border.all(color: Colors.grey.shade300), // Optional: Add border
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12), // Add padding inside button
                              child: DropdownButtonHideUnderline( // Removes default underline
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: _selectedCategory,
                                  dropdownColor: Colors.white, // Change dropdown menu color
                                  hint: Text("choose category", style: TextStyle(color: Colors.black)),
                                  style: TextStyle(color: Colors.black), // Text color inside the button
                                  iconEnabledColor: Colors.black, // Dropdown arrow color
                                  items: HirafiConstants().categories.map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option, style: TextStyle(color: Colors.black)), // Dropdown item text color
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCategory = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Condition:"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'new',
                          groupValue: _selectedState,
                          onChanged: (value) {
                            setState(() {
                              _selectedState = value!;
                            });
                          },
                          activeColor: Colors.blue, // Changes to blue when selected
                        ),
                        Text('New'),
                        SizedBox(width: 10), // Spacing
                        Radio<String>(
                          value: 'used_like_new',
                          groupValue: _selectedState,
                          onChanged: (value) {
                            setState(() {
                              _selectedState = value!;
                            });
                          },
                          activeColor: Colors.blue, // Changes to blue when selected
                        ),
                        Text('Used'),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () =>(){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HirafiConstants().hirafi_blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.transparent)// Adjust the radius here
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "List Tool",
                                      style: TextStyle(color: Colors.white,fontSize: 14),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
