import 'package:flutter/cupertino.dart';
import 'package:fran_app/ui/widgets/homepage/datos_chile/datos_chile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const CupertinoPageScaffold(
    child: Padding(
      padding: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          DatosChileWidget(),
        ],
      ),
    ),
  );
}
