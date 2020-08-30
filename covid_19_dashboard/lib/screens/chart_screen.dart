import 'package:covid_19_dashboard/config/palette.dart';
import 'package:covid_19_dashboard/config/styles.dart';
import 'package:covid_19_dashboard/widgets/chart_grid.dart';
import 'package:covid_19_dashboard/widgets/covid_bar_chart.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildChartTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            labelColor: Colors.white,
            labelStyle: Styles.tabTextStyle,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Palette.primaryColor,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildChartTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            sliver: SliverToBoxAdapter(
              child: ChartGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: [],),
            ),
          ),
        ],
      ),
    );
  }
}
