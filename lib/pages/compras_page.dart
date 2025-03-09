import 'package:actividad3_flutter/main.dart';
import 'package:actividad3_flutter/pages/comprasHero_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:intl/intl.dart';

class ComprasPage extends StatefulWidget {
  final String userName;
  const ComprasPage({super.key, required this.userName});
  @override
  State<ComprasPage> createState() => _ComprasPageState();
}

class _ComprasPageState extends State<ComprasPage> {
  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    final local = Localizations.localeOf(context);
    final localeString = local.toString();
    final date = DateFormat.yMd(localeString);

    // Símbolo de moneda basado en el idioma seleccionado
    String current = '';
    if (localeString == 'en_US') {
      current = '\$'; // Dólar para EE.UU.
    } else if (localeString == 'ca_CAT' || localeString == 'es_ES') {
      current = '€'; // Euro para España y Cataluña
    } else {
      current = '€'; // Euro por defecto
    }

    final formatCurrency =
        NumberFormat.currency(locale: localeString, symbol: current);

    // Lista de compras con datos localizados
     final List<Map<String, dynamic>> shopping = [
      {
        "image": "https://images.samsung.com/is/image/samsung/assets/home/tablets/0303/SDSAC-8908-DSE-Spring-Weeklong-Book5-Pro-360-HP-KV-DT-1440x640.jpg?imwidth=2560",
        "name": texts.laptop,
        "price": formatCurrency.format(1200.00),
        "description": texts.laptop_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://m.media-amazon.com/images/I/71bs7yw8FXL._AC_SY450_.jpg",
        "name": texts.smartphone,
        "price": formatCurrency.format(800),
        "description": texts.smartphone_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://images.samsung.com/is/image/samsung/p6pim/es/sm-x920nzareub/gallery/es-galaxy-tab-s10-ultra-sm-x920-524881-sm-x920nzareub-thumb-543765126?216_216_PNG",
        "name": texts.tablet,
        "price": formatCurrency.format(500),
        "description": texts.tablet_description,
        "date":date.format(DateTime.now())
      },
      {
        "image": "https://storage.googleapis.com/catalog-pictures-carrefour-es/catalog/pictures/hd_510x_/8445045018597_1.jpg",
        "name": texts.smartwatch,
        "price":formatCurrency.format(300),
        "description": texts.smartwatch_description,
        "date":date.format(DateTime.now())
      },
      {
        "image": "https://www.energysistem.com/cdnassets/products/45305/principal_2000.jpg",
        "name": texts.headphones,
        "price":formatCurrency.format(150),
        "description": texts.headphones_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6RNpmlrfn_puN-vTRqAzZqFYE7y0EzJvnlw&s",
        "name": texts.camera,
        "price":formatCurrency.format(700),
        "description": texts.camera_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://example.com/image7.jpg",
        "name": texts.gaming_console,
        "price":formatCurrency.format(500),
        "description": texts.gaming_console_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://misura.s11.cdn-upgates.com/_cache/1/d/1d0069eb810fe736492c446f78e2c93d-qm24dfi-foto01.jpg",
        "name": texts.monitor,
        "price": formatCurrency.format(250),
        "description": texts.monitor_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://example.com/image9.jpg",
        "name": texts.keyboard,
        "price":formatCurrency.format(100),
        "description": texts.keyboard_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://example.com/image10.jpg",
        "name": texts.mouse,
        "price": formatCurrency.format(80.00),
        "description": texts.mouse_description,
        "date": date.format(DateTime.now())
      },
      {
        "image": "https://example.com/image11.jpg",
        "name": texts.external_hard_drive,
        "price":formatCurrency.format(150),
        "description": texts.external_hard_drive_description,
        "date": date.format(DateTime.now())
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: languageSelector(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: shopping.length,
          itemBuilder: (context, index) {
            return _buildPlaceCard(
              shopping[index]["image"]!,
              shopping[index]["name"]!,
              shopping[index]["price"].toString(),
              shopping[index]["description"]!,
              shopping[index]["date"].toString(),
              index,
              shopping,
            );
          },
        ),
      ),
    );
  }

  // Widget para construir las tarjetas de productos
  Widget _buildPlaceCard(
      String imageUrl,
      String name,
      String price,
      String description,
      String date,
      int index,
      List<Map<String, dynamic>> shopping) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComprasHeroPage(
                        imageUrl: imageUrl,
                        name: name,
                        price: price,
                        description: description,
                        date: DateTime.now(),
                        index: index,
                        shopping: const []),
                  ),
                );
              },
              child: Hero(
                tag: imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 150, // Ajusta según prefieras
                    height: 100, // Ajusta según prefieras
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(221, 108, 106, 106),
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 88, 83, 83),
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
