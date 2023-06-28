import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:union/cubit.dart';
import 'package:union/state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: switch (cubit.state) {
        HomeStateIdeal() || HomeStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        HomeStateError error => Center(
            child: Text(error.message),
          ),
        HomeStateLoaded(items: var items) when items.isNotEmpty =>
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: HomeItemWidget(item: item),
                trailing: Checkbox(
                  value: item.isDone,
                  onChanged: (_) => cubit.toggleItem(index),
                ),
              );
            },
          ),
        HomeStateLoaded() => const Center(
            child: Text("No items"),
          ),
      },
    );
  }
}

class HomeItemWidget extends StatelessWidget {
  final HomeItem item;
  const HomeItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      StringHomeItem(todo: var todo, isDone: var isDone) => Text(todo,
          style: TextStyle(
            decoration:
                isDone ? TextDecoration.lineThrough : TextDecoration.none,
          )),
      ImageHomeItem(url: var url, isDone: var isDone) => Image.network(
          url,
          color: isDone ? Colors.grey : null,
        ),
    };
  }
}
