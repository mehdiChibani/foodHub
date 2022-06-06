
import 'package:flutter_apptest/mvp/model.dart';
import 'package:flutter_apptest/mvp/view.dart';

class Presenter {
  View? view;
  Model? model;

  void initializeModel(Model model) {
    this.model = model;
  }

  void bindView(View view) {
    this.view = view;
  }

  void initLoading() {
    assert(view != null);
    view!.updateState(ViewState.LOADING);
  }

  void onLoadingSuccess(Model model) {
    assert(view != null);
    view!.refreshView(model);
    view!.updateState(ViewState.DATA);
  }

  void onLoadingError() {
    assert(view != null);
    view!.updateState(ViewState.ERROR);
  }
}
