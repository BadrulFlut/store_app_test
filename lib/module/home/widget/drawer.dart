import 'package:flutter/material.dart';
import 'package:store_app_v1/core.dart';

Drawer drawer(BuildContext context, HomeController controller) {
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Moch Badrul Laksamanadin"),
          accountEmail: Text("mochbadrullaksamanadin@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Home"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip),
          title: const Text("Privacy Policy"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
          ),
          title: const Text("Logout"),
          onTap: () {
            controller.deleteToken();
          },
        )
      ],
    ),
  );
}
