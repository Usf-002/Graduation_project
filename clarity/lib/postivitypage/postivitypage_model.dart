import '/components/searchbar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'postivitypage_widget.dart' show PostivitypageWidget;
import 'package:flutter/material.dart';

class PostivitypageModel extends FlutterFlowModel<PostivitypageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for searchbar1 component.
  late Searchbar1Model searchbar1Model;

  @override
  void initState(BuildContext context) {
    searchbar1Model = createModel(context, () => Searchbar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchbar1Model.dispose();
  }
}
