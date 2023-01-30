import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:leave_management_app/app/models/attendance_status.dart';
import 'package:leave_management_app/app/modules/dashboard/controllers/dashboard_controller.dart';

class CheckInCheckOut extends StatelessWidget {
  CheckInCheckOut({
    super.key,
    required this.controller,
  });
  DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red.shade50, Colors.green.shade50],
              ),
            ),
            child: Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: ElevatedButton(
                  onLongPress: () {
                    controller.markAttendance();
                  },
                  statesController: MaterialStatesController(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.attendanceStatus.value ==
                                controller.HOLIDAY ||
                            controller.attendanceStatus.value ==
                                controller.LEAVE ||
                            controller.attendanceStatus.value ==
                                controller.CHECKED_OUT
                        ? Colors.grey
                        : controller.attendanceStatus.value ==
                                controller.CHECKED_IN
                            ? Colors.green[400]
                            : Colors.blue[400],
                    minimumSize: const Size(70, 70),
                    shape: CircleBorder(
                      side: BorderSide(
                        color: controller.attendanceStatus.value ==
                                    controller.HOLIDAY ||
                                controller.attendanceStatus.value ==
                                    controller.LEAVE ||
                                controller.attendanceStatus.value ==
                                    controller.CHECKED_OUT
                            ? Colors.grey
                            : controller.attendanceStatus.value ==
                                    controller.CHECKED_IN
                                ? Colors.green
                                : Colors.blue,
                        width: 7,
                      ),
                    ),
                    padding: const EdgeInsets.all(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: controller.attendanceState.value ==
                            controller.LOADING
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : controller.attendanceState.value == controller.ERROR
                            ? Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Error',
                                  style: GoogleFonts.firaSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            : controller.attendanceStatus.value ==
                                    controller.HOLIDAY
                                ? RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: 'Today',
                                      style: GoogleFonts.firaSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.5,
                                        fontSize: 12,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '\n Holiday',
                                          style: GoogleFonts.firaSans(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1.5,
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : controller.attendanceStatus.value ==
                                        controller.LEAVE
                                    ? Container()
                                    : controller.attendanceStatus.value ==
                                            controller.CHECKED_OUT
                                        ? Container(
                                            alignment: Alignment.center,
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                text: 'You are',
                                                style: GoogleFonts.firaSans(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1.5,
                                                  fontSize: 12,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '\nChecked Out',
                                                    style: GoogleFonts.firaSans(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 1.5,
                                                      fontSize: 20,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              text: 'Tap & Hold to',
                                              style: GoogleFonts.firaSans(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.5,
                                                fontSize: 12,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '\n${controller.attendanceStatus.value == controller.NOT_FOUND ? 'Check IN' : controller.attendanceStatus.value == controller.CHECKED_IN ? 'Check OUT' : 'ERROR'}',
                                                  style: GoogleFonts.firaSans(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 1.5,
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                  ),
                  onPressed: () {},
                ),
              );
            })),
        Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Check In',
                          style: GoogleFonts.firaSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '\n${controller.checkInTime.value}',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Check Out',
                          style: GoogleFonts.firaSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '\n${controller.checkOutTime.value}',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Hours',
                          style: GoogleFonts.firaSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: '\n${controller.total.value}',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        Expanded(
          child: RefreshIndicator(
            child: PagedListView(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<AttendanceStatus>(
                itemBuilder: (context, item, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(10),
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.createdAt.toString().split('T').first,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: item.state == controller.CHECKED_OUT
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                item.state.toString(),
                                style: GoogleFonts.firaSans(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('HH:MM:ss').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  item.checkInTimeStamps!.toInt(),
                                ),
                              ),
                            ),
                            if (item.checkOutTimeStamps != null)
                              Text(
                                DateFormat('HH:MM:ss').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    item.checkOutTimeStamps!.toInt(),
                                  ),
                                ),
                              )
                            else
                              const Text('__:__:__')
                          ],
                        ),
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TOTAL HOURS',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 12,
                                  ),
                                ),
                                if (item.checkOutTimeStamps == null)
                                  const Text(
                                    'NOT CHECKED OUT',
                                  )
                                else
                                  Text(
                                    DateFormat('HH:MM:ss').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        DateTime.fromMillisecondsSinceEpoch(
                                          item.checkOutTimeStamps!.toInt(),
                                        )
                                            .difference(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                item.checkInTimeStamps!.toInt(),
                                              ),
                                            )
                                            .inMilliseconds,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            onRefresh: () async {
              controller.pagingController.refresh();
            },
          ),
        )
      ],
    );
  }
}
