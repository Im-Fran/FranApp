/*
 * This widget 'pending_widget' is meant to be used for example where we need to wait
 * for an element to be loaded, let's say the WeatherView we need to wait for the forecast,
 * while it's loading we'll show this widget telling the user that we're loading the data.
 */

import 'package:flutter/cupertino.dart';

class PendingWidget extends StatelessWidget {
  final Color? color;
  final Widget? activityIndicator;

  const PendingWidget({
    Key? key,
    this.color = CupertinoColors.black,
    this.activityIndicator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            activityIndicator ?? CupertinoActivityIndicator(
                color: color
            ),
            const SizedBox(width: 16),
            Text("Cargando...",
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
