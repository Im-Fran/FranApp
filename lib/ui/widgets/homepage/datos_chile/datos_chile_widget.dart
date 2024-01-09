import 'package:flutter/cupertino.dart';
import 'package:fran_app/ui/widgets/homepage/datos_chile/weather_widget.dart';

class DatosChileWidget extends StatelessWidget {
  const DatosChileWidget({super.key});

  @override
  Widget build(BuildContext context) => const CupertinoPageScaffold(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("DATOS DE CHILE",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            WeatherWidget(),
          ],
        )
      ],
    ),
  );
}
