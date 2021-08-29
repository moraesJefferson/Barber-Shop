// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isAlternarWidgetComputed;

  @override
  bool get isAlternarWidget => (_$isAlternarWidgetComputed ??= Computed<bool>(
          () => super.isAlternarWidget,
          name: '_HomeControllerBase.isAlternarWidget'))
      .value;
  Computed<bool> _$isFavoriteComputed;

  @override
  bool get isFavorite =>
      (_$isFavoriteComputed ??= Computed<bool>(() => super.isFavorite,
              name: '_HomeControllerBase.isFavorite'))
          .value;
  Computed<bool> _$isCurrentPositionComputed;

  @override
  bool get isCurrentPosition => (_$isCurrentPositionComputed ??= Computed<bool>(
          () => super.isCurrentPosition,
          name: '_HomeControllerBase.isCurrentPosition'))
      .value;

  final _$favoriteAtom = Atom(name: '_HomeControllerBase.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$alternarWidgetAtom = Atom(name: '_HomeControllerBase.alternarWidget');

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

  final _$currentPositionAtom =
      Atom(name: '_HomeControllerBase.currentPosition');

  @override
  Position get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$searctTextAtom = Atom(name: '_HomeControllerBase.searctText');

  @override
  String get searctText {
    _$searctTextAtom.reportRead();
    return super.searctText;
  }

  @override
  set searctText(String value) {
    _$searctTextAtom.reportWrite(value, super.searctText, () {
      super.searctText = value;
    });
  }

  final _$mapControllerAtom = Atom(name: '_HomeControllerBase.mapController');

  @override
  Completer<GoogleMapController> get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(Completer<GoogleMapController> value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  final _$markersAtom = Atom(name: '_HomeControllerBase.markers');

  @override
  List<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(List<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$boundsAtom = Atom(name: '_HomeControllerBase.bounds');

  @override
  StreamController<LatLngBounds> get bounds {
    _$boundsAtom.reportRead();
    return super.bounds;
  }

  @override
  set bounds(StreamController<LatLngBounds> value) {
    _$boundsAtom.reportWrite(value, super.bounds, () {
      super.bounds = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeAlternarWidget(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeAlternarWidget');
    try {
      return super.changeAlternarWidget(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsFavorite(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeIsFavorite');
    try {
      return super.changeIsFavorite(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentPosition(Position value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeCurrentPosition');
    try {
      return super.changeCurrentPosition(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSearchText(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeSearchText');
    try {
      return super.changeSearchText(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorite: ${favorite},
alternarWidget: ${alternarWidget},
currentPosition: ${currentPosition},
searctText: ${searctText},
mapController: ${mapController},
markers: ${markers},
bounds: ${bounds},
isAlternarWidget: ${isAlternarWidget},
isFavorite: ${isFavorite},
isCurrentPosition: ${isCurrentPosition}
    ''';
  }
}
