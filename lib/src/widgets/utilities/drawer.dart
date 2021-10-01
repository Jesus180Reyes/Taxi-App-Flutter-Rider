import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          SizedBox(
            height: 165,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  ),
              child: InfoProfile(),
            ),
          ),
          Divider(
            thickness: 1,
            height: 10,
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text(
              'Mis Viajes',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Mi Perfil',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.directions),
            title: Text(
              'Mis Direcciones',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Cerrar Sesion',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoProfile extends StatelessWidget {
  const InfoProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/user_icon.png',
          height: 65,
          width: 65,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Profile Name',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text('Ver Perfil'),
          ],
        )
      ],
    );
  }
}
