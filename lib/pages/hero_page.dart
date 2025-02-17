import 'package:actividad3_flutter/global.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final String population;
  //Añadimos estas variables para poder hacer la acción de eliminar
  final int index;
  final List<Map<String, String>> places;

  const HeroPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.population,
    required this.index,
    required this.places,
  });
  @override
  State<HeroPage> createState() => _HeroPageState();
}

/*para poder usar las variables de StatefulWidget debemos de poner antes un 
widget.variable, ya que no esta definido en la clase _HeroPageState y la clase no 
sabría como acceder a los datos de StatefulWidget*/
class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Ponemos el nombre del País
        //Este es un ejemplo, para poder usar la varibale de la clase HeroPage
        title: Text(widget.title),
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
              widget.subtitle,
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
            const SizedBox(height: 10),
            //Añadimos el dialog
              TextButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Delete city',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    content: const Text(
                        'Are you sure you want to delete this city?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          //Lo usaremos para cambiar el estado
                          setState(() {
                            //Se eliminará el lugar
                            places.removeAt(widget.index);
                          });
                          Navigator.pop(context, 'OK');
                          //Para que vuelva a la pantalla home cuando le de al OK
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
