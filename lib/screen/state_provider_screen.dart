import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_app/layout/default_layout.dart';
import 'package:getx_app/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  // StatelessWidget bilan ConsumerWidget birxil lekin bitta farqi bor yani nima? ->. build ichida WidgetRef ref berish kerak.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      numberProvider,
    ); // numberProvider dan qiymatni olish
    return DefaultLayout(
      title: "StateProviderScreen",
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(numberProvider.notifier).update((state) => state + 1);  // state를 업데이트 하는 방법 -> 1
                  
                    // .state++; // numberProvider qiymatini oshirish
                    
              },
              child: Text("+"),
            ),  
            ElevatedButton(
              onPressed: () {
                ref
                    .read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state -1; // state를 업데이트 하는 방법 -> 2
                    // .state++; // numberProvider qiymatini oshirish
                    
              },
              child: Text("-"),
            ),  
          ],
        ),
      ),
    );
  }
}


class _NextScreen extends ConsumerWidget {
     

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      numberProvider,
    );
        return DefaultLayout(
      title: "StateProviderScreen",
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(numberProvider.notifier)
                    // .state++; // numberProvider qiymatini oshirish
                    .state = provider + 1;
              },
              child: Text("Increment"),
            ),
            
          ],
        ),
      ),
    );
  }
}