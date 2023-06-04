import 'package:flutter/material.dart';
import 'package:simplified_data_architecture/constants.dart';
import 'package:simplified_data_architecture/data/notifiers/notifiers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: kDouble20),
            const Text(
              'SPONTANEUS',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  letterSpacing: 4.0),
            ),
            const SizedBox(height: kDouble20),
            ValueListenableBuilder(
              valueListenable: isConnectedNotifier,
              builder: (context, isConnected, child) {
                return isConnected
                    ? Image.asset('images/globe.png')
                    : Image.asset('images/no_wifi.png');
              },
            ),
            ValueListenableBuilder(
              valueListenable: dataNotifier,
              builder: (context, data, child) {
                return Padding(
                  padding: const EdgeInsets.all(kDouble10),
                  child: Column(
                    children: [
                      const SizedBox(height: kDouble20),
                      Text(
                        data.activity,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: kDouble10),
                      Text(
                        'This is a ${data.type} type activity',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          data.participants.toString(),
                        ),
                        leading: const Text('Participants'),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await dataNotifier.value.reset();
            },
            icon: const Icon(Icons.add),
            label: const Text('New Activity'),
          ),
          const SizedBox(height: kDouble10),
          TextButton(
            onPressed: () {
              dataNotifier.value.logData();
            },
            child: const Text('Log Data'),
          ),
          const SizedBox(height: kDouble20),
        ],
      ),
    );
  }
}
