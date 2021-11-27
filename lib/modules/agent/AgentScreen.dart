import 'package:flutter/material.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
