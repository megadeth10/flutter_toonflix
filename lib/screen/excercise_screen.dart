import 'package:flutter/material.dart';
import 'package:toonflix/item/card_item.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/widget/button.dart';
import 'package:toonflix/widget/card.dart';
import 'package:toonflix/widget/counter.dart';

/// fluter 함습 테스트 앱
final class App extends StatelessWidget {
  final cardList = [
    CardItem(
      name: 'Euro',
      value: 6428,
      currency: 'EUR',
      icon: Icons.euro,
      offset: const Offset(0, 0),
      isMainBlack: true,
    ),
    CardItem(
      name: 'Bitcoin',
      value: 9192,
      currency: 'BTC',
      icon: Icons.currency_bitcoin,
      offset: const Offset(0, -20),
      isMainBlack: false,
    ),
    CardItem(
      name: 'Dollar',
      value: 2231,
      currency: 'USD',
      icon: Icons.attach_money,
      offset: const Offset(0, -40),
      isMainBlack: true,
    ),
    CardItem(
      name: 'Yen',
      value: 12434,
      currency: 'YEN',
      icon: Icons.currency_yen,
      offset: const Offset(0, -60),
      isMainBlack: false,
    ),
  ];

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff000000),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'name, 23456',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'welcome',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const MyContainerWidget(),
                const Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\$${Util.getCurrencyDisplayText(5194482)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    BaseButton(
                      text: "Transfer",
                      textColor: Color(0xff181818),
                      backgroundColor: Colors.amber,
                    ),
                    BaseButton(
                      text: "Request",
                      textColor: Colors.white,
                      backgroundColor: Color(0xff181818),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                for (final item in cardList) NameCard(item: item)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
 * build 함수에서 표시된 Widget중에 dispose되면 그 위젯은 유효 하지 않게 된다.
 *  _MyContainerWidgetState 클래스에서 CounterWidget 멤버 변수를 클래스의 맴버와 build 함수내에 instance일때 멤버 변수는 instance exception이 발생함.
 */
class MyContainerWidget extends StatefulWidget {
  const MyContainerWidget({super.key});

  @override
  State<MyContainerWidget> createState() => _MyContainerWidgetState();
}

class _MyContainerWidgetState extends State<MyContainerWidget> {
  // CounterWidget counterWidget = CounterWidget(); // dispose 되면 더이상 유효 하지 않은 위젯의 예
  var _isShow = false;

  void _toggleShow() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    CounterWidget counterWidget = CounterWidget();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _isShow ? counterWidget : const Text('None'),
        IconButton(
          onPressed: counterWidget.reset,
          icon: const Icon(
            Icons.clear,
            size: 40,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: _toggleShow,
          icon: _isShow
              ? const Icon(
                  Icons.hide_source,
                  size: 40,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.remove_red_eye,
                  size: 40,
                  color: Colors.white,
                ),
        ),
      ],
    );
  }
}
