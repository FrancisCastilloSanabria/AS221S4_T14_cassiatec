import 'package:flutter/material.dart';
import 'home.dart'; // Asegúrate de importar correctamente el archivo home.dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cassiatec',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: const Color.fromRGBO(244, 67, 54, 1),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage("assets/InsigniaSRC.png"),
              width: 200,
              height: 200,
            ),
            const Text(
              'Correo: holamundo@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Contraseña: 123',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(
                  Icons.email,
                  size: 30, // Ajusta el tamaño del icono según tus necesidades
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(
                  Icons.lock, // Puedes cambiar a otro icono si lo deseas
                  size: 24, // Ajusta el tamaño del icono según tus necesidades
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            const Text(
              'You are new?',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(244, 67, 54, 1),
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para verificar las credenciales
                // Ejemplo: Si las credenciales son válidas, navegar a la página de inicio
                if (_emailController.text == 'holamundo@gmail.com' &&
                    _passwordController.text == '123') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(244, 67, 54, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
