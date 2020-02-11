import 'package:flutter/material.dart';
import 'package:flutter_01_pageview_indicator/core/models/card.dart';
import 'package:flutter_01_pageview_indicator/core/viewmodels/home_model.dart';
import 'package:flutter_01_pageview_indicator/ui/shared/globals.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<HomeModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Global.lightBlue,
        body: Container(
          color: Global.lightBlue,
          child: PageView.builder(
              itemCount: Global.cardData.length,
              controller: pageController,
              onPageChanged: (index) {
                print(index);
                if (!model.isTapped) {
                  model.updateIndex(index);
                }
                model.isTapped = false;
              },
              itemBuilder: (context, index) {
                final card = CustomCard.fromMap(Global.cardData[index]);

                return Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: screenWidth - 70.0,
                    height: screenWidth - 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: [
                        BoxShadow(
                          color: card.backGroundColor.withOpacity(0.25),
                          blurRadius: 40.0,
                          spreadRadius: 0.0,
                        )
                      ],
                      color: card.backGroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.lightbulb_outline,
                                color: Global.white,
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                card.title,
                                style: TextStyle(color: Global.white),
                              ),
                            ],
                          ),
                          Text(
                            card.headline,
                            style: TextStyle(
                                color: Global.white,
                                fontFamily: 'Sf',
                                fontSize: 30.0),
                          ),
                          Container(
                            width: 150,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Global.white,
                            ),
                            child: Center(
                              child: Text(
                                card.buttonTitle,
                                style: TextStyle(
                                    color: card.backGroundColor,
                                    fontFamily: 'Sf',
                                    fontSize: 13.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Global.mediumBlue.withOpacity(0.25),
                blurRadius: 40.0,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            color: Global.white,
          ),
          child: Transform(
            transform: Matrix4.translationValues(
              model.center(screenWidth),
              0,
              0,
            ),
            child: Stack(
              children: List.generate(
                Global.cardData.length,
                (index) {
                  final card = CustomCard.fromMap(Global.cardData[index]);
                  return Align(
                    alignment: index == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Transform(
                      transform: Matrix4.translationValues(
                        model.spacing(screenWidth, index),
                        0,
                        0,
                      ),
                      child: AnimatedContainer(
                        transform: Matrix4.translationValues(
                            index == 1 ? model.moveMiddle : 0.0, 0, 0),
                        width: model.animation(index),
                        height: model.dotSize,
                        child: GestureDetector(
                          onTap: () {
                            model.isTapped = true;
                            model.updateIndex(index);

                            pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuart,
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(model.dotSize / 2),
                                color: card.backGroundColor),
                          ),
                        ),
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.elasticOut,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
