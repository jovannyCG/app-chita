import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const RunnerApp());
}

class RunnerApp extends StatelessWidget {
  const RunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos GoogleFonts para tener una tipografía más parecida al diseño.
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Runner Safety App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFDE03), // Un color amarillo para detalles
        scaffoldBackgroundColor: const Color(0xFF121212), // Fondo oscuro principal
        cardColor: const Color(0xFF1E1E1E), // Color para las tarjetas
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFFDE03)),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice para el BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Permite hacer scroll si el contenido no cabe en la pantalla
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SECCIÓN DE BIENVENIDA ---
              const Text(
                'Hola Corredor',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Mantente seguro en tu próxima carrera',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 40),

              // --- BOTÓN DE SOS ---
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Lógica para la alerta de emergencia
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Alerta de emergencia activada')),
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFE4A49), // Color rojo para el botón
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(92, 254, 74, 73),
                              blurRadius: 20,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'SOS',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Toca para alerta de emergencia',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // --- GRID DE OPCIONES ---
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true, // Para que el GridView ocupe solo el espacio necesario
                physics: const NeverScrollableScrollPhysics(), // Deshabilita el scroll del GridView
                children: const [
                  InfoCard(
                    icon: Icons.route_outlined,
                    title: 'Mis Rutas',
                    subtitle: 'Ver rutas guardadas',
                  ),
                  InfoCard(
                    icon: Icons.group_outlined,
                    title: 'Contactos',
                    subtitle: 'Contactos de emergencia',
                  ),
                  InfoCard(
                    icon: Icons.notifications_active_outlined,
                    title: 'Alertas',
                    subtitle: 'Actividad reciente',
                  ),
                  InfoCard(
                    icon: Icons.share_location_outlined,
                    title: 'Compartir Ubicación',
                    subtitle: 'Ubicación en tiempo real',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // --- BARRA DE NAVEGACIÓN INFERIOR ---
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Contactos',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Muestra todos los labels
        backgroundColor: Theme.of(context).cardColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

// --- WIDGET REUTILIZABLE PARA LAS TARJETAS DEL GRID ---
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36,
              color: Theme.of(context).primaryColor,
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}