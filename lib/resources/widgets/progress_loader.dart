import 'package:flutter/material.dart';

class ProgressLoader extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;

  const ProgressLoader({
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    super.key,
  });

  @override
  Widget build(
    final BuildContext context,
  ) {
    final List<Widget> widgetList = <Widget>[];

    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: false,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      );
      widgetList.add(
        modal,
      );
    }
    return Stack(
      children: widgetList,
    );
  }
}
