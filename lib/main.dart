import 'package:flutter/material.dart';

void main() {
  runApp(const MiExamen());
}

class Empleado {
  final int idEmpleado; // Nuevo atributo: Id_Empleado
  final String nombre; // Atributo: Nombre
  final String direccion; // Nuevo atributo: Direccion

  Empleado({
    required this.idEmpleado,
    required this.nombre,
    required this.direccion,
  });

  // Método para convertir el empleado en un mapa
  Map<String, String> toMap() {
    return {
      'Id_Empleado': idEmpleado.toString(),
      'Nombre': nombre,
      'Direccion': direccion,
    };
  }
}

class MiExamen extends StatelessWidget {
  const MiExamen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nancy Lara Baca 1225'),
          centerTitle: true,
          titleTextStyle:
              const TextStyle(color: Color(0xffffffff), fontSize: 25),
          backgroundColor: Color(0xff294a64),
        ),
        body: EmpleadosScreen(),
      ),
    );
  }
}

class EmpleadosScreen extends StatelessWidget {
  // Lista de 5 empleados con los nuevos atributos
  final List<Empleado> empleados = [
    Empleado(idEmpleado: 1, nombre: 'Juan Pérez', direccion: 'Calle 123'),
    Empleado(idEmpleado: 2, nombre: 'Ana Gómez', direccion: 'Avenida 456'),
    Empleado(idEmpleado: 3, nombre: 'Carlos López', direccion: 'Boulevard 789'),
    Empleado(idEmpleado: 4, nombre: 'Laura Díaz', direccion: 'Callejón 321'),
    Empleado(idEmpleado: 5, nombre: 'Pedro Sánchez', direccion: 'Avenida 654'),
  ];

  @override
  Widget build(BuildContext context) {
    // Convertir la lista de empleados a mapas
    List<Map<String, String>> empleadosMap =
        empleados.map((e) => e.toMap()).toList();

    // Lista de colores personalizados para los contenedores
    List<Color> containerColors = [
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.purple.shade100,
      Colors.red.shade100,
    ];

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: empleadosMap
              .asMap()
              .map((index, empleado) {
                // Crear un contenedor para cada empleado con color personalizado
                return MapEntry(
                  index,
                  Padding(
                    padding: EdgeInsets.only(
                        top: index == 0
                            ? 8.0
                            : 4.0), // Menos separación entre contenedores
                    child: Container(
                      width: 300, // Tamaño fijo
                      height: 130, // Tamaño fijo (más pequeño)
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 4), // Menos margen
                      decoration: BoxDecoration(
                        color: containerColors[
                            index], // Asignar color distinto según el índice
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.1), // Sombra más suave
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: empleado.entries.map((entry) {
                          // Aplicar negritas solo al Id_Empleado
                          final bool isId = entry.key == 'Id_Empleado';
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              '${entry.key}: ${entry.value}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: isId
                                    ? FontWeight.bold
                                    : FontWeight.w500, // Negritas para el Id
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              })
              .values
              .toList(),
        ),
      ),
    );
  }
}
