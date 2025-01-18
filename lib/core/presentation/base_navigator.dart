import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routers/routers.dart';
import 'package:movie_app/gen/assets.gen.dart';

class BaseNavigator extends StatefulWidget {
  final Widget child;
  const BaseNavigator({super.key, required this.child});

  @override
  State<BaseNavigator> createState() => _BaseNavigatorState();
}

class _BaseNavigatorState extends State<BaseNavigator> {
  List<bool> listCheck = [true, false, false, false];
  void changState(int number) {
    setState(() {
      for (int i = 0; i < listCheck.length; i++) {
        listCheck[i] = i == number;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,
        body: widget.child,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 44, left: 30, right: 30),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _EachIcon(
                  isSelected: listCheck[0],
                  onTap: () {
                    changState(0);
                    context.go(RouterDerection.home);
                  },
                  child: Assets.icons.home.image(height: 20)),
              _EachIcon(
                  isSelected: listCheck[1],
                  onTap: () {
                    changState(1);
                    context.go(RouterDerection.pageMovie);
                  },
                  child: Assets.icons.watch.image(height: 20)),
              _EachIcon(
                  isSelected: listCheck[2],
                  onTap: () {
                    changState(2);
                  },
                  child: Assets.icons.search.image(height: 20)),
              _EachIcon(
                  isSelected: listCheck[3],
                  onTap: () {
                    changState(3);
                  },
                  child: Assets.icons.movie.image(height: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

class _EachIcon extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;
  const _EachIcon(
      {required this.child, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
            color: isSelected ? Colors.amber.shade800 : Colors.transparent,
            spreadRadius: 2,
            blurRadius: 8,
          )
        ]),
        child: child,
      ),
    );
  }
}
