import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/containers/infinity_tab.dart';

class InfinityBar extends StatefulWidget {
  final List<TabData> tabs;
  final double size;
  final double viewportFraction;
  final Function(int page) onPageChanged;

  InfinityBar(
      {this.tabs, this.size, this.onPageChanged, this.viewportFraction});

  @override
  _InfinityBarState createState() => _InfinityBarState();
}

class _InfinityBarState extends State<InfinityBar> {
  PageController _controller;
  int _currentTab = 0;

  Future<void> animateToPage(int page, {Duration duration, Curve curve}) {
    return _controller.animateToPage(page, duration: duration, curve: curve);
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.tabs.length ~/ 2,
    );
    _currentTab = _controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        itemCount: widget.tabs.length,
        itemBuilder: (context, index) {
          final tab = widget.tabs[index];
          return Center(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(index == _currentTab ? 20 : 15),
              child: GestureDetector(
                child: AnimatedContainer(
                  width: index == _currentTab ? widget.size + 15 : widget.size,
                  height: index == _currentTab ? widget.size + 15 : widget.size,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  child: InfinityTab(
                    unicode: tab.unicode,
                    label: tab.label,
                    isSelected: index == _currentTab,
                  ),
                ),
                onTapUp: (details) => animateToPage(index,
                    duration: Duration(milliseconds: 500), curve: Curves.ease),
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() => _currentTab = index);
          widget.onPageChanged(index);
        });
  }
}
