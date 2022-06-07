import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home/const/date_time_extension.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/provider/booking_page_provider.dart';
import 'package:take_home/provider/get_it_service.dart';
import 'package:take_home/repository/data_repo.dart';
import 'package:take_home/widgets/loading_dialog.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingPageProvider(
        dataRepo: getIt<IDataRepo>(),
        context: context,
      ),
      builder: (context, _) {
        return Consumer<BookingPageProvider>(
          builder: (context, value, child) {
            return value.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: MainTheme.primary,
                      color: MainTheme.primary,
                    ),
                  )
                : Scaffold(
                    backgroundColor: MainTheme.darkWhite,
                    appBar: AppBar(
                      title: const Text('Available Time Slots'),
                      actions: [
                        IconButton(
                          onPressed: () => showInfoModal(context),
                          icon: const Icon(
                            Icons.info_outline,
                          ),
                        ),
                      ],
                    ),
                    body: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 1 / 8,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var e = value.timeSlots[index];
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
                                    border: Border.all(
                                      color: MainTheme.primary.withOpacity(.05),
                                    ),
                                  ),
                                  child: Column(children: [
                                    Text(
                                      e.date.toMonth(),
                                      style: e == value.selectedTimeSlot
                                          ? MainTheme.selectedSlotTextStyle
                                          : MainTheme.slotTextStyle,
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 5)),
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
                            itemCount: value.timeSlots.length,
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
                            child: GridView.builder(
                              itemCount: value.selectedTimeSlot!.slots.length,
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.only(
                                  right: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: MainTheme.primary.withOpacity(.05),
                                  ),
                                ),
                                child: value.selectedTimeSlot!.slots[index]
                                        .available
                                    ? TextButton(
                                        style: value.selectedTimeSlot!
                                                    .slots[index] ==
                                                value.selectedSlot
                                            ? MainTheme.selectedSlotTimeStyle
                                            : MainTheme.normalSlotTimeStyle,
                                        onPressed: () => value.setSelectedSlot(
                                            value.selectedTimeSlot!
                                                .slots[index]),
                                        child: Text(
                                          "${value.selectedTimeSlot!.slots[index].startTime.toTimeOnly()} - ${value.selectedTimeSlot!.slots[index].endTime.toTimeOnly()}",
                                          style: value.selectedTimeSlot!
                                                      .slots[index] ==
                                                  value.selectedSlot
                                              ? MainTheme.selectedSlotTextStyle
                                              : MainTheme.slotTextStyle,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text(
                                            "${value.selectedTimeSlot!.slots[index].startTime.toTimeOnly()} - ${value.selectedTimeSlot!.slots[index].endTime.toTimeOnly()}",
                                            style: MainTheme.slotTextStyle,
                                          ),
                                        ),
                                      ),
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    bottomNavigationBar: value.selectedSlot != null
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: MediaQuery.of(context).size.height * 1 / 10,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 3.0,
                                      bottom: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                      minimumSize:
                                          const Size.fromHeight(50), // NEW
                                    ),
                                    onPressed: () => showSuccessDialog(context),
                                    child: const Text(
                                      'Proceed Next',
                                    ),
                                  ),
                                ]),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                  );
          },
        );
      },
    );
  }
}
