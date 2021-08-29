// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller_barbearia.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeControllerBarbearia on _HomeControllerBarbeariaBase, Store {
  Computed<bool> _$isAlternarWidgetComputed;

  @override
  bool get isAlternarWidget => (_$isAlternarWidgetComputed ??= Computed<bool>(
          () => super.isAlternarWidget,
          name: '_HomeControllerBarbeariaBase.isAlternarWidget'))
      .value;

  final _$alternarWidgetAtom =
      Atom(name: '_HomeControllerBarbeariaBase.alternarWidget');

  @override
  bool get alternarWidget {
    _$alternarWidgetAtom.reportRead();
    return super.alternarWidget;
  }

  @override
  set alternarWidget(bool value) {
    _$alternarWidgetAtom.reportWrite(value, super.alternarWidget, () {
      super.alternarWidget = value;
    });
  }

  final _$_HomeControllerBarbeariaBaseActionController =
      ActionController(name: '_HomeControllerBarbeariaBase');

  @override
  dynamic changeAlternarWidget(bool value) {
    final _$actionInfo = _$_HomeControllerBarbeariaBaseActionController
        .startAction(name: '_HomeControllerBarbeariaBase.changeAlternarWidget');
    try {
      return super.changeAlternarWidget(value);
    } finally {
      _$_HomeControllerBarbeariaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alternarWidget: ${alternarWidget},
isAlternarWidget: ${isAlternarWidget}
    ''';
  }
}
