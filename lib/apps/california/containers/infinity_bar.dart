import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/containers/infinity_tab.dart';

class InfinityBar extends StatefulWidget {
  static _InfinityBarState of (BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_InfinityBarState>());
  final List<TabData> tabs;
  final double size;
  final double viewportFraction;
  final int currentTab;
  final Function(int page) onPageChanged;

  InfinityBar(
      {this.tabs, this.size, this.onPageChanged,this.currentTab, this.viewportFraction});

  @override
  _InfinityBarState createState() => _InfinityBarState();
}

class _InfinityBarState extends State<InfinityBar> {
  PageController _controller;
  int _currentTab;

  Future<void> animateToPage(int page, {Duration duration, Curve curve}) {
    return _controller.animateToPage(page, duration: duration, curve: curve);
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.currentTab,
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
            child: GestureDetector(
              child: AnimatedContainer(
                width: index == _currentTab
                    ? widget.size + 15
                    : index + 1 == _currentTab || index - 1 == _currentTab
                        ? widget.size
                        : widget.size - 5,
                height: index == _currentTab
                    ? widget.size + 15
                    : index + 1 == _currentTab || index - 1 == _currentTab
                        ? widget.size
                        : widget.size - 5,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                child: InfinityTab(
                  radius: BorderRadius.circular(
                    index == _currentTab
                        ? 17.5
                        : index + 1 == _currentTab || index - 1 == _currentTab
                            ? 12.5
                            : 10,
                  ),
                  unicode: tab.unicode,
                  label: tab.label,
                  isSelected: index == _currentTab,
                ),
              ),
              onTap: () => animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() => _currentTab = index);
          widget.onPageChanged(index);
        });
  }
}
