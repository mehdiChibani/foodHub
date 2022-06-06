
import 'package:flutter/cupertino.dart';
import 'package:flutter_apptest/mvp/model.dart';

abstract class View{

  void refreshView(Model model);

  void updateState(ViewState state);

  Widget renderData();

  Widget renderLoading();

  Widget renderError();

}

enum ViewState { LOADING, ERROR, DATA }
