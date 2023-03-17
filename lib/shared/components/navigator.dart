import 'package:flutter/material.dart';

navigateTo( context,screen) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

navigateAndReplace( context,screen) =>
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => screen));

navigateAndFinished( context,screen) =>
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => screen),(route) => false);