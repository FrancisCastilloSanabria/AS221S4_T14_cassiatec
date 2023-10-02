import 'package:cassiatec/ActualizarEstudiante.dart';
import 'package:cassiatec/home.dart';
import 'package:cassiatec/main.dart';
import 'package:cassiatec/registrarAsistencia.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgregarEstudiante extends StatefulWidget {
  const AgregarEstudiante({Key? key}) : super(key: key);

  @override
  _AgregarEstudianteState createState() => _AgregarEstudianteState();
}

class _AgregarEstudianteState extends State<AgregarEstudiante> {
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  String? _selectedTipoDocumento;
  final TextEditingController _numeroDocumentoController =
      TextEditingController();
  DateTime _dateSelected = DateTime.now();
  String? _selectedGrado;
  String? _selectedSeccion;
  String? _selectedTurno;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _apoderadoController = TextEditingController();
  final TextEditingController _ubigeoController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateSelected,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _dateSelected) {
      setState(() {
        _dateSelected = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGREGAR ESTUDIANTE'),
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
                  tileColor: const Color.fromRGBO(255, 175, 0, 1),
                  onTap: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icono-estudiante.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: null,
              ),
              TextFormField(
                controller: _nombresController,
                decoration: const InputDecoration(labelText: 'NOMBRES'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _apellidosController,
                decoration: const InputDecoration(labelText: 'APELLIDOS'),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedTipoDocumento,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTipoDocumento = newValue;
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'TIPO DE DOCUMENTO'),
                items: <String>['DNI', 'CNE']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _numeroDocumentoController,
                decoration:
                    const InputDecoration(labelText: 'NUMERO DE DOCUMENTO'),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: InputDecorator(
                  decoration:
                      const InputDecoration(labelText: 'FECHA DE NACIMIENTO'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        // ignore: unnecessary_null_comparison
                        _dateSelected != null
                            ? DateFormat.yMMMd().format(_dateSelected)
                            : 'Seleccione una fecha',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedGrado,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGrado = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'GRADO'),
                items: <String>[
                  '1 SECUNDARIA',
                  '2 SECUNDARIA',
                  '3 SECUNDARIA',
                  '4 SECUNDARIA',
                  '5 SECUNDARIA'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedSeccion,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSeccion = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'SECCION'),
                items: <String>[
                  'SECCION "A"',
                  'SECCION "B"',
                  'SECCION "C"',
                  'SECCION "D"',
                  'SECCION "E"'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                value: _selectedTurno,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTurno = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'TURNO'),
                items: <String>['MAÑANA', 'TARDE']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'EMAIL'),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _apoderadoController,
                decoration:
                    const InputDecoration(labelText: 'NUMERO DE APODERADO'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _ubigeoController,
                decoration: const InputDecoration(labelText: 'CODIGO UBIGEO'),
              ),
              const SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    15.0), // Ajusta el radio según tu preferencia
                child: TextButton(
                  onPressed: () {
                    // Acción para agregar el estudiante
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 129, 0),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Agregar Estudiante',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
