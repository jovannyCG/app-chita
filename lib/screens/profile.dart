import 'package:flutter/material.dart';
import '../main.dart'; // Importamos para usar los colores globales

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Estado para el switch de notificaciones
  bool _notificationsEnabled = true;
  void showSosConfirmationDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            '¿Eliminar cuenta?',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Esto acción es permanente y no se puede deshacer. perderás todos tus datos, conactos y configuración.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Enviar Alerta'),
                  onPressed: () {
                    // Aquí iría la lógica para enviar la alerta
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          children: [
            // --- SECCIÓN SUPERIOR: AVATAR Y EMAIL ---
            const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: cardColor,
                  child: Icon(Icons.person, size: 40, color: Colors.white70),
                ),
                SizedBox(height: 12),
                Text(
                  'usuario@chita.app',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- SECCIÓN: INFORMACIÓN PERSONAL ---
            const _SectionTitle(title: 'Información Personal'),
            const SizedBox(height: 16),
            const _CustomTextField(
              labelText: 'Nombre Completo',
              hintText: 'Ingresa tu nombre',
            ),
            const SizedBox(height: 16),
            const _CustomTextField(
              labelText: 'Email',
              initialValue: 'usuario@chita.app',
              enabled: false, // El email no se puede editar
            ),
            const SizedBox(height: 16),
            const _CustomTextField(
              labelText: 'Número de Teléfono',
              hintText: 'Ingresa tu número de teléfono',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Guardar Cambios'),
            ),
            const SizedBox(height: 30),

            // --- SECCIÓN: CONFIGURACIÓN ---
            const _SectionTitle(title: 'Configuración'),
            const SizedBox(height: 8),
            _SettingsTile(
              title: 'Notificaciones Push',
              subtitle: 'Recibir alertas y actualizaciones',
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
                activeColor: primaryColor,
                activeTrackColor: primaryColor.withOpacity(0.5),
              ),
            ),
            const _SettingsTile(
              title: 'Cambiar Contraseña',
              subtitle: 'Actualiza tu contraseña de seguridad',
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            const _SettingsTile(
              title: 'Acerca de',
              subtitle: 'Versión de la app e información',
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // --- SECCIÓN: CUENTA ---
            const _SectionTitle(title: 'Cuenta'),
            const SizedBox(height: 16),
            _AccountActionButton(
              text: 'Cerrar Sesión',
              icon: Icons.logout,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _AccountActionButton(
              text: 'Eliminar Cuenta',
              icon: Icons.delete_outline,
              textColor: accentColor, // Color rojo para acción destructiva
              onTap: () => showSosConfirmationDeleteAccountDialog(context),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizable para los títulos de sección
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Widget reutilizable para los campos de texto
class _CustomTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final bool enabled;
  final TextInputType keyboardType;

  const _CustomTextField({
    required this.labelText,
    this.hintText,
    this.initialValue,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          keyboardType: keyboardType,
          style: TextStyle(color: enabled ? Colors.white : Colors.grey[500]),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}

// Widget reutilizable para las opciones de configuración
class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: trailing,
    );
  }
}

// Widget reutilizable para los botones de la sección "Cuenta"
class _AccountActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color textColor;

  const _AccountActionButton({
    required this.text,
    required this.icon,
    required this.onTap,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: textColor != Colors.white ? Border.all(color: cardColor) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}