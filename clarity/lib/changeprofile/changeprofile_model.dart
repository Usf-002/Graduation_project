import '/flutter_flow/flutter_flow_util.dart';
import 'changeprofile_widget.dart' show ChangeprofileWidget;
import 'package:flutter/material.dart';

class ChangeprofileModel extends FlutterFlowModel<ChangeprofileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode1;
  TextEditingController? yourEmailTextController1;
  String? Function(BuildContext, String?)? yourEmailTextController1Validator;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode2;
  TextEditingController? yourEmailTextController2;
  String? Function(BuildContext, String?)? yourEmailTextController2Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityTextController1;
  String? Function(BuildContext, String?)? cityTextController1Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityTextController2;
  late bool cityVisibility;
  String? Function(BuildContext, String?)? cityTextController2Validator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;

  @override
  void initState(BuildContext context) {
    cityVisibility = false;
  }

  @override
  void dispose() {
    yourEmailFocusNode1?.dispose();
    yourEmailTextController1?.dispose();

    yourEmailFocusNode2?.dispose();
    yourEmailTextController2?.dispose();

    cityFocusNode1?.dispose();
    cityTextController1?.dispose();

    cityFocusNode2?.dispose();
    cityTextController2?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}
