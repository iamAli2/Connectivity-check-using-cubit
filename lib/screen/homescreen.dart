import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondbloc/cubit/internet_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: BlocConsumer<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state == InternetState.Gained) {
                    return "Connected".text.xl4.makeCentered();
                  } else if (state == InternetState.Lost) {
                    return "Not Connected".text.xl4.makeCentered();
                  } else {
                    return "Loading....".text.xl4.makeCentered();
                  }
                },
                listener: (context, state) {
                  if (state == InternetState.Gained) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Connected".text.xl2.make(),
                      backgroundColor: Colors.green,
                    ));
                  } else if (state == InternetState.Lost) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Not Connected".text.xl2.make(),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Loading ....".text.xl2.make(),
                      backgroundColor: Colors.indigo,
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
