import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rps/rps_controller.dart';

import 'enums/sign.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme().copyWith(
          headlineLarge: const TextStyle(fontSize: 70),
        ),
        useMaterial3: true,
      ),
      home: const RPSHomeScreen(),
    );
  }
}

class RPSHomeScreen extends ConsumerStatefulWidget {
  const RPSHomeScreen({
    super.key,
  });

  @override
  ConsumerState<RPSHomeScreen> createState() => _RPSHomeScreenState();
}

class _RPSHomeScreenState extends ConsumerState<RPSHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(rpsStateNotifierProvider);
    return Scaffold(
        backgroundColor: state.backgroundColor,
        body: SafeArea(
          child: Builder(builder: (context) {
            return Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      state.botSign,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 80),
                    Text(
                      state.gameStateDescription,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 50),
                    state.playerSign.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text(
                                  '👊',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                onPressed: () {
                                  ref
                                      .read(rpsStateNotifierProvider.notifier)
                                      .play(Sign.rock);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  '✋🏼',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                onPressed: () {
                                  ref
                                      .read(rpsStateNotifierProvider.notifier)
                                      .play(Sign.paper);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  '✌🏼',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                onPressed: () {
                                  ref
                                      .read(rpsStateNotifierProvider.notifier)
                                      .play(Sign.scissors);
                                },
                              )
                            ],
                          )
                        : Center(
                            child: Text(
                              state.playerSign,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                  ],
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      ref.read(rpsStateNotifierProvider.notifier).playAgain();
                    },
                    child: Text(
                      "Play Again",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.blue),
                    )),
                const SizedBox(
                  height: 40,
                )
              ],
            );
          }),
        ));
  }
}
