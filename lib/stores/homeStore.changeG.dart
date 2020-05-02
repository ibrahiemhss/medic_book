// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$logedInAtom = Atom(name: '_HomeStore.logedIn');

  @override
  bool get logedIn {
    _$logedInAtom.context.enforceReadPolicy(_$logedInAtom);
    _$logedInAtom.reportObserved();
    return super.logedIn;
  }

  @override
  set logedIn(bool value) {
    _$logedInAtom.context.conditionallyRunInAction(() {
      super.logedIn = value;
      _$logedInAtom.reportChanged();
    }, _$logedInAtom, name: '${_$logedInAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_HomeStore.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$recommendDataAtom = Atom(name: '_HomeStore.recommendData');

  @override
  CommonDataList get recommendData {
    _$recommendDataAtom.context.enforceReadPolicy(_$recommendDataAtom);
    _$recommendDataAtom.reportObserved();
    return super.recommendData;
  }

  @override
  set recommendData(CommonDataList value) {
    _$recommendDataAtom.context.conditionallyRunInAction(() {
      super.recommendData = value;
      _$recommendDataAtom.reportChanged();
    }, _$recommendDataAtom, name: '${_$recommendDataAtom.name}_set');
  }

  final _$versionDataAtom = Atom(name: '_HomeStore.versionData');

  final _$getUserInfoAsyncAction = AsyncAction('getUserInfo');

  @override
  Future<dynamic> getUserInfo(int id) {
    return _$getUserInfoAsyncAction.run(() => super.getUserInfo(id));
  }


  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  bool checkLogIn() {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.checkLogIn();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }
  @override
  String toString() {
    final string =
        'logedIn: ${logedIn.toString()},user: ${user.toString()},recommendData: ${recommendData.toString()}}';
    return '{$string}';
  }
}
