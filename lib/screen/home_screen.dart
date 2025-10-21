import 'package:flutter/material.dart';
import 'package:getx_app/layout/default_layout.dart';
import 'package:getx_app/screen/auto_dispose_modifier_screen.dart';
import 'package:getx_app/screen/family_modify_screen.dart';
import 'package:getx_app/screen/future_provider_screen.dart';
import 'package:getx_app/screen/state_notifier_provider_screen.dart';
import 'package:getx_app/screen/state_provider_screen.dart';
import 'package:getx_app/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Home Screen",
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StateProviderScreen(),
                ),
              );
            },
            child: Text("State Provider Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StateNotifierProviderScreen(),
                ),
              );
            },
            child: Text("State Notifier Provider Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FutureProviderScreen(),
                ),
              );
            },
            child: Text("Future Provider Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StreamProviderScreen(),
                ),
              );
            },
            child: Text("Stream Provider Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FamilyModifyScreen(),
                ),
              );
            },
            child: Text("Family Modify Screen"),
          ),
           ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AutoDisposeModifierScreen(),
                ),
              );
            },
            child: Text("Auto Dispose Modifier Screen"),
          ),
        ],
      ),
    );
  }
}



