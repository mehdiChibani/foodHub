import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/friends/FriendCard.dart';
import 'package:flutter_apptest/models/friend_model.dart';
import 'package:flutter_apptest/mvp/model.dart';
import 'package:flutter_apptest/mvp/presenter/friend_list_presneter.dart';
import 'package:flutter_apptest/mvp/view.dart';


class FriendsList extends StatefulWidget {
  State<StatefulWidget> createState() => new _FriendsList();
}



class _FriendsList extends State<FriendsList> implements View {
  ViewState state = ViewState.LOADING;
final FriendListPresenter presenter=FriendListPresenter();
FriendList? _model;

  @override
  void initState() {
    super.initState();
    presenter.bindView(this);
    presenter.loadFriendList();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.DATA:
        return renderData();
      case ViewState.LOADING:
        return renderLoading();
      case ViewState.ERROR:
        return renderError();
    }
}
  Widget renderData() {

    return ListView.separated(itemBuilder:  (BuildContext context,int index){
      return  FriendCard(_model!.friends[index]);
    },
      shrinkWrap: true,
      itemCount:_model!.friends.length,
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
    );

  }

  Widget renderLoading() {
    return Text('loading ...');

  }

  Widget renderError() {
    return Text('error !!!!');

  }

  @override
  void refreshView(Model model) {
    if (model is! FriendList) return;
    setState(() {
      _model = model;
    });
  }

  @override
  void updateState(ViewState state) {
    if (!mounted) return;
    setState(() {
      this.state = state;
    });
  }
}

