import 'package:cupertino_refresh/cupertino_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:fran_app/backend/models/weather.dart';
import 'package:fran_app/backend/services/weather/weather_service.dart';
import 'package:fran_app/ui/theme.dart';
import 'package:fran_app/ui/widgets/go_back_widget.dart';
import 'package:fran_app/ui/widgets/pending_widget.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _weatherService = WeatherService();
  List<WeatherForecast> _forecast = <WeatherForecast>[];

  @override
  void initState() {
    super.initState();
    _loadForecast();
  }

  @override
  Widget build(BuildContext ctx) => CupertinoPageScaffold(
    backgroundColor: Theme.weatherDayBackgroundColor,
    child: CupertinoRefresh.withScrollbar(
      physics: const AlwaysScrollableScrollPhysics(),
      onRefresh: _loadForecast,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CupertinoButton(
                    child: const GoBackWidget(color: CupertinoColors.systemGrey6),
                    onPressed: () => Navigator.of(ctx).pop()
                )
              ],
            ),
            Flexible(
              child: _forecast.isEmpty ? const PendingWidget(color: CupertinoColors.systemGrey6) : _weatherWidget(ctx),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _weatherWidget(BuildContext ctx) => CupertinoRefresh.withScrollbar(
    physics: const AlwaysScrollableScrollPhysics(),
    onRefresh: _loadForecast,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
              child: const GoBackWidget(color: CupertinoColors.systemGrey6),
              onPressed: () => Navigator.of(ctx).pop()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${_forecast.firstOrNull?.tempmin}° / ${_forecast.firstOrNull?.tempmax}°",
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text("${_forecast.firstOrNull?.symbolDescription}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_forecast.firstOrNull?.humidity ?? "N/A",
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Text("Humedad",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );

  Future<void> _loadForecast() async {
    // final weatherForecast = await _weatherService.fetchLocalForecast();
    // setState(() => _forecast = weatherForecast?.toList() ?? []);
  }
}
