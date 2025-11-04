import '/flutter_flow/flutter_flow_util.dart';
import 'activitypage_widget.dart' show ActivitypageWidget;
import 'package:flutter/material.dart';

class ActivitypageModel extends FlutterFlowModel<ActivitypageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
