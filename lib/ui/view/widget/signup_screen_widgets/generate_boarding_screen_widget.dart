import 'dart:io';
import 'package:compare_app/ui/view/widget/signup_screen_widgets/on_boarding_screen_widget.dart';
import 'package:flutter/material.dart';
import '../login_screen_widgets/custom_text_field_widget.dart';


TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController password1Controller = TextEditingController();
TextEditingController password2Controller = TextEditingController();
TextEditingController instagramController = TextEditingController();
TextEditingController twitterController = TextEditingController();
TextEditingController threadsController = TextEditingController();
TextEditingController snapchatController = TextEditingController();
TextEditingController dateTimeController=TextEditingController(); 
File? profilePhoto;

final List<OnBoardingScreen> getInformation = [
  OnBoardingScreen(
    image: "assets/signup_screen_images/first_image.png",
    textField1: CustomTextField(
      text: "Adınızı Giriniz",
      isPasswordType: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      isIcon: true,
      icon: Icons.person_outline,
      isRequired: true,
    ),
    textField2: CustomTextField(
      text: "Soyadınızı Giriniz",
      isPasswordType: false,
      controller: surnameController,
      keyboardType: TextInputType.name,
      isIcon: true,
      icon: Icons.person_outline,
      isRequired: true,
    ),
  ),
  OnBoardingScreen(
    image: "assets/signup_screen_images/second_image.png",
    textField1: CustomTextField(
      text: "E-mail Adresinizi Giriniz",
      isPasswordType: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      isIcon: true,
      icon: Icons.email,
      isRequired: true,
    ),
    textField2: CustomTextField(
      text: "Telefon Numaranızı Giriniz",
      isPasswordType: false,
      controller: phoneController,
      keyboardType: TextInputType.phone,
      isIcon: true,
      icon: Icons.phone,
      isRequired: true,
    ),
  ),
  OnBoardingScreen(
    image: "assets/signup_screen_images/third_image.png",
    textField1: CustomTextField(
      text: "Şifrenizi Giriniz",
      isPasswordType: true,
      controller: password1Controller,
      keyboardType: TextInputType.visiblePassword,
      isIcon: true,
      icon: Icons.lock,
      isRequired: true,
      isPasswordIcon: true,
    ),
    textField2: CustomTextField(
      text: "Şifrenizi Tekrar Giriniz",
      isPasswordType: true,
      controller: password2Controller,
      keyboardType: TextInputType.visiblePassword,
      isIcon: true,
      icon: Icons.lock,
      isRequired: true,
      isPasswordIcon: true,
    ),
    isPasswordText: true,
  ),
  OnBoardingScreen(
    image: "assets/signup_screen_images/fourth_image.png",
    textField1: CustomTextField(
      text: "İnstagram Kullanıcı Adınızı Giriniz",
      isPasswordType: false,
      controller: instagramController,
      keyboardType: TextInputType.name,
    ),
    textField2: CustomTextField(
      text: "Twitter Kullanıcı Adınızı Giriniz",
      isPasswordType: false,
      controller: twitterController,
      keyboardType: TextInputType.name,
    ),
  ),
  OnBoardingScreen(
    image: "assets/signup_screen_images/fifth_image.png",
    textField1: CustomTextField(
      text: "Threads Kullanıcı Adınızı Giriniz",
      isPasswordType: false,
      controller: threadsController,
      keyboardType: TextInputType.name,
    ),
    textField2: CustomTextField(
      text: "Snapchat Kullanıcı Adınızı Giriniz",
      isPasswordType: false,
      controller: snapchatController,
      keyboardType: TextInputType.name,
    ),
  ),
  OnBoardingScreen(
    image: "assets/signup_screen_images/sixth_image.png",
    textField1: CustomTextField(
      text: "Adınızı Giriniz",
      isPasswordType: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      isIcon: true,
      icon: Icons.person_outline,
    ),
    textField2: CustomTextField(
      text: "Soyadınızı Giriniz",
      isPasswordType: false,
      controller: surnameController,
      keyboardType: TextInputType.name,
      isIcon: true,
      icon: Icons.person_outline,
    ),
    whichScreen: "",
  ),
];
