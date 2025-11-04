import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comment_user" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "comment_content" field.
  String? _commentContent;
  String get commentContent => _commentContent ?? '';
  bool hasCommentContent() => _commentContent != null;

  // "article_type" field.
  DocumentReference? _articleType;
  DocumentReference? get articleType => _articleType;
  bool hasArticleType() => _articleType != null;

  // "comment_number" field.
  int? _commentNumber;
  int get commentNumber => _commentNumber ?? 0;
  bool hasCommentNumber() => _commentNumber != null;

  void _initializeFields() {
    _commentUser = snapshotData['comment_user'] as DocumentReference?;
    _commentTime = snapshotData['comment_time'] as DateTime?;
    _commentContent = snapshotData['comment_content'] as String?;
    _articleType = snapshotData['article_type'] as DocumentReference?;
    _commentNumber = castToType<int>(snapshotData['comment_number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? commentUser,
  DateTime? commentTime,
  String? commentContent,
  DocumentReference? articleType,
  int? commentNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_user': commentUser,
      'comment_time': commentTime,
      'comment_content': commentContent,
      'article_type': articleType,
      'comment_number': commentNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.commentUser == e2?.commentUser &&
        e1?.commentTime == e2?.commentTime &&
        e1?.commentContent == e2?.commentContent &&
        e1?.articleType == e2?.articleType &&
        e1?.commentNumber == e2?.commentNumber;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentUser,
        e?.commentTime,
        e?.commentContent,
        e?.articleType,
        e?.commentNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
