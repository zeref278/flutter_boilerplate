import 'package:another_flushbar/flushbar.dart';
import 'package:boilerplate/common/app_spacing.dart';
import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/features/demo/bloc/demo_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_client/src/models/dog_image/dog_image.dart';

class ImagesFromDbPage extends StatelessWidget {
  const ImagesFromDbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DemoBloc>(
      create: (context) => Injector.instance<DemoBloc>()
        ..add(
          const DemoLoadImageFromDB(),
        ),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.current.image_from_db),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DemoBloc, DemoState>(
        listenWhen: (prev, next) => prev.status != next.status,
        listener: (context, state) {
          if (state.status == UIStatus.actionSuccess) {
            Flushbar(
              message: state.successMsg,
              duration: Duration(seconds: 1),
            ).show(context);
          } else if (state.status == UIStatus.actionFailed) {
            Flushbar(
              message: state.errorMsg,
              duration: Duration(seconds: 1),
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state.status == UIStatus.loading) {
            return const CircularProgressIndicator();
          } else {
            return _buildImages(state.images);
          }
        },
      ),
    );
  }

  Widget _buildImages(List<DogImage> images) {
    return ListView.separated(
      itemBuilder: (context, index) => Stack(
        children: [
          Image.network(images[index].message),
          Positioned(
            child: InkWell(
              child: const Icon(Icons.delete, color: Colors.red,),
              onTap: () {
                context
                    .read<DemoBloc>()
                    .add(DemoDeleteImageFromDB(images[index].message));
              },
            ),
          )
        ],
      ),
      separatorBuilder: (context, index) => AppSpacing.verticalSpacing6,
      itemCount: images.length,
    );
  }
}
