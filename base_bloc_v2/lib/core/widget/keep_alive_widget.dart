import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  const KeepAliveWidget({
    Key? key,
    @required this.child,
    this.safeAreaLeft = false,
    this.safeAreaTop = false,
    this.safeAreaRight = false,
    this.safeAreaBottom = false,
  }) : super(key: key);

  final Widget? child;
  final bool? safeAreaLeft;
  final bool? safeAreaTop;
  final bool? safeAreaRight;
  final bool? safeAreaBottom;

  @override
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        left: widget.safeAreaLeft ?? false,
        top: widget.safeAreaTop ?? false,
        right: widget.safeAreaBottom ?? false,
        bottom: widget.safeAreaBottom ?? false,
        child: widget.child ?? Container());
  }

  @override
  bool get wantKeepAlive => true;
}