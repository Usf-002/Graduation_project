import '/components/searchbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'searchbar1_widget.dart' show Searchbar1Widget;
import 'package:flutter/material.dart';

class Searchbar1Model extends FlutterFlowModel<Searchbar1Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for searchbar component.
  late SearchbarModel searchbarModel;

  @override
  void initState(BuildContext context) {
    searchbarModel = createModel(context, () => SearchbarModel());
  }

  @override
  void dispose() {
    searchbarModel.dispose();
  }
}
