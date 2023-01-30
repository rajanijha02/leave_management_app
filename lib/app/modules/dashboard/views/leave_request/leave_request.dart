import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:leave_management_app/app/models/leave_request.dart';
import 'package:leave_management_app/app/modules/dashboard/controllers/leave_request_controller_controller.dart';

class LeaveRequestWidget extends StatelessWidget {
  LeaveRequestWidget({
    super.key,
    required this.controller,
  });
  LeaveRequestControllerController controller;
  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<LeaveRequest>(
        itemBuilder: (context, item, index) {
          return ListTile(title: Text(item.value!.toString()));
        },
        newPageErrorIndicatorBuilder: (context) {
          return Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('Error'),
          );
        },
        noItemsFoundIndicatorBuilder: (context) {
          return Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('No Items Found'),
          );
        },
      ),
    );
  }
}
