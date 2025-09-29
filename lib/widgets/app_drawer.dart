import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.indigo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_camera_back,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(height: 12),
                Text(
                  'VideoEdit Pro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Professional Video Services',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            Icons.home,
            'Home',
            '/',
            'Explore our services',
          ),
          _buildDrawerItem(
            context,
            Icons.video_library,
            'Services & Portfolio',
            '/services',
            'View our work and pricing',
          ),
          const Divider(),
          _buildDrawerItem(
            context,
            Icons.star_border,
            'Basic Demo',
            '/hello-stateless',
            'StatelessWidget example',
          ),
          _buildDrawerItem(
            context,
            Icons.analytics,
            'Studio Stats',
            '/hello-stateful',
            'StatefulWidget with counters',
          ),
          _buildDrawerItem(
            context,
            Icons.phone_android,
            'Platform Demo',
            '/platform-demo',
            'Material vs Cupertino widgets',
          ),
          const Divider(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Need Help?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Contact us at hello@videoeditpro.com',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
    String subtitle,
  ) {
    final isCurrentRoute = ModalRoute.of(context)?.settings.name == route;

    return ListTile(
      leading: Icon(
        icon,
        color: isCurrentRoute ? Colors.deepPurple : Colors.grey.shade600,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isCurrentRoute ? FontWeight.w600 : FontWeight.normal,
          color: isCurrentRoute ? Colors.deepPurple : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12),
      ),
      selected: isCurrentRoute,
      selectedTileColor: Colors.deepPurple.shade50,
      onTap: () {
        Navigator.pop(context);
        if (!isCurrentRoute) {
          if (route == '/') {
            Navigator.pushReplacementNamed(context, route);
          } else {
            Navigator.pushNamed(context, route);
          }
        }
      },
    );
  }
}
