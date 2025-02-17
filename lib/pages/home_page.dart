import 'package:actividad3_flutter/global.dart';
import 'package:actividad3_flutter/pages/hero_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //Creamos esta variable para que se pase la credencial del campo 'username'
  final String userName;
  const HomePage({super.key, required String title, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "¡Hola, ${widget.userName}!"
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return _buildPlaceCard(
                places[index]["image"]!,
                places[index]["title"]!,
                places[index]["subtitle"]!,
                places[index]["description"]!,
                places[index]["population"]!,
                index);
          },
        ),
      ),
    );
  }

//Le pasamos los valores del ListMap para poder ponerles estilos más adelante del código
  Widget _buildPlaceCard(String imageUrl, String title, String subtitle,
      String description, String population, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      //Ponerle el borod redondo
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // Agrega sombra para dar efecto de elevación
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //Es un widget que detecta las interacciones del usuario y que responde
            //sin necesidad de un botón.
            GestureDetector(
              onTap: () {
                // Cuando el usuario toca el widget, se dirige a la otra pantalla.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //Contruye la pantalla hero_page
                    builder: (context) => HeroPage(
                        imageUrl: imageUrl,
                        title: title,
                        subtitle: subtitle,
                        description: description,
                        population: population,
                         index: index, places: const [],),
                  ),
                );
              },
              //Defecto de movimiento a la imagen
              child: Hero(
                tag: imageUrl,
                //Widget que redondea los bordes de la imagen
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Le ponemos estilo a los textos que pusimos en el ListMap
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(221, 108, 106, 106),
              ),
            ),
            //Le ponemos subtitulo a los textos que pusimos en el ListMap
            Text(
              subtitle,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 88, 83, 83),
                  fontStyle: FontStyle.italic),
            ),
            //Texto de population
            Text(
              population,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //Los iconos de estrellas junto su color que hemos decidido
              children: [
                Icon(Icons.star,
                    color: Color.fromARGB(255, 230, 232, 69), size: 20),
                Icon(Icons.star,
                    color: Color.fromARGB(255, 251, 255, 0), size: 20),
                Icon(Icons.star,
                    color: Color.fromARGB(255, 251, 255, 0), size: 20),
                Icon(Icons.star_half,
                    color: Color.fromARGB(255, 251, 255, 0), size: 20),
                Icon(Icons.star_border,
                    color: Color.fromARGB(255, 251, 255, 0), size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
