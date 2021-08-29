// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbearia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BarbeariaController on _BarbeariaControllerBase, Store {
  Computed<bool> _$isContainerOrAlertComputed;

  @override
  bool get isContainerOrAlert => (_$isContainerOrAlertComputed ??=
          Computed<bool>(() => super.isContainerOrAlert,
              name: '_BarbeariaControllerBase.isContainerOrAlert'))
      .value;
  Computed<bool> _$isValidEmailPasswordComputed;

  @override
  bool get isValidEmailPassword => (_$isValidEmailPasswordComputed ??=
          Computed<bool>(() => super.isValidEmailPassword,
              name: '_BarbeariaControllerBase.isValidEmailPassword'))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_BarbeariaControllerBase.isValid'))
      .value;
  Computed<bool> _$isValidPasswordComputed;

  @override
  bool get isValidPassword =>
      (_$isValidPasswordComputed ??= Computed<bool>(() => super.isValidPassword,
              name: '_BarbeariaControllerBase.isValidPassword'))
          .value;
  Computed<bool> _$isCepValidComputed;

  @override
  bool get isCepValid =>
      (_$isCepValidComputed ??= Computed<bool>(() => super.isCepValid,
              name: '_BarbeariaControllerBase.isCepValid'))
          .value;

  final _$containerOrAlertAtom =
      Atom(name: '_BarbeariaControllerBase.containerOrAlert');

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

  final _$_BarbeariaControllerBaseActionController =
      ActionController(name: '_BarbeariaControllerBase');

  @override
  dynamic changeContainerOrAlert(bool value) {
    final _$actionInfo = _$_BarbeariaControllerBaseActionController.startAction(
        name: '_BarbeariaControllerBase.changeContainerOrAlert');
    try {
      return super.changeContainerOrAlert(value);
    } finally {
      _$_BarbeariaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
containerOrAlert: ${containerOrAlert},
isContainerOrAlert: ${isContainerOrAlert},
isValidEmailPassword: ${isValidEmailPassword},
isValid: ${isValid},
isValidPassword: ${isValidPassword},
isCepValid: ${isCepValid}
    ''';
  }
}
