import 'package:chita_app/main.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(20),
              children: [
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rutas',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                _RouteCard(
                  imagePath: 'assets/parque_la_encantada.jpg',
                  title: 'Parque La Encantada',
                  distance: '1.2 km',
                ),
                const SizedBox(height: 20),
                _RouteCard(
                  imagePath: 'assets/parque_sierra_de_alica.jpg',
                  title: 'Parque Sierra de Álica',
                  distance: '2.5 km',
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.space_dashboard_outlined),
                label: const Text('Mis Espacios'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RouteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String distance;

  const _RouteCard({
    required this.imagePath,
    required this.title,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      clipBehavior: Clip.antiAlias, // Para que la imagen respete los bordes redondeados
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  distance,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Ver en Mapa'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}