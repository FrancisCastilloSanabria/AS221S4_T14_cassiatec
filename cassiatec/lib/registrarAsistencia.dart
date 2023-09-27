import 'package:cassiatec/home.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Asegúrate de importar correctamente el archivo home.dart

class resgistroAsistenciaPage extends StatelessWidget {
  const resgistroAsistenciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar asistencia'),
        backgroundColor:
            Color.fromRGBO(255, 17, 0, 1), // Cambia el color del AppBar aquí
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
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              child: Text('Dashboard'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Registrar asistencia'),
              tileColor: Color.fromRGBO(255, 175, 0, 1),
              onTap: () {
                // Acción cuando se toca la opción 2
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
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
              'Estamos en registro de asistencia',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Estamos en registro de asistencia :v',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
