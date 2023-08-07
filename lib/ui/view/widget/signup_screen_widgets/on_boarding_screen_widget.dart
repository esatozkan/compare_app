import 'dart:io';
import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_signIn_signUp_button_widget.dart';
import 'package:compare_app/ui/view/widget/signup_screen_widgets/generate_boarding_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_text_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/constans/constans.dart';

class OnBoardingScreen extends StatefulWidget {
  final String image;
  final CustomTextField textField1;
  final CustomTextField textField2;
  final String whichScreen;
  final bool isPasswordText;
  const OnBoardingScreen({
    Key? key,
    required this.image,
    required this.textField1,
    required this.textField2,
    this.whichScreen = "getTextFieldInformation",
    this.isPasswordText = false,
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  DateTime dateTime = DateTime.now().subtract(const Duration(days: 18 * 365));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: widget.whichScreen == "getTextFieldInformation"
            ? Column(
                children: [
                  Image.asset(
                    widget.image,
                    height: MediaQuery.of(context).size.width * .581,
                    width: MediaQuery.of(context).size.height * .321,
                    fit: BoxFit.cover,
                    color: signScreenItemColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.textField1,
                  const SizedBox(
                    height: 20,
                  ),
                  widget.textField2,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.isPasswordText == true
                          ? "* Şifreniz minimum 8 karakterli olmalı, en az bir  harf ve rakam içermelidir."
                          : "",
                      style: TextStyle(
                        color: signScreenSecondItemColor,
                      ),
                    ),
                  ),
                ],
              )
            : CupertinoPageScaffold(
                backgroundColor: Colors.transparent,
                child: Center(
                  child: Column(
                    children: [
                      profilePhoto == null
                          ? Image.asset(
                              "assets/person.png",
                              height: 150,
                              width: 150,
                              color: signScreenItemColor,
                              fit: BoxFit.cover,
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(profilePhoto!),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      customSignInSignUpButtonWidget(
                        context,
                        false,
                        "Fotoğraf Ekle",
                        () {
                          getImage(context);
                        },
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        "Doğum Tarihinizi Giriniz ",
                        style: TextStyle(
                          color: signScreenItemColor.withOpacity(.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'AbrilFatface',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoButton(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: signScreenItemColor,
                              ),
                            ),
                          ),
                          child: Text(
                            "  ${dateTime.day} - ${dateTime.month} - ${dateTime.year}  ",
                            style: TextStyle(
                              fontSize: 22,
                              color: signScreenItemColor,
                            ),
                          ),
                        ),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) => SafeArea(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                    color: signScreenItemColor,
                                  ),
                                  SizedBox(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                    child: CupertinoDatePicker(
                                      maximumDate: DateTime.now().subtract(
                                          const Duration(days: 18 * 365)),
                                      minimumDate: DateTime(1900),
                                      backgroundColor: signScreenItemColor,
                                      initialDateTime: dateTime,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(
                                          () {
                                            dateTime = newTime;
                                            dateTimeController.text =
                                                "${newTime.day}-${newTime.month}-${newTime.year}";
                                          },
                                        );
                                      },
                                      use24hFormat: true,
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future getImage(context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: Container(
          color: Colors.white,
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customSignInSignUpButtonWidget(
                context,
                false,
                "Galeriden Seç",
                () {
                  selectImageFromGallery();
                },
              ),
              const Text(
                "Ya Da",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              customSignInSignUpButtonWidget(
                context,
                false,
                "Kamerayı Aç",
                () {
                  selectImageFromCamera();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(
      () {
        profilePhoto = File(returnedImage.path);
      },
    );
    Navigator.of(context).pop();
  }

  Future selectImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(
      () {
        profilePhoto = File(returnedImage.path);
      },
    );
    Navigator.of(context).pop();
  }
}
