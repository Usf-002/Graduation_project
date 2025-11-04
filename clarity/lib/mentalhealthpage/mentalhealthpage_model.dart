import '/components/searchbar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mentalhealthpage_widget.dart' show MentalhealthpageWidget;
import 'package:flutter/material.dart';

class MentalhealthpageModel extends FlutterFlowModel<MentalhealthpageWidget> {
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
