import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan/models/barried.dart';
import 'package:qr_scan/ui/pages/barrier/cubit/barrier_cubit.dart';
import 'package:qr_scan/ui/pages/barrier/widgets/barrier_card.dart';
import 'package:qr_scan/ui/pages/barrier/widgets/user_card.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';

class BarrierPage extends StatelessWidget {
  const BarrierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroudWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
            ),
            child: BlocBuilder<BarrierCubit, Barrier>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BarrierCard(
                      barrier: Barrier(
                        name: context.read<BarrierCubit>().state.name,
                        status: context.read<BarrierCubit>().state.status,
                      ),
                      onPressedOpen: () {
                        context.read<BarrierCubit>().openBarrier();
                      },
                      onPressedClose: () {
                        context.read<BarrierCubit>().closeBarrier();
                      },
                    ),
                    UserCard(
                      login: context.read<BarrierCubit>().getLoginUser(),
                      image: context.read<BarrierCubit>().getImage(),
                      onPressed: () {
                        context.read<BarrierCubit>().exitUser(context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
