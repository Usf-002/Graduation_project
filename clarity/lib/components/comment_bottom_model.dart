import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_bottom_widget.dart' show CommentBottomWidget;
import 'package:flutter/material.dart';

class CommentBottomModel extends FlutterFlowModel<CommentBottomWidget> {
  ///  Local state fields for this component.

  ArticlesRecord? commentparameter;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
