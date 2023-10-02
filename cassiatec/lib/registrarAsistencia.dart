import 'package:cassiatec/ActualizarEstudiante.dart';
import 'package:cassiatec/AgregarEstudiante.dart';
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
        backgroundColor: const Color.fromRGBO(
            255, 17, 0, 1), // Cambia el color del AppBar aquí
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
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 0, 0, 1),
              ),
              child: Image.asset(
                "assets/CASSIATECLOGO.png",
                fit: BoxFit.contain,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Registrar asistencia'),
              tileColor: const Color.fromRGBO(255, 174, 0, 1),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Registro anual'),
              onTap: () {
                // Acción cuando se toca la opción "Registro anual"
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.add),
              title: const Text('Agregar'),
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Agregar Personal'),
                  onTap: () {
                    // Acción cuando se toca la opción "Agregar Personal"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text('Agregar Estudiante'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AgregarEstudiante(),
                      ),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Actualizar'),
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Actualizar Personal'),
                  onTap: () {
                    // Acción cuando se toca la opción "Actualizar Personal"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('Actualizar Estudiante'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentApp()),
                    );
                  },
                ),
              ],
            ),
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 1,
            ),
            ExpansionTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar sesión'),
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Ajustes'),
                  onTap: () {
                    // Acción cuando se toca la opción "Ajustes"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Perfil'),
                  onTap: () {
                    // Acción cuando se toca la opción "Perfil"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Cerra sesion'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                              '¿Estás seguro de que deseas cerrar sesión?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Cierra el cuadro de diálogo
                              },
                            ),
                            TextButton(
                              child: const Text('Cerrar sesión'),
                              onPressed: () {
                                // Agrega la lógica de cierre de sesión aquí
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage()),
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
            const SizedBox(height: 6),
            const Text(
              'Estamos en registro de asistencia',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Estamos en registro de asistencia :v',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
