import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leave_management_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:leave_management_app/app/modules/dashboard/controllers/leave_request_controller_controller.dart';
import 'package:leave_management_app/app/modules/dashboard/views/leave_request/create_request.widget.dart';
import 'package:leave_management_app/app/modules/dashboard/views/leave_request/leave_request.dart';

class LeaveRequest extends GetView<LeaveRequestControllerController> {
  LeaveRequest({
    super.key,
    required this.dashboardController,
  });
  DashboardController dashboardController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.setCureent(
          value: value,
          animatepage: false,
        );
      },
      children: [
        LeavRequestForm(
          controller: controller,
          dashboardController: dashboardController,
        ),
        LeaveRequestWidget(controller: controller),
        LeaveRequestWidget(controller: controller),
        LeaveRequestWidget(controller: controller),
      ],
    );
  }
}
