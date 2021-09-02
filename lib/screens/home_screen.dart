import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/atractivo_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final atractivosService = Provider.of<AtractivosService>(context);

    //if (AtractivosService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Atractivos Turísticos'),
      ),
      body: ListView.builder(
          itemCount: AtractivosService.atractivos.length,
          itemBuilder: (BuildContext context, int index) =>
              AtractivoCard(atractivo: AtractivosService.atractivos[index])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
