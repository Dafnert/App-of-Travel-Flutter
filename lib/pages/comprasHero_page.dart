import 'package:flutter/material.dart';

class ComprasHeroPage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String description;
  final DateTime date;
  //Añadimos estas variables para poder hacer la acción de eliminar
  final int index;
  final List<Map<String, String>> shopping;

  const ComprasHeroPage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.date,
    required this.index,
    required this.shopping,
  });
  @override
  State<ComprasHeroPage> createState() => _ComprasHeroPageState();
}

/*para poder usar las variables de StatefulWidget debemos de poner antes un 
widget.variable, ya que no esta definido en la clase _HeroPageState y la clase no 
sabría como acceder a los datos de StatefulWidget*/
class _ComprasHeroPageState extends State<ComprasHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Ponemos el nombre del producto
        //Este es un ejemplo, para poder usar la variable de la clase HeroPage
        title: Text(widget.name),
        backgroundColor: Colors.blueAccent,
      ),
      //Para que se pueda ir atrás y volver
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        //Pondremos lo que queramos que aparezca en la pantalla Hero
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            //Movimiento de imagen
            Hero(
              tag: widget.imageUrl,
              //Poner borde redondo en las imagenes
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //Nombre de la ciudad
            Text(
              widget.price,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            //Descripción de la ciudad
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
