import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/theme.dart';

class InfinityTab extends StatefulWidget {
  final String unicode;
  final String label;
  final bool isSelected;
  final BorderRadius radius;

  InfinityTab({this.unicode, this.isSelected, this.label, this.radius});

  @override
  _InfinityTabState createState() => _InfinityTabState();
}

class _InfinityTabState extends State<InfinityTab> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius: widget.radius,
          color: widget.isSelected ? Colors.blue : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(1.5, 2.5),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: '${widget.unicode}__hero',
              child: Text(
                widget.unicode,
                style: TextStyle(
                    fontSize: widget.isSelected
                        ? Molland.adaptiveFontSize(context, 16, 14, 12)
                        : Molland.adaptiveFontSize(context, 22, 20, 18),
                    fontFamily: 'FeatherIcons',
                    color: widget.isSelected ? Colors.white : Colors.black26),
              ),
            ),
            if (widget.isSelected) ...{
              Text(
                widget.label.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Molland.adaptiveFontSize(context, 12, 10, 8),
                    height: 1.4,
                    letterSpacing: 1.1),
              )
            }
          ],
        ));
  }
}

class TabData {
  final String unicode;
  final String label;
  final double size;
  final bool isSelected;
  final VoidCallback onTap;

  TabData({this.unicode, this.isSelected, this.label, this.size, this.onTap});
}
