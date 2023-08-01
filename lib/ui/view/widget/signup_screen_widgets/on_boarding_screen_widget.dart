import 'dart:io';
import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_signIn_signUp_button.dart';
import 'package:compare_app/ui/view/widget/signup_screen_widgets/generate_boarding_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class OnBoardingScreen extends StatefulWidget {
  final String image;
  final CustomTextField textField1;
  final CustomTextField textField2;
  final String whichScreen;
  const OnBoardingScreen({
    Key? key,
    required this.image,
    required this.textField1,
    required this.textField2,
    this.whichScreen = "getTextFieldInformation",
  }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  DateTime dateTime = DateTime.now();

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
                    height: 250,
                    width: 300,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.textField1,
                  const SizedBox(
                    height: 20,
                  ),
                  widget.textField2,
                ],
              )
            : CupertinoPageScaffold(
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    profilePhoto == null
                        ? Image.asset(
                            "assets/person.png",
                            height: 150,
                            width: 150,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          )
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(profilePhoto!),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    customSignInSignUpButton(
                      context,
                      false,
                      "Fotoğraf Ekle",
                      () {
                        getImage(context);
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Doğum Tarihinizi Giriniz :",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.9),
                              fontWeight: FontWeight.bold),
                        ),
                        CupertinoButton(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Text(
                              "  ${dateTime.day} - ${dateTime.month} - ${dateTime.year}  ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) => SafeArea(
                                child: SizedBox(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: CupertinoDatePicker(
                                    backgroundColor: Colors.white,
                                    initialDateTime: dateTime,
                                    onDateTimeChanged: (DateTime newTime) {
                                      setState(
                                        () {
                                          dateTime = newTime;
                                          dateTimeController =
                                              "${newTime.day}-${newTime.month}-${newTime.year}";
                                        },
                                      );
                                    },
                                    use24hFormat: true,
                                    mode: CupertinoDatePickerMode.date,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
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
              customSignInSignUpButton(
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
              customSignInSignUpButton(
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
