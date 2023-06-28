sealed class HomeState {}

class HomeStateIdeal extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final bool isLoadingMore;
  final List<HomeItem> items;

  HomeStateLoaded(this.items, [this.isLoadingMore = false]);
}

class HomeStateError extends HomeState {
  final String message;

  HomeStateError(this.message);
}

//our data
sealed class HomeItem {
  final bool isDone;
  HomeItem(this.isDone);
}

class StringHomeItem extends HomeItem {
  final String todo;

  StringHomeItem(this.todo, bool isDone) : super(isDone);
}

class ImageHomeItem extends HomeItem {
  final String url;

  ImageHomeItem(this.url, bool isDone) : super(isDone);
}
