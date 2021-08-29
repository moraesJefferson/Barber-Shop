// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  Computed<bool> _$isContainerOrAlertComputed;

  @override
  bool get isContainerOrAlert => (_$isContainerOrAlertComputed ??=
          Computed<bool>(() => super.isContainerOrAlert,
              name: '_UserControllerBase.isContainerOrAlert'))
      .value;
  Computed<bool> _$isValidEmailPasswordComputed;

  @override
  bool get isValidEmailPassword => (_$isValidEmailPasswordComputed ??=
          Computed<bool>(() => super.isValidEmailPassword,
              name: '_UserControllerBase.isValidEmailPassword'))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_UserControllerBase.isValid'))
      .value;
  Computed<bool> _$isValidPasswordComputed;

  @override
  bool get isValidPassword =>
      (_$isValidPasswordComputed ??= Computed<bool>(() => super.isValidPassword,
              name: '_UserControllerBase.isValidPassword'))
          .value;

  final _$containerOrAlertAtom =
      Atom(name: '_UserControllerBase.containerOrAlert');

  @override
  bool get containerOrAlert {
    _$containerOrAlertAtom.reportRead();
    return super.containerOrAlert;
  }

  @override
  set containerOrAlert(bool value) {
    _$containerOrAlertAtom.reportWrite(value, super.containerOrAlert, () {
      super.containerOrAlert = value;
    });
  }

  final _$isLoginBarbeariaAtom =
      Atom(name: '_UserControllerBase.isLoginBarbearia');

  @override
  bool get isLoginBarbearia {
    _$isLoginBarbeariaAtom.reportRead();
    return super.isLoginBarbearia;
  }

  @override
  set isLoginBarbearia(bool value) {
    _$isLoginBarbeariaAtom.reportWrite(value, super.isLoginBarbearia, () {
      super.isLoginBarbearia = value;
    });
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  dynamic changeContainerOrAlert(bool value) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeContainerOrAlert');
    try {
      return super.changeContainerOrAlert(value);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsLoginBarbearia(bool value) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeIsLoginBarbearia');
    try {
      return super.changeIsLoginBarbearia(value);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
containerOrAlert: ${containerOrAlert},
isLoginBarbearia: ${isLoginBarbearia},
isContainerOrAlert: ${isContainerOrAlert},
isValidEmailPassword: ${isValidEmailPassword},
isValid: ${isValid},
isValidPassword: ${isValidPassword}
    ''';
  }
}
