import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_stateful_screen.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/view_model/network_view_model.dart';

class NetworkTestScreen extends StatefulWidget {
  const NetworkTestScreen({super.key});

  @override
  State<StatefulWidget> createState() => NetworkTestState();
}

class NetworkTestState extends BaseStatefulScreen<NetworkViewModel> {
  @override
  NetworkViewModel createViewModel() {
    return NetworkViewModel(key: viewModelKey);
  }

  @override
  Widget getBody(BuildContext context) {
    return Column(
      children: [
        const Text('네트워크 테스트'),
        TextButton(
          onPressed: () {
            viewModel?.getVersion2().then((_) {
              // 데이터를 가져온 후에 UI를 다시 빌드하기 위해 setState 호출
              // FutureBuilder에서 새로운 Future를 사용하도록 함
              // 그러면 새로운 데이터를 가져오게 됨
              if (mounted) {
                // Widget이 여전히 화면에 있는 경우에만 setState 호출
                setState(() {});
              }
            });
          },
          child: const Text('버전 호출'),
        ),
        FutureBuilder(
          future: viewModel?.futureVersion,
          builder: (context, snapshot) {
            final version = snapshot.data;
            printLog('FutureBuilder $version');
            return Text(version.toString() ?? "");
          },
        ),
      ],
    );
  }

  @override
  String getTagName() {
    return 'NetworkTestState';
  }

  @override
  String getTitle(BuildContext context) {
    return Util.getStringBundle(context).network_test;
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }
}
