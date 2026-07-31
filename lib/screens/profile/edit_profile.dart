import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forge/screens/profile/profile.dart';
import 'package:forge/reusable_widget/round_text_box.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() {
    return _CompleteProfileState();
  }
}

class _CompleteProfileState extends State<EditProfile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Map<String, dynamic>? userData;
  bool isLoading = true;
  bool isChanged = false;

  Future<void> loadProfile() async {
    final user = FirebaseAuth.instance.currentUser!;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (!mounted) return;

    final data = doc.data()!;

    setState(() {
      userData = data;

      firstNameController.text = data['firstName'] ?? '';
      lastNameController.text = data['lastName'] ?? '';
      ageController.text = data['age'].toString();
      heightController.text = data['height'].toString();
      weightController.text = data['weight'].toString();

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 8,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.vertical(
          //   bottom: Radius.circular(media.width * 0.06),
          // ),
        ),
        leading: IconButton(
          onPressed: () {
            // final success = await updateUserDetails();
            // if (!mounted) return;
            // if (success) {
            Navigator.pop(context, true);
            //}
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // SizedBox(
                //   height: media.width*0.05,
                // ),
                // Text(
                //   'Edit profile',
                //   style: TextStyle(
                //     fontSize: 22,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w700
                //   ),
                // ),
                // Text(
                //   'it will help us know more about you',
                //   style: TextStyle(
                //     fontSize: 14,
                //     color: Colors.grey,
                //   ),
                // ),
                RoundTextBox(
                  hintText: 'First Name',
                  pre_icon: Icon(Icons.person),
                  controller: firstNameController,
                ),
                SizedBox(height: media.width * 0.05),
                RoundTextBox(
                  hintText: 'Last Name',
                  pre_icon: Icon(Icons.person),
                  controller: lastNameController,
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 4,
                    ),
                    child: Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: ["Male", "Female", "Others"]
                              .map(
                                (name) => DropdownMenuItem(
                                  value: name,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          isExpanded: true,
                          icon: Icon(Icons.people),
                          hint: Text(
                            'Choose Gender',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                RoundTextBox(
                  hintText: 'Age',
                  pre_icon: Icon(Icons.date_range),
                  controller: ageController,
                ),
                SizedBox(height: media.width * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: RoundTextBox(
                        hintText: 'Body Weight',
                        pre_icon: Icon(Icons.monitor_weight_outlined),
                        controller: weightController,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'kg',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: RoundTextBox(
                        hintText: 'Height',
                        pre_icon: Icon(Icons.height),
                        controller: heightController,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'cm',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.1),
                Container(
                  //margin: EdgeInsets.only(top:30),
                  width: media.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue.shade500,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      final success = await updateUserDetails();
                      if (!mounted) return;
                      if (success) {
                        Navigator.pop(context, true);
                      }
                    },
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                    textColor: Colors.white,
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> updateUserDetails() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    Map<String, dynamic> updates = {};

    if (firstNameController.text.trim() != userData?['firstName']) {
      updates['firstName'] = firstNameController.text.trim();
    }

    if (lastNameController.text.trim() != userData?['lastName']) {
      updates['lastName'] = lastNameController.text.trim();
    }

    if (ageController.text.trim() != userData?['age'].toString()) {
      updates['age'] = (ageController.text.trim());
    }

    if (heightController.text.trim() != userData?['height'].toString()) {
      updates['height'] = (heightController.text.trim());
    }

    if (weightController.text.trim() != userData?['weight'].toString()) {
      updates['weight'] = (weightController.text.trim());
    }

    if (updates.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No changes made")));
      return false;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(updates);

      return true;
    } on FirebaseException catch (e) {
      if (!mounted) return false;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Database error")));

      return false;
    }
  }
}
