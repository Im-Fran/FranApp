import 'package:flutter/cupertino.dart';

class GoBackWidget extends StatelessWidget {

  final Color? color;

  const GoBackWidget({
    super.key,
    this.color = CupertinoColors.systemBlue
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Icon(CupertinoIcons.left_chevron,
          color: color,
        ),
      ),
      Text("Volver Atrás",
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        )
      ),
    ],
  );
}
