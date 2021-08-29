import 'dart:async';

import 'package:barber_shop/app/assets/constants.dart';
import 'package:barber_shop/app/database/entity/place.dart';
import 'package:barber_shop/app/database/entity/usuario_db.dart';
import 'package:barber_shop/app/database/impl/usuario_repository_impl.dart';
import 'package:barber_shop/app/services/geolocator_service.dart';
import 'package:barber_shop/app/services/lat_long_service.dart';
import 'package:barber_shop/app/services/markerService.dart';
import 'package:barber_shop/app/services/place_service.dart';
import 'package:barber_shop/authentication/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  Usuario usuario;
  final AuthenticationService _authenticationService =
      AuthenticationService(FirebaseAuth.instance);
  TextEditingController toText = TextEditingController();
  TextEditingController toTextHome = TextEditingController();
  String uid;
  String end;
  String locationText;
  Place place;

  @observable
  bool favorite = false;

  @observable
  bool alternarWidget = false;

  @observable
  Position currentPosition;

  @observable
  String searctText;

  @observable
  Completer<GoogleMapController> mapController = Completer();

  @observable
  List<Marker> markers = List<Marker>();

  @observable
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();

  @action
  changeAlternarWidget(bool value) => alternarWidget = value;

  @action
  changeIsFavorite(bool value) => favorite = value;

  @action
  changeCurrentPosition(Position value) => currentPosition = value;

  @action
  changeSearchText(String value) => searctText = value;

  @computed
  bool get isAlternarWidget {
    return alternarWidget;
  }

  @computed
  bool get isFavorite {
    return favorite;
  }

  @computed
  bool get isCurrentPosition {
    return currentPosition != null;
  }

  void findUsuario() async {
    Stream<List<Map<String, dynamic>>> lista =
        UsuarioRepositoryImpl.getInstance()
            .findById(this.uid, Constanst.USUARIO_STR);
    if (lista != null) {
      lista.forEach((element) {
        usuario = Usuario.fromJson(element.first);
      });
    }
  }

  void carregar() {
    Future.delayed(Duration(seconds: 3), () {
      changeAlternarWidget(true);
    });
  }

  void enviarUid(String uid) {
    this.uid = uid;
  }

  Future<void> logout() async {
    try {
      await _authenticationService.logout();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> buscarCurrentPosition() async {
    currentPosition =
        await GeolocatorService.getInstance().getCurrentLocation();
    if (currentPosition != null) {
      createInitialMarker();
    }
  }

  Future<void> gotoPlace(Place place) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      (CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(place.lat, place.long), zoom: 14.0))),
    );
  }

  void createMarker(Place place) {
    markers = [];
    var locationMarker =
        MarkerService.getInstance().createMarkerFromPlace(place, true);
    markers.add(locationMarker);

    var _bounds = MarkerService.getInstance().bounds(Set<Marker>.of(markers));
    bounds.add(_bounds);
  }

  void createInitialMarker() {
    markers = [];
    Place place = Place(
        lat: currentPosition.latitude,
        long: currentPosition.longitude,
        name: 'Minha localização',
        formattedAddress: 'Minha localização');
    var locationMarker =
        MarkerService.getInstance().createMarkerFromPlace(place, true);
    markers.add(locationMarker);

    var _bounds = MarkerService.getInstance().bounds(Set<Marker>.of(markers));
    bounds.add(_bounds);
  }

  Future<void> search() async {
    place = await PlaceService.getInstance().searchPlace(searctText);
    if (place != null) {
      gotoPlace(place);
      createMarker(place);
    }
  }

  Future<void> myLocation() async {
    locationText = await LatLongService.getInstance()
        .searchAdressByLatLng(currentPosition);
    changeSearchText(locationText);
    toText.text = locationText;
    Place place = Place(
        lat: currentPosition.latitude,
        long: currentPosition.longitude,
        name: 'Minha localização',
        formattedAddress: 'Minha localização');
    gotoPlace(place);
    createMarker(place);
  }

  void setText() {
    toTextHome.text = place.formattedAddress;
  }

  void favoritar() {
    changeIsFavorite(!isFavorite);
  }
}
