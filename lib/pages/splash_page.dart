
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone_bloc/bloc/splash_page/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splash_page';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
late SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc=BlocProvider.of<SplashBloc>(context);
    splashBloc.initTimer(context);
    splashBloc.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(193, 53, 132, 1),
                Color.fromRGBO(131, 58, 180, 1),
              ]),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Instagram',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Billabong',
                    fontSize: 45,
                  ),
                ),
              ),
            ),
            Text(
              'All rights reserved',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
