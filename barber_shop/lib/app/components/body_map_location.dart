import 'package:barber_shop/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class BodyMapLocation extends StatefulWidget {
  BodyMapLocation({Key key}) : super(key: key);

  @override
  _BodyMapLocationState createState() => _BodyMapLocationState();
}

class _BodyMapLocationState extends State<BodyMapLocation> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    homeController.buscarCurrentPosition();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              homeController.setText();
              Navigator.pop(context);
              homeController.toText.text = '';
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return homeController.isCurrentPosition
              ? ListView(
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 11,
                            child: Observer(builder: (_) {
                              return TextFormField(
                                controller: homeController.toText,
                                decoration: InputDecoration(
                                    suffixIcon: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        alignment: Alignment.centerRight,
                                      ),
                                      child: Icon(Icons.search,
                                          color: Colors.blue),
                                      onPressed: () {
                                        homeController.search();
                                      },
                                    ),
                                    border: UnderlineInputBorder(),
                                    hintText: "Pesquisar"),
                                onChanged: homeController.changeSearchText,
                              );
                            }),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  alignment: Alignment.centerLeft,
                                  animationDuration: Duration(seconds: 1)),
                              child: Icon(Icons.my_location_outlined,
                                  color: Colors.blue),
                              onPressed: () {
                                homeController.myLocation();
                              },
                            ),
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Observer(builder: (_) {
                      return Container(
                        height: 460,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  homeController.currentPosition.latitude,
                                  homeController.currentPosition.longitude),
                              zoom: 14),
                          onMapCreated: (GoogleMapController controller) {
                            homeController.mapController.complete(controller);
                            Set<Marker>.of(homeController.markers);
                          },
                          myLocationButtonEnabled: false,
                          markers: Set<Marker>.of(
                            homeController.markers,
                          ),
                        ),
                      );
                    }),
                  ],
                )
              : _circularLoading();
        },
      ),
    );
  }

  _circularLoading() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
