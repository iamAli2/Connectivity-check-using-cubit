import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondbloc/bloc/internet_bloct.dart';
import 'package:secondbloc/bloc/internet_state.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return "Connected".text.xl4.makeCentered();
          } else if (state is InternetLostState) {
            return "Not Connected".text.xl4.makeCentered();
          } else {
            return "Loading....".text.xl4.makeCentered();
          }
        },
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Connected".text.xl4.makeCentered(),
              backgroundColor: Colors.green,
            ));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Not Connected".text.xl4.makeCentered(),
              backgroundColor: Colors.red,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Loading ....".text.xl4.makeCentered(),
              backgroundColor: Colors.indigo,
            ));
          }
        },
      )),
    );
  }
}
