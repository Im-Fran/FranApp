import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:fran_app/backend/logger.dart';
import 'package:fran_app/backend/services/weather/weather_service.dart';
import 'package:fran_app/backend/utils.dart';
import 'package:fran_app/ui/views/datos_chile/weather/weather_view.dart';
import 'package:fran_app/ui/views/error_views/missing_permissions_view.dart';
import 'package:fran_app/ui/widgets/homepage/shortcut_widget.dart';
import 'package:geolocator/geolocator.dart';

class WeatherWidget extends StatefulWidget {

  const WeatherWidget({
    super.key
  });

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final _weatherService = WeatherService();
  final _geolocator = GeolocatorPlatform.instance;

  @override
  Widget build(BuildContext context) =>
      CupertinoPageScaffold(
        child: ShortcutWidget(
          onPressed: () =>
              _geolocator.checkPermission().then(_handleLocationPermission),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF257EEF),
              Color(0xFF78E6FE),
            ],
          ),
          child: const Icon(CupertinoIcons.cloud_sun_fill,
            size: 96,
            // Not fully white but white enough
            color: Color(0xFFEFFFEF),
          ),
        ),
      );

  void _handleLocationPermission(LocationPermission locationPermission) {
    if (locationPermission == LocationPermission.denied) {
      _geolocator.requestPermission().then((permission) =>
          _handleLocationPermission(
              permission == LocationPermission.denied ? LocationPermission
                  .unableToDetermine : permission));
      return;
    }

    if (locationPermission == LocationPermission.deniedForever ||
        locationPermission == LocationPermission.unableToDetermine) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) =>
          MissingPermissionsView(
              permiso: 'ubicación',
              onOpenSettings: () {
                AppSettings.openAppSettings();
              }
          )));
      return;
    }

    Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => const WeatherView()));
  }
}


