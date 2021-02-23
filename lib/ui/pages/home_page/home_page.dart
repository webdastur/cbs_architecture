// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:cbs_architecture/data/bloc/number/number_bloc.dart';
import 'package:cbs_architecture/data/localization/locale_keys.g.dart';
import 'package:cbs_architecture/data/services/root_service.dart';
import 'package:cbs_architecture/ui/widgets/app_widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppWidgets.textLocale(
          localeKey: LocaleKeys.app_name,
        ),
      ),
      body: BlocBuilder<NumberBloc, NumberState>(
        cubit: RootService.appBloc.numberBloc,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppWidgets.text(text: "${state.number}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      RootService.appBloc.numberBloc.add(NumberDec());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      RootService.appBloc.numberBloc.add(NumberInc());
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
