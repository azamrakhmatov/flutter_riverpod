import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_app/layout/default_layout.dart';
import 'package:getx_app/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesFutureProvider);
    return DefaultLayout(
      title: "Future Provider Screen",
      body: Column(
        children: [
          state.when(
            data: (data) {
              return Expanded(
                child: ListView(
                  children: data
                      .map(
                        (e) => Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text("Error occurred: $error"),
              );
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          
        ],
      ),
    );
  }
}