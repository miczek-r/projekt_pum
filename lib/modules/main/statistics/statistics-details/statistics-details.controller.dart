import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekt_pum/config/models/game.dart';
import 'package:projekt_pum/config/models/result.dart';
import 'package:projekt_pum/config/models/user.dart';
import 'package:projekt_pum/modules/main/statistics/statistics-details/statistics-details.dart';
import 'package:projekt_pum/modules/main/statistics/statistics-details/statistics-details.view.dart';
import 'package:projekt_pum/utils/repositories/data_repository.dart';
import 'package:tuple/tuple.dart';

class StatisticsDetailsPageController extends State<StatisticsDetailsPage> {
  final Tuple2<String, String> gameName;
  User? currentUser = FirebaseAuth.instance.currentUser;

  Result? highScore ;

  final DataRepository repository = DataRepository();
  double maxValue = 1.0;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  List<Result> results = [];

  StatisticsDetailsPageController(this.gameName);

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    text = (results.length > value.toInt())
        ? Text(DateFormat('yyy-MM-dd').format(results[value.toInt()].date),
            style: style)
        : Text("");

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) => StatisticsDetailsPageView(this);

  getChartData() {
    return [
      LineChartBarData(
        spots: results
            .mapIndexed((index, element) => FlSpot(index * 1.0, element.score))
            .toList(),
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    ];
  }
  getData() async {
    var dataSnapshot = await repository.getData(currentUser!.uid);
    if (dataSnapshot == null) return;
    UserResult result = UserResult.fromSnapshot(dataSnapshot);
    if (result == null) {
      return;
    }

    Game? game = result.categories
        .firstWhereOrNull((element) => element.name == gameName.item1)
        ?.games
        .firstWhereOrNull((element) => element.name == gameName.item2);
    if (game == null) {
      return;
    }
    game.results.sortBy((element) => element.date);
    results = game.results.reversed.take(5).toList().reversed.toList();
    while (results.length < 5) {
      results = [
        new Result(0, date: new DateTime(0000, 1, 1, 1, 1)),
        ...results
      ];
    }
    if(gameName.item1 == "reaction"){
    game.results.sort((a, b) => a.score.compareTo(b.score));

    }else{

    game.results.sort((a, b) => b.score.compareTo(a.score));
    }
    highScore = game.results.first;
    var temp = List.from(results);
    temp.sort((a, b) => b.score.compareTo(a.score));
    maxValue = (temp[0].score * 1.1).roundToDouble();
    if(mounted){

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = '0';

    if (value == 0) {
      return Text('0', style: style, textAlign: TextAlign.left);
    }

    if (value == (maxValue / 2).round()) {
      text = (maxValue / 2).round().toString();

      return Text(text, style: style, textAlign: TextAlign.left);
    }

    if (value == maxValue.round()) {
      text = (maxValue.round()).toString();
      return Text(text, style: style, textAlign: TextAlign.left);
    }

    return Container();
  }

  LineChartData mainData() {
    return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: maxValue/5000>1?1000:maxValue/1000>1?200:maxValue/500>1?100:maxValue/100>1?20:maxValue/50>1?10:2,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        maxX: 4,
        minY: 0,
        maxY: maxValue,
        lineBarsData: getChartData());
  }
}
