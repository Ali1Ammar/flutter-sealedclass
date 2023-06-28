import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:union/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateIdeal()) {
    loadData();
  }

  Future<void> loadData() async {
    emit(HomeStateLoading());
    // do some work to get the data here
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeStateLoaded([
      StringHomeItem("Buy milk", false),
      StringHomeItem("Buy eggs", false),
      ImageHomeItem("https://picsum.photos/200", false),
    ]));
  }

  void toggleItem(int index) {
    final currentState = state;
    if (currentState is HomeStateLoaded) {
      final items = currentState.items;
      final item = items[index];
      switch (item) {
        case StringHomeItem():
          items[index] = StringHomeItem(item.todo, !item.isDone);
        case ImageHomeItem():
          items[index] = ImageHomeItem(item.url, !item.isDone);
      }
      emit(HomeStateLoaded(items));
    }
  }
}
