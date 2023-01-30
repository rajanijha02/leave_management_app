import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leave_management_app/app/common/drawer.dart';
import 'package:leave_management_app/app/modules/dashboard/controllers/leave_request_controller_controller.dart';
import 'package:leave_management_app/app/modules/dashboard/views/check_in_out.dart';
import 'package:leave_management_app/app/modules/dashboard/views/leave_request.dart';
import 'package:leave_management_app/app/modules/dashboard/views/leaves_views.dart';

import '../../../common/drawer_image_widget.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        leading: const DrawerImageWidget(),
        title: Obx(() {
          return Text(
            controller.currentIndex.value == 0
                ? 'Your Leaves'
                : controller.currentIndex.value == 2
                    ? 'Leave Request'
                    : controller.dataController.user.value.name ?? 'Dashboard',
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.blue,
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          backgroundColor: Colors.white,
          elevation: 3,
          onDestinationSelected: (value) {
            controller.currentIndex.value = value;
          },
          selectedIndex: controller.currentIndex.value,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.book,
                color: Colors.blue,
              ),
              label: 'Your Leaves',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              label: 'Leave Request',
            ),
          ],
        );
      }),
      body: Obx(() {
        return <Widget>[
          LeaveViews(
            controller: controller,
          ),
          CheckInCheckOut(
            controller: controller,
          ),
          LeaveRequest(
            dashboardController: controller,
          ),
        ][controller.currentIndex.value];
      }),
      floatingActionButton: Obx(() {
        return controller.currentIndex.value == 2
            ? HeroPageScroll()
            : Container();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HeroPageScroll extends StatelessWidget {
  const HeroPageScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LeaveRequestControllerController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () {
                  controller.setCureent(
                    value: 0,
                    animatepage: true,
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: controller.current.value == 0
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Request',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: controller.current.value == 0
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  controller.setCureent(
                    value: 1,
                    animatepage: true,
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: controller.current.value == 1
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'All',
                    style: GoogleFonts.poppins(
                      color: controller.current.value == 1
                          ? Colors.black
                          : Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  controller.setCureent(value: 2, animatepage: true);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: controller.current.value == 2
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Pending',
                    style: GoogleFonts.poppins(
                      color: controller.current.value == 2
                          ? Colors.black
                          : Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  controller.setCureent(
                    value: 3,
                    animatepage: true,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: controller.current.value == 3
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Rejected',
                    style: GoogleFonts.poppins(
                      color: controller.current.value == 3
                          ? Colors.black
                          : Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
