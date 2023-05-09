import 'package:flutter/material.dart';
import 'package:get_location/distance.dart';
import 'package:get_location/get_notification.dart';

import 'get_location.dart';
import 'dart:async';

bool reminderOn = false;
Place Lrc = Place('LRC', 24.434617, 77.161922, 50);
Place Mess = Place('Mess', 24.436353, 77.162852, 50.0);
Place Cafe = Place('Cafe', 24.435588, 77.162117, 40.0);
Place Temple = Place('Temple', 24.435310, 77.158229, 40.0);

void main() {
  // runApp(MyApp());

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

NotificationServices notificationServices = NotificationServices();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    notificationServices.initialiseNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(140, 0, 0, 0),
        appBar: AppBar(title: const Text('Select Location')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    minimumSize: Size(300, 40),
                  ),
                  onPressed: () {
                    lrc();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                                title: Text("LRC Selected"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ]),
                          );
                        });
                  },
                  child: Text("LRC")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    minimumSize: Size(300, 40),
                  ),
                  onPressed: () {
                    mess();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                                title: Text("Mess Selected"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ]),
                          );
                        });
                  },
                  child: Text("Boy's Mess")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    minimumSize: Size(300, 40),
                  ),
                  onPressed: () {
                    cafe();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                                title: Text("Cafe Selected"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ]),
                          );
                        });
                  },
                  child: Text("Cafe")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  minimumSize: Size(300, 40),
                ),
                child: Text("Temple"),
                onPressed: () {
                  temple();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                              title: Text("Temple Selected"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ]),
                        );
                      });
                },
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)),
              //     backgroundColor: Colors.blue,
              //     foregroundColor: Colors.white,
              //     padding: EdgeInsets.all(10.0),
              //     minimumSize: Size(300, 40),
              //   ),
              //   child: const Text('laundary'),
              //   onPressed: () {
              //     showDialog(
              //         context: context,
              //         builder: (context) {
              //           return Container(
              //             child: AlertDialog(
              //                 title: Text("Laundary Selected"),
              //                 actions: [
              //                   TextButton(
              //                       onPressed: () {
              //                         Navigator.pop(context);
              //                       },
              //                       child: Text("OK"))
              //                 ]),
              //           );
              //         });
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}

void mess() {
  print("In the Mess");
  reminderOn = true;
  setReminder(1);
}

void cafe() {
  print("In the Cafe");
  reminderOn = true;
  setReminder(2);
}

void lrc() {
  print("In the LRC");
  reminderOn = true;
  setReminder(3);
}

void temple() {
  print("In the Temple");
  reminderOn = true;
  setReminder(4);
}

late Timer myTimer;

void setReminder(int id) {
  switch (id) {
    case 1:
      myTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
        print("GetLocation() called");
        getLocation(Mess);
        if (reminderOn == false) {
          myTimer.cancel();
          // NotificationServices notificationServices = NotificationServices();
          notificationServices.sendNotification(
              "Approaching Destination", "You are about to reach MESS");
        }
      });
      break;

    case 2:
      myTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
        print("GetLocation() called");
        getLocation(Cafe);
        if (reminderOn == false) {
          myTimer.cancel();
          notificationServices.sendNotification(
              "Approaching Destination", "You are about to reach CAFE");
        }
      });
      break;

    case 3:
      myTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
        print("GetLocation() called");
        getLocation(Lrc);
        if (reminderOn == false) {
          myTimer.cancel();
          notificationServices.sendNotification(
              "Approaching Destination", "You are about to reach LRC");
        }
      });
      break;

    case 4:
      myTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
        print("GetLocation() called");
        getLocation(Temple);
        if (reminderOn == false) {
          myTimer.cancel();
          notificationServices.sendNotification(
              "Approaching Destination", "You are about to reach TEMPLE");
        }
      });
      break;

    default:
  }
}
