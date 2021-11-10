import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Activities Organizer',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'My Activities'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Activity> activites = [
    Activity(
        id: "1",
        type: ActivityType.running,
        distance: 3.2,
        when: DateTime.parse("2021-10-11T12:30:00"),
        place: "Budapest")
  ];

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/tracking.png',
              width: 100,
            ),
          ),
          Expanded(
            flex: 4,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.builder(
                  itemCount: activites.length,
                  itemBuilder: (_, idx) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(activites[idx].id),
                            Text(
                              activites[idx].type.name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${activites[idx].distance.toStringAsFixed(1)}km",
                            ),
                            Text(
                              activites[idx].place,
                            ),
                            GestureDetector(
                              onTap: () => _deleteActivity(activites[idx].id),
                              child: const Icon(Icons.delete_forever_outlined),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addActivity(),
        tooltip: 'Add activity',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addActivity() {
    final lastId = activites.isNotEmpty ? activites.map((e) => int.tryParse(e.id) ?? 0).toList().reduce(max) : 0;

    final newActivity = Activity(
        id: (lastId + 1).toString(),
        type: ActivityType.values[Random.secure().nextInt(ActivityType.values.length)],
        distance: Random.secure().nextDouble() * 10,
        when: DateTime.parse("2021-10-11T12:30:00"),
        place: "Budapest");
    setState(() {
      activites.add(newActivity);
    });
  }

  void _deleteActivity(String id) {
    setState(() {
      activites.removeWhere((element) => element.id == id);
    });
  }
}

class Activity {
  final String id;
  final ActivityType type;
  final double distance;
  final DateTime when;
  final String place;

  Activity({
    required this.id,
    required this.type,
    required this.distance,
    required this.when,
    required this.place,
  });
}

enum ActivityType { running, kayaking, walking, climbing }

extension ActivityTypeExt on ActivityType {
  String get name => toString().split(".").last;
}
