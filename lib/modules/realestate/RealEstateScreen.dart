import 'package:flutter/material.dart';
class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({Key? key}) : super(key: key);

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