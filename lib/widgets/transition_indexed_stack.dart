import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

class TransitionIndexedStackController {

  _TransitionIndexedStackState? _state;

  setTransitionIndexedStackState(_TransitionIndexedStackState state) {
    _state = state;
  }

  Future<bool> open(int index, {bool animate = true}) async {
    if (_state != null) {
      return _state!._open(index, animate: animate);
    }
    return false;
  }

  Future<bool> close(int index, {bool animate = true}) async {
    if (_state != null) {
      return _state!._close(index, animate: animate);
    }
    return false;
  }

  int? get index => _state?._selectedIndex;

}

class TransitionIndexedStack extends StatefulWidget {
  final Widget first;
  final Widget second;
  final Duration duration;
  final TransitionIndexedStackController? controller;

  const TransitionIndexedStack({
    Key? key,
    required this.first,
    required this.second,
    this.controller,
    this.duration = const Duration(milliseconds: 250)
  }) : super(key: key);

  @override
  _TransitionIndexedStackState createState() => _TransitionIndexedStackState();

}

class _TransitionIndexedStackState extends State<TransitionIndexedStack> with TickerProviderStateMixin {

  late List<Widget> _pages;
  List<AnimationController> _animationControllers = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    widget.controller?.setTransitionIndexedStackState(this);
    final _duration = widget.duration;
    _animationControllers = [
      AnimationController(
        vsync: this,
        duration: _duration,
      ),
      AnimationController(
        vsync: this,
        duration: _duration,
      )
    ];
    _pages = [
      pageBuilder(UniqueKey(), widget.second, context, _animationControllers[1]),
      pageBuilder(UniqueKey(), widget.first, context, _animationControllers[0]),
    ];
    super.initState();
  }

  Future<bool> _open(int index, {bool animate = true}) async {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      setState(() {
        _pages = _pages.reversed.toList();
      });
      if (animate) {
        await _animationControllers[_selectedIndex].reverse(from: _animationControllers[_selectedIndex].upperBound);
      }
      return true;
    }
    return false;
  }

  Future<bool> _close(int index, {bool animate = true}) async {
    if (_selectedIndex == index) {
      _selectedIndex = index == 1 ? 0 : 1;
      if (animate) {
        await _animationControllers[index].forward(from: _animationControllers[index].lowerBound);
      }
      setState(() {
        _pages = _pages.reversed.toList();
      });
      if (animate) {
        _animationControllers[index].value = _animationControllers[index].lowerBound;
      }
      return true;
    }
    return false;
  }



  @override
  void dispose() {
    _animationControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _pages,
    );
  }

  Widget pageBuilder(Key key, Widget widget, BuildContext context, Animation<double> animation) {
    return SlideTransition(
      key: key,
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1, 0),
      ).chain(CurveTween(curve: Curves.fastOutSlowIn)).animate(animation),
      child: widget
    );
  }

}
