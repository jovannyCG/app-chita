import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // --- TÍTULO DE LA PANTALLA ---
              Text(
                'conntactos de emergencia',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              
              // --- MENSAJE CENTRAL ---
              // Expanded asegura que el contenido se centre verticalmente
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Para que la columna no ocupe todo el espacio
                    children: [
                      Icon(
                        Icons.phone_in_talk,
                        color: Colors.grey[600],
                        size: 50,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'No hay contactos agregados',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Agrega contactos de emergencia para recibir\nalertas cuando necesites ayuda',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}