import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles Adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          childrenPadding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.green,
                width: 0)),
          collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Colors.green,
                width: 1.0)),
          //collapsedBackgroundColor: Colors.green,
          backgroundColor: const Color.fromARGB(255, 233, 247, 234),
          enabled: true,
          children: [

            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),

            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar por bote'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),

            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar por avion'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),

            RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Viajar por submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),
          ],
        ),

        ExpansionTile(
          title: const Text('Tiempo de comida'),
          children: [

            CheckboxListTile(
              title: const Text('Desayuno?'),
              value: wantsBreakfast,
              onChanged: (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              })
            ),

            CheckboxListTile(
              title: const Text('Almuerzo?'),
              value: wantsLunch,
              onChanged: (value) => setState(() {
                wantsLunch = !wantsLunch;
              })
            ),

            CheckboxListTile(
              title: const Text('Cena?'),
              value: wantsDinner,
              onChanged: (value) => setState(() {
                wantsDinner = !wantsDinner;
              })
            )
            
          ],  
        )
      ],
    );
  }
}
