import 'package:balirental_project1/components/data/catalog.dart';
import 'package:balirental_project1/components/data/transportation.dart';
import 'package:balirental_project1/pages/cartpage.dart';
import 'package:date_ranger/date_ranger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooktimePage extends StatefulWidget {
  final Transportation transportation;
  const BooktimePage({super.key, required this.transportation});

  @override
  State<BooktimePage> createState() => _BooktimePageState();
}

class _BooktimePageState extends State<BooktimePage> {
  var initialDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: startTime);

    if (selectedTime != null && selectedTime != startTime) {
      setState(() {
        startTime = selectedTime;
        initialDateRange = DateTimeRange(
            start: DateTime(
                initialDateRange.start.year,
                initialDateRange.start.month,
                initialDateRange.start.day,
                startTime.hour,
                startTime.minute),
            end: initialDateRange.end);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );

    if (selectedTime != null && selectedTime != endTime) {
      setState(() {
        endTime = selectedTime;
        initialDateRange = DateTimeRange(
          start: initialDateRange.start,
          end: DateTime(initialDateRange.end.year, initialDateRange.end.month,
              initialDateRange.end.day, endTime.hour, endTime.minute),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Book Time',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //upper UI
          Column(
            children: [
              // time picker
              Container(
                padding: EdgeInsets.all(24),
                child: DateRanger(
                  initialRange: initialDateRange,
                  onRangeChanged: (range) {
                    setState(() {
                      initialDateRange = range;
                    });
                  },
                ),
              ),
              // time Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Time Field for Start Date
                    GestureDetector(
                      onTap: () => _selectStartTime(context),
                      child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text(
                                'Start Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(startTime.format(context))
                            ],
                          )),
                    ),
                    Text(
                      '-',
                      style: TextStyle(fontSize: 40),
                    ),
                    // Time Field for End Date
                    GestureDetector(
                      onTap: () => _selectEndTime(context),
                      child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(width: 1.0)),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'End Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(endTime.format(context))
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //bottom Button
          Column(
            children: [
              Divider(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1.0)),
                        child: ListTile(
                          leading: Icon(
                            Icons.cancel_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Memeriksa apakah transportation tidak null
                        if (widget.transportation != null) {
                          context.read<Catalog>().addtoCart(
                                widget.transportation, // Kendaraan yang dipilih
                                initialDateRange.duration
                                    .inDays, // Durasi rental yang dihitung
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cartpage(),
                            ),
                          );
                        } else {
                          // Tindakan lain jika transportation null
                          print("Transportation data is null");
                        }
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade200,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1.0)),
                        child: ListTile(
                          title: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
