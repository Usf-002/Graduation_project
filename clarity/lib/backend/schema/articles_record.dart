import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesRecord extends FirestoreRecord {
  ArticlesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "articleimg" field.
  String? _articleimg;
  String get articleimg => _articleimg ?? '';
  bool hasArticleimg() => _articleimg != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "articlecontent" field.
  String? _articlecontent;
  String get articlecontent => _articlecontent ?? '';
  bool hasArticlecontent() => _articlecontent != null;

  // "articletype" field.
  String? _articletype;
  String get articletype => _articletype ?? '';
  bool hasArticletype() => _articletype != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _author = snapshotData['Author'] as String?;
    _articleimg = snapshotData['articleimg'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _articlecontent = snapshotData['articlecontent'] as String?;
    _articletype = snapshotData['articletype'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('articles');

  static Stream<ArticlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesRecord.fromSnapshot(s));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticlesRecord.fromSnapshot(s));

  static ArticlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesRecordData({
  String? title,
  String? author,
  String? articleimg,
  int? likes,
  String? articlecontent,
  String? articletype,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Author': author,
      'articleimg': articleimg,
      'likes': likes,
      'articlecontent': articlecontent,
      'articletype': articletype,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticlesRecordDocumentEquality implements Equality<ArticlesRecord> {
  const ArticlesRecordDocumentEquality();

  @override
  bool equals(ArticlesRecord? e1, ArticlesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.author == e2?.author &&
        e1?.articleimg == e2?.articleimg &&
        e1?.likes == e2?.likes &&
        e1?.articlecontent == e2?.articlecontent &&
        e1?.articletype == e2?.articletype;
  }

  @override
  int hash(ArticlesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.author,
        e?.articleimg,
        e?.likes,
        e?.articlecontent,
        e?.articletype
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesRecord;
}
