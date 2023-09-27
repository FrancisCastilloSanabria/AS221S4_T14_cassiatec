import 'package:cassiatec/registrarAsistencia.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Asegúrate de importar correctamente el archivo home.dart

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor:
            Color.fromRGBO(244, 67, 54, 1), // Cambia el color del AppBar aquí
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(244, 67, 54, 1),
                image: DecorationImage(
                  image: AssetImage("assets/logoMovil.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Home'),
              tileColor: Color.fromRGBO(255, 174, 0, 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Registrar asistencia'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => resgistroAsistenciaPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Registro anual'),
              onTap: () {
                // Acción cuando se toca la opción 2
              },
            ),
            ExpansionTile(
              title: Text('Agregar'),
              children: [
                ListTile(
                  title: Text('Agregar Personal'),
                  onTap: () {
                    // Acción cuando se toca la opción 2.1
                  },
                ),
                ListTile(
                  title: Text('Agregar Estudiante'),
                  onTap: () {
                    // Acción cuando se toca la opción 2.2
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Actualizar'),
              children: [
                ListTile(
                  title: Text('Actualizar Personal'),
                  onTap: () {
                    // Acción cuando se toca la opción 2.1
                  },
                ),
                ListTile(
                  title: Text('Actualizar Estudiante'),
                  onTap: () {
                    // Acción cuando se toca la opción 2.2
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 5,
            ),
            ExpansionTile(
              title: Text('Cerrar sesión'),
              children: [
                ListTile(
                  title: Text('Ajustes'),
                  onTap: () {
                    // Acción cuando se toca la opción 2.1
                  },
                ),
                ListTile(
                  title: Text('Perfil'),
                  onTap: () {
                    // Acción cuando se toca la opción 2.2
                  },
                ),
                ListTile(
                  title: Text('Cerra sesion'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                              '¿Estás seguro de que deseas cerrar sesión?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Cierra el cuadro de diálogo
                              },
                            ),
                            TextButton(
                              child: Text('Cerrar sesión'),
                              onPressed: () {
                                // Agrega la lógica de cierre de sesión aquí
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh-gpELJsSszgfmmVCtgaPDLpu2QqAeVnQNwH8BSaRjucTU5SFXAdGyEJVkk4xLsyrhadnw9t5cY3_ZYDwFVWPDHYKDco-IpsTf9kXqIe2xOVYz-k0rxl8PdD9IB9UFzwUnJ-iXwiE__hvzG1j98rZCz8IdVQ3OTZ70sfL97N977tsOUffRle3GlUAB/s320/Insignia%20SRC.png'),
            SizedBox(height: 6),
            Text(
              'HOLA SOY UN TEXTO',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'HOLA SOY UN SEGUNDO TEXTO :v',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
