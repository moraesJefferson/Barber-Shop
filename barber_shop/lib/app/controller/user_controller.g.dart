// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
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

  @override
  String toString() {
    return '''
isValidEmailPassword: ${isValidEmailPassword},
isValid: ${isValid}
    ''';
  }
}
