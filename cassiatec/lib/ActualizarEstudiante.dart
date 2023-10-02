import 'package:cassiatec/AgregarEstudiante.dart';
import 'package:cassiatec/home.dart';
import 'package:cassiatec/main.dart';
import 'package:cassiatec/registrarAsistencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(const StudentApp());

class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  _StudentAppState createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  final TextEditingController _searchController = TextEditingController();
  List<String> items = [
    'PRUEBA BUSCAR',
    'Hola mundo',
    '1234',
    // Agrega tus datos de estudiantes aquí
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACTUALIZAR ESTUDIANTE'),
        backgroundColor: const Color(0xFFFF1100),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const resgistroAsistenciaPage()),
          );
        },
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
            tileColor: const Color.fromRGBO(255, 175, 0, 1),
            onTap: () {
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
                  title: const Text('Cerra sesion'),
                   leading: const Icon(Icons.logout),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  filteredItems = items
                      .where((item) =>
                          item.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Buscar estudiante',
                hintText: 'Ingrese el nombre del estudiante...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
