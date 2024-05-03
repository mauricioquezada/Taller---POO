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
//
void main() {
  List<Libro> libros = []; // Lista para almacenar los libros ,dart list adentro varios objetos basándome en el constructor incial

  while (true) {
    print('\n¿Qué acción desea realizar?');
    print('1. Agregar un nuevo libro');
    print('2. Comprar copias de un libro');
    print('3. Mostrar información de un libro');
    print('4. Salir');
  
    // Solicitar al usuario su elección
    String opcionStr = stdin.readLineSync()!;
  
    switch (opcionStr) {
      case '1':
        print('\nIngrese el título del libro:');
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
        
        // Crear una instancia de la clase Libro y agregarla a la lista
        libros.add(Libro(titulo, autor, precio, cantidadStock));
        print('Libro agregado exitosamente.');
        break;
      
      case '2':
        // Mostrar los títulos de los libros disponibles
        print('\nLibros disponibles:');
        for (int i = 0; i < libros.length; i++) {
          print('$i. ${libros[i].titulo}');
        }
        
        print('\nSeleccione el número del libro para comprar:');
        String libroIndexStr = stdin.readLineSync()!;
        int libroIndex = int.parse(libroIndexStr);
        
        if (libroIndex >= 0 && libroIndex < libros.length) {
          print('¿Cuántas copias desea comprar?');
          String cantidadStr = stdin.readLineSync()!;
          try {
            int cantidadComprar = int.parse(cantidadStr);
            libros[libroIndex].comprar(cantidadComprar);
          } catch (e) {
            print('Error: Por favor ingrese un valor numérico válido.');
          }
        } else {
          print('Error: Índice de libro inválido.');
        }
        break;
      
      case '3':
        // Mostrar los títulos de los libros disponibles
        print('\nLibros disponibles:');
        for (int i = 0; i < libros.length; i++) {
          print('$i. ${libros[i].titulo}');
        }
        
        print('\nSeleccione el número del libro para mostrar información:');
        String libroIndexStr = stdin.readLineSync()!;
        int libroIndex = int.parse(libroIndexStr);
        
        if (libroIndex >= 0 && libroIndex < libros.length) {
          libros[libroIndex].mostrarInformacion();
        } else {
          print('Error: Índice de libro inválido o erroeneo .');
        }
        break;
      
      case '4':
        print('Saliendo del compra tu libro en linea ...');
        return;
        
      default:
        print('Opción inválida. Por favor, elija una opción válida.');
        break;
    }
  }
}
