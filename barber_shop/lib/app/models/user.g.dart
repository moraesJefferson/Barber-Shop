// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Usuario on _UserBase, Store {
  final _$nameAtom = Atom(name: '_UserBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cpfAtom = Atom(name: '_UserBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$passwordAtom = Atom(name: '_UserBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmaPasswordAtom = Atom(name: '_UserBase.confirmaPassword');

  @override
  String get confirmaPassword {
    _$confirmaPasswordAtom.reportRead();
    return super.confirmaPassword;
  }

  @override
  set confirmaPassword(String value) {
    _$confirmaPasswordAtom.reportWrite(value, super.confirmaPassword, () {
      super.confirmaPassword = value;
    });
  }

  final _$_UserBaseActionController = ActionController(name: '_UserBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCpf(String value) {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.changeCpf');
    try {
      return super.changeCpf(value);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_UserBaseActionController.startAction(
        name: '_UserBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword2(String value) {
    final _$actionInfo = _$_UserBaseActionController.startAction(
        name: '_UserBase.changePassword2');
    try {
      return super.changePassword2(value);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
cpf: ${cpf},
password: ${password},
confirmaPassword: ${confirmaPassword}
    ''';
  }
}
