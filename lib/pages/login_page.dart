import 'package:actividad3_flutter/routing/app_routes.dart';
import 'package:actividad3_flutter/routing/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      home: const MyCustomForm(),
      //Rutas para el splash
      routes: appRoutes,
      initialRoute: Routes.splash,
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  //Varibale globl key
  final _formKey = GlobalKey<FormState>();
//Para el icono del ojo
  bool _isPasswordVisible = false;
  //Variables para poder hacer la validación
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png',
                  width: 250,
                  height: 250,
                ),
                //TextField del username
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  maxLength: 4,
                  decoration: const InputDecoration(
                    //Utilizamos este método para que el borde sea redondo
                    border: OutlineInputBorder(),
                    //Texto que saldrá en el textfield
                    hintText: 'Username',
                  ),
                  //Validación que si el campo es nulo o esta vacío saldrá el mensaje
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      //Mensaje si se cumplen las anteriores condiciones
                      return 'Please enter a username';
                    }
                    //En el caso, que el usuario no haya puesto 'user'...
                    if (value != 'user') {
                      //Saltará este mensaje
                      return 'Invalid username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    username = value;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    //Utilizamos este método para que el borde sea redondo
                    border: const OutlineInputBorder(),
                    //Texto que saldrá en el textfield
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      //Si le dan al icono
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    //Validación que si el campo es nulo o esta vacío saldrá el mensaje
                    if (value == null || value.isEmpty) {
                       //Mensaje si se cumplen las anteriores condiciones
                      return 'Please enter a password';
                    }
                    //En el caso que no cumpla con el regex saldrá el siguiente mensaje
                    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{7,}$')
                        .hasMatch(value)) {
                          //En la que advierta que la contraseña deba de cumplir los requisitos
                      return 'Password must be at least 9 characters long and contain letters and numbers';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 16.0),
                //Texto que se le ha olvidado la contraseña
                const Text(
                  "Forgot password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16.0),
                //Botón de login
                ElevatedButton(
                  //Estilo del botón
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    //Tamaño
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 100,
                    ),
                  ),
                  //Validación en el botón del login
                  onPressed: () {
                    //Si el usuario pone las credenciales correctas pasará a la pantalla Home
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (username == 'user' && password == 'pass12345') {
                        //pushReplacementNamed para que el usuario no pueda volver atrás después de hacer el login
                        Navigator.pushReplacementNamed(context, Routes.shopping,
                            arguments: username);
                      } else {
                        //En el caso que el usuario ponga mal als credenciales saltará un mensaje
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    }
                  },
                  //El texto del botón
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16.0),
                //Texto
                const Text(
                  "New User? Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
