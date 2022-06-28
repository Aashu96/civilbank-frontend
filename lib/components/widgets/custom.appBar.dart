// ignore_for_file: use_key_in_widget_constructors

import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:flutter/material.dart';
class LogOutButton extends StatelessWidget {
  const LogOutButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () {
              DeleteCache.deleteKey(
                  'jwt', Navigator.of(context).pushNamed('/welcome'));
            });
  }
}