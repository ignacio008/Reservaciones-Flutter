import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';

class WidgetColumnServiceDatos extends StatefulWidget {
  Service iconmodel;
  WidgetColumnServiceDatos(this.iconmodel);

  @override
  _WidgetColumnServiceDatosState createState() => _WidgetColumnServiceDatosState();
}

class _WidgetColumnServiceDatosState extends State<WidgetColumnServiceDatos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:300,
      height:300,
      color:Colors.red,
        child:Stack(
          children: [
            Positioned(
              top:200,
              child:Container(
                child:Column(children: [
                    Text(widget.iconmodel.nameService),
                    Text("${widget.iconmodel.durationService}"),
                ],),
              ),

            ),
          ],
        ),
    );
  }
}