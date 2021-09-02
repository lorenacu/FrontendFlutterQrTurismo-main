import 'package:flutter/material.dart';
import 'package:productos_app/models/atractivo.dart';
//import 'package:turismoqr/models/atractivo.dart';

class AtractivoCard extends StatelessWidget {
  final Atractivo atractivo;

  const AtractivoCard({Key? key, required this.atractivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        width: double.infinity,
        height: 550,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            _BackgroundImage(),
            _AtractivoDetails(
              nombreAtractivo: atractivo.nombreAtractivo,
              descripcionAtractivo: atractivo.descripcionAtractivo,
            ),
            Positioned(bottom: 0, left: 0, child: _PlayButon()),
            Positioned(bottom: 0, right: 0, child: _VerMasButton())
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 6), blurRadius: 10)
          ]);
}

class _VerMasButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Ver más',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25), topLeft: Radius.circular(25))),
    );
  }
}

class _PlayButon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.arrow_right,
            color: Colors.white,
            size: 60.0,
          ),
          Text(
            'Play',
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      width: 110,
      height: 70,
      //alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), topRight: Radius.circular(25))),
    );
  }
}

// ignore: must_be_immutable
class _AtractivoDetails extends StatelessWidget {
  final String nombreAtractivo;
  final String descripcionAtractivo;

  _AtractivoDetails(
      {required this.nombreAtractivo, required this.descripcionAtractivo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: 40,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombreAtractivo,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              descripcionAtractivo,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}

class _BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 550,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/* class AtractivoList extends StatelessWidget {
  final List<Atractivo> atractivos;

  AtractivoList({required this.atractivos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: atractivos.length,
      itemBuilder: (context, index) {
        final atractivo = atractivos[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("${atractivo.nombreAtractivo}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        );
      },
    );
  }
} */
