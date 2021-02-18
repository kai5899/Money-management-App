import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Pages/CategoriesPage.dart';
import 'package:savey/Pages/WalletsPage.dart';
import 'package:savey/Widgets/ProfilePageWidgets/ProfileOptionWidget.dart';
import 'package:savey/services/ThemeService.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Container(
          clipBehavior: Clip.antiAlias,
          height: Get.height * 0.9,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(36),
              bottomLeft: Radius.circular(36),
            ),
            color: backgroundGrey,
          ),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.05),

              //profile page title

              Container(
                child: Center(
                  child: Text(
                    "Profile",
                    style: montserratStyle(
                      color: mainColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: Get.height * 0.05,
                width: Get.width,
              ),

              SizedBox(height: Get.height * 0.03),

              //Profile Page Header

              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  child: Row(
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                            color: supportColor2,
                            image: DecorationImage(
                                image:
                                    Image.asset("assets/icons/boy.png").image)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Mr.Universe Education",
                            style: montserratStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text("muniverse95@gmail.com",
                              style: montserratStyle(
                                  color: backgroundGreyDark, fontSize: 14)),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Edit Profile",
                                  style: montserratStyle(color: white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(left: 25, right: 25),
                ),
              ),

              SizedBox(height: Get.height * 0.03),

              //ad holders

              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: ListTile(
                    title: Text("Become a Pro member"),
                    subtitle: Text("Never lose data."),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          // color: supportColor2,
                          image: DecorationImage(
                              image:
                                  Image.asset("assets/icons/medal.png").image)),
                    ),
                    trailing: ChoiceChip(
                      label: Text(
                        "Subscribe now",
                        style: TextStyle(color: black),
                      ),
                      selected: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.03),

              //options

              Expanded(
                child: Container(
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ProfileOption(
                        icon: "profile",
                        title: "My Profile",
                        onPressed: () {},
                      ),
                      ProfileOption(
                        icon: "wallet",
                        title: "Wallets",
                        onPressed: () {
                          Get.to(WalletsPage());
                        },
                      ),
                      ProfileOption(
                        icon: "archive",
                        title: "Categories",
                        onPressed: () {
                          Get.to(CategoriesPage(),
                              transition: Transition.downToUp);
                        },
                      ),
                      ProfileOption(
                        icon: "flashlight",
                        title: "Dark Mode",
                        onPressed: ThemeService().switchTheme,
                      ),
                      ProfileOption(
                        icon: "setting",
                        title: "Settings",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
