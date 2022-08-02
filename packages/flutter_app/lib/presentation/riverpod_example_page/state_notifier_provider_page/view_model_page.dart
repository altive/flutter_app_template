// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'entities/home_page_state.dart';

final homePageNotifierProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>((ref) {
  // Reader を渡しています（不要なら省略可能）
  return HomePageNotifier(ref.read);
});

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(this._read) : super(const HomePageState());

  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  final Reader _read;

  // メインカウントを+1する
  void increaseMainCount() {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  // サブカウントを+1する
  void increaseSubCount() {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  // すべてのカウントを0に戻す
  void resetAllCount() {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // HomePageState
    final pageState = ref.watch(homePageNotifierProvider);
    // HomePageNotifier
    final pageNotifier = ref.watch(homePageNotifierProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count ${pageState.mainCount}'),
            onTap: pageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count ${pageState.subCount}'),
            onTap: pageNotifier.increaseSubCount,
          ),
        ],
      ),
    );
  }
}
