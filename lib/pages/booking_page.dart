import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home/const/date_time_extension.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/provider/booking_page_provider.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingPageProvider(),
      builder: (context, _) {
        return Consumer<BookingPageProvider>(
          builder: (context, value, child) => Scaffold(
            backgroundColor: MainTheme.darkWhite,
            appBar: AppBar(
              title: const Text('Available Time Slots'),
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: value.timeSlots.map(
                      (e) {
                        return InkResponse(
                          onTap: (() => value.setSelectedTimeSlot(e)),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: e == value.selectedTimeSlot
                                  ? MainTheme.primary
                                  : MainTheme.cream,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  30,
                                ),
                              ),
                            ),
                            child: Column(children: [
                              Text(
                                e.date.toMonth(),
                                style: e == value.selectedTimeSlot
                                    ? MainTheme.selectedSlotTextStyle
                                    : MainTheme.slotTextStyle,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              Text(
                                e.date.toDay(),
                                style: e == value.selectedTimeSlot
                                    ? MainTheme.selectedSlotTextStyle
                                    : MainTheme.slotTextStyle,
                              ),
                            ]),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Wrap(
                      children: value.selectedTimeSlot!.slots
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                                bottom: 10,
                              ),
                              child: TextButton(
                                style: e == value.selectedSlot
                                    ? MainTheme.selectedSlotTimeStyle
                                    : MainTheme.normalSlotTimeStyle,
                                onPressed: () => value.setSelectedSlot(e),
                                child: Text(
                                  "${e.startTime.toTimeOnly()} - ${e.endTime.toTimeOnly()}",
                                  style: e == value.selectedSlot
                                      ? MainTheme.selectedSlotTextStyle
                                      : MainTheme.slotTextStyle,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: value.selectedSlot != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 1 / 10,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3.0,
                          bottom: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Selected Slot: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${value.selectedSlot!.startTime.toTimeOnly()} - ${value.selectedSlot!.endTime.toTimeOnly()}",
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Proceed Next',
                        ),
                      ),
                    ]),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            // floatingActionButton: value.selectedSlot != null
            //     ? FloatingActionButton.extended(
            //         onPressed: () {},
            //         label: const Text(
            //           "Click here to book",
            //         ),
            //       )
            //     : null,
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,
          ),
        );
      },
    );
  }
}
