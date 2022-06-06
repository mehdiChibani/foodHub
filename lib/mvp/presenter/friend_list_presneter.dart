import 'package:flutter_apptest/api/api.dart';
import 'package:flutter_apptest/mvp/presenter/presenter.dart';

class FriendListPresenter extends Presenter {
  void loadFriendList() {
    initLoading();
    Api().getFriends().then(onLoadingSuccess).catchError((error) {
      print(error.toString());
      onLoadingError();
    });
  }
}
