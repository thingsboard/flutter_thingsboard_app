import 'package:flutter/widgets.dart';
import 'package:preload_page_view/preload_page_view.dart';

class TwoPageViewController {
  _TwoPageViewState? _state;

  setTransitionIndexedStackState(_TwoPageViewState state) {
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

class TwoPageView extends StatefulWidget {
  final Widget first;
  final Widget second;
  final Duration duration;
  final TwoPageViewController? controller;

  const TwoPageView(
      {Key? key,
      required this.first,
      required this.second,
      this.controller,
      this.duration = const Duration(milliseconds: 250)})
      : super(key: key);

  @override
  _TwoPageViewState createState() => _TwoPageViewState();
}

class _TwoPageViewState extends State<TwoPageView> {
  late List<Widget> _pages;
  bool _reverse = false;
  int _selectedIndex = 0;
  final PreloadPageController _pageController = PreloadPageController();

  @override
  void initState() {
    widget.controller?.setTransitionIndexedStackState(this);
    _pages = [widget.first, widget.second];
    super.initState();
  }

  Future<bool> _open(int index, {bool animate = true}) async {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      if (index == 0) {
        setState(() {
          _reverse = true;
        });
      }
      await _pageController.animateToPage(_selectedIndex,
          duration: widget.duration, curve: Curves.fastOutSlowIn);
      return true;
    }
    return false;
  }

  Future<bool> _close(int index, {bool animate = true}) async {
    if (_selectedIndex == index) {
      _selectedIndex = index == 1 ? 0 : 1;
      await _pageController.animateToPage(_selectedIndex,
          duration: widget.duration, curve: Curves.fastOutSlowIn);
      if (index == 0) {
        setState(() {
          _reverse = false;
        });
      }
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new PreloadPageView(
      children: _pages,
      physics: NeverScrollableScrollPhysics(),
      reverse: _reverse,
      onPageChanged: (int position) {
        _selectedIndex = position;
      },
      preloadPagesCount: 2,
      controller: _pageController,
    );
  }
}
