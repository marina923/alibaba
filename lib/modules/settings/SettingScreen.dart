import 'package:flutter/material.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Text('Agent Screen'),
      );
    // BlocConsumer<AppCubit, AppStates>(
    //   builder: (context, state) {
    //     var list = AppCubit.get(context).Sports;
    //     return articleBuilder(list, context);
    //   },
    //   listener: (state, context) {});
  }
}