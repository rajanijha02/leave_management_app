import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import 'dataController.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DataController>(
      builder: ((controller) {
        return Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                  backgroundColor: Colors.transparent,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/images/logo1.png',
                    ),
                    opacity: 0.2,
                    fit: BoxFit.contain,
                  ),
                  color: Colors.white60,
                ),
                accountName: Text(
                  controller.user.value.name ?? 'NOT FOUND',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),

                accountEmail: Text(
                  controller.user.value.email ?? 'NOT FOUND',
                  style: const TextStyle(color: Colors.black),
                  // const SizedBox(width: 10),
                  // Text(
                  //   controller.user.value.number.toString() ?? 'NOT FOUND',
                  //   style: const TextStyle(color: Colors.black),
                  // )
                ),

                // currentAccountPicture: const CircleAvatar(     for User image
                //   backgroundColor: Colors.transparent,
                //   child: Icon(
                //     Icons.supervised_user_circle_outlined,
                //     //color: Colors.white,
                //     size: 50,
                //   ),
                // ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: const Text('Dashboard'),
                onTap: () {
                  Get.back();
                  Get.offAndToNamed(Routes.DASHBOARD);
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Leaves'),
                onTap: () {
                  Get.back();
                  Get.offAndToNamed(Routes.LEAVES);
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  controller.getStorage.remove('token');

                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
