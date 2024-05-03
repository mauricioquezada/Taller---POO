import 'dart:io';

class Libro {
  String titulo;
  String autor;
  double precio;
  int cantidadStock;

  // Constructor
  Libro(this.titulo, this.autor, this.precio, this.cantidadStock);

  // Método para comprar copias del libro
  void comprar(int cantidadComprar) {
    if (cantidadComprar <= 0) {
      print('Error: La cantidad de copias a comprar debe ser mayor que cero.');
      return;
    }

    if (cantidadComprar > cantidadStock) {
      print('Error: No hay suficientes copias disponibles en stock.');
      return;
    }

    cantidadStock -= cantidadComprar;
    print('Compra realizada: $cantidadComprar copias de "$titulo"');
    print('Stock actualizado: $cantidadStock copias disponibles');
  }

  // Método para mostrar información del libro
  void mostrarInformacion() {
    print('Información del libro:');
    print('Título: $titulo');
    print('Autor: $autor');
    print('Precio: \$${precio.toStringAsFixed(2)}');
    print('Cantidad en stock: $cantidadStock');
  }
}

void main() {
  // Solicitar al usuario los detalles del libro
  print('Ingrese el título del libro:');
  String titulo = stdin.readLineSync()!;
  
  print('Ingrese el autor del libro:');
  String autor = stdin.readLineSync()!;
  
  double precio = 0;
  while (true) {
    print('Ingrese el precio del libro:');
    String precioStr = stdin.readLineSync()!;
    try {
      precio = double.parse(precioStr);
      if (precio <= 0) {
        print('Error: El precio debe ser mayor que cero.');
      } else {
        break;
      }
    } catch (e) {
      print('Error: Por favor ingrese un valor numérico válido.');
    }
  }
  
  
  int cantidadStock = 0;
  while (true) {
    print('Ingrese la cantidad en stock del libro:');
    String stockStr = stdin.readLineSync()!;
    try {
      cantidadStock = int.parse(stockStr);
      if (cantidadStock < 0) {
        print('Error: La cantidad en stock no puede ser negativa.');
      } else {
        break;
      }
    } catch (e) {
      print('Error: Por favor ingrese un valor numérico válido.');
    }
  }

  // Crear una instancia de la clase Libro
  Libro libro = Libro(titulo, autor, precio, cantidadStock);

  // Mostrar información del libro
    
  libro.mostrarInformacion();

  // Realizar una compra de copias del libro
while (true) {
  print('\n¿Qué acción desea realizar?');
  print('1. Comprar copias del libro');
  print('2. Mostrar información del libro');
  print('3. Salir');
  
  // Solicitar al usuario su elección
  String opcionStr = stdin.readLineSync()!;
  
  switch (opcionStr) {
    case '1':
      print('\n¿Cuántas copias desea comprar?');
      String cantidadStr = stdin.readLineSync()!;
      try {
        int cantidadComprar = int.parse(cantidadStr);
        libro.comprar(cantidadComprar);
      } catch (e) {
        print('Error: Por favor ingrese un valor numérico válido.');
      }
      break;
    case '2':
      libro.mostrarInformacion();
      break;
    case '3':
      print('Saliendo del programa...');
      return;
    default:
      print('Opción inválida. Por favor, elija una opción válida.');
      break;
  }
}
}