import 'package:flutter/material.dart';

class TimelineComponent extends StatefulWidget {
  final List<TimelineModel> timelineList;
  final Color backgroundColor;
  final Color headingColor;
  const TimelineComponent({
    Key key,
    this.timelineList,
    this.backgroundColor,
    this.headingColor,
  }) : super(key: key);
  @override
  TimelineComponentState createState() {
    return new TimelineComponentState();
  }
}

class TimelineComponentState extends State<TimelineComponent>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
            itemCount: widget.timelineList.length,
            itemBuilder: (_, index) {
              return new TimelineElement(
                  lineColor: widget.timelineList[index].lineColor == null
                      ? Theme.of(context).accentColor
                      : widget.timelineList[index].lineColor,
                  backgroundColor: widget.backgroundColor == null
                      ? Colors.white
                      : widget.backgroundColor,
                  model: widget.timelineList[index],
                  firstElement: index == 0,
                  lastElement: widget.timelineList.length == index + 1,
                  controller: controller,
                  headingColor: widget.timelineList[index].titleColor,
                  descriptionColor:
                      widget.timelineList[index].descriptionColor);
            }));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class TimelineModel {
  final String id;
  final String title;
  final String description;
  final String description2;
  final Color lineColor;
  final Color descriptionColor;
  final Color titleColor;
  const TimelineModel(
      {this.id,
      this.title,
      this.description,
      this.description2,
      this.lineColor,
      this.descriptionColor,
      this.titleColor});
}

class TimelineElement extends StatelessWidget {
  final Color lineColor;
  final Color backgroundColor;
  final TimelineModel model;
  final bool firstElement;
  final bool lastElement;
  final Animation<double> controller;
  final Color headingColor;
  final Color descriptionColor;
  TimelineElement(
      {@required this.lineColor,
      @required this.backgroundColor,
      @required this.model,
      this.firstElement = false,
      this.lastElement = false,
      this.controller,
      this.headingColor,
      this.descriptionColor});
  Widget _buildLine(BuildContext context, Widget child) {
    return new Container(
        width: 40.0,
        child: new CustomPaint(
            painter: new TimelinePainter(
                lineColor: lineColor,
                backgroundColor: backgroundColor,
                firstElement: firstElement,
                lastElement: lastElement,
                controller: controller)));
  }

  Widget _buildContentColumn(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: new Text(
                      model.title.length > 47
                          ? model.title.substring(0, 47) + "..."
                          : model.title,
                      style: new TextStyle(
                          fontFamily: 'Mitr',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: headingColor != null
                              ? headingColor
                              : Colors.black))),
              new Expanded(
                child: new Text(
                    model.description != null
                        ? (model.description.length > 100
                            ? model.description.substring(0, 50) + "..."
                            : model.description)
                        : "", // To prevent overflowing of text to the next element, the text is truncated if greater than 75 characters
                    style: new TextStyle(
                        fontFamily: 'Mitr',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: descriptionColor != null
                            ? descriptionColor
                            : Colors.grey)),
              ),
              new Expanded(
                child: new Text(
                    model.description != null
                        ? (model.description.length > 100
                            ? model.description.substring(0, 50) + "..."
                            : model.description)
                        : "", // To prevent overflowing of text to the next element, the text is truncated if greater than 75 characters
                    style: new TextStyle(
                        fontFamily: 'Mitr',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: descriptionColor != null
                            ? descriptionColor
                            : Colors.grey)),
              ),
            ],
          ),
        ));
  }

  Widget _buildRow(BuildContext context) {
    return new Container(
        height: 80.0,
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new AnimatedBuilder(builder: _buildLine, animation: controller),
              new Expanded(child: _buildContentColumn(context))
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return _buildRow(context);
  }
}

class TimelinePainter extends CustomPainter {
  final Color lineColor;
  final Color backgroundColor;
  final bool firstElement;
  final bool lastElement;
  final Animation<double> controller;
  final Animation<double> height;
  TimelinePainter(
      {@required this.lineColor,
      @required this.backgroundColor,
      this.firstElement = false,
      this.lastElement = false,
      this.controller})
      : height = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(0.45, 1.0, curve: Curves.ease),
          ),
        ),
        super(repaint: controller);
  @override
  void paint(Canvas canvas, Size size) {
    _centerElementPaint(canvas, size);
  }

  void _centerElementPaint(Canvas canvas, Size size) {
    Paint lineStroke = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    if (firstElement && lastElement) {
      // Do nothing
    } else if (firstElement) {
      Offset offsetCenter = size.center(new Offset(0.0, -4.0));
      Offset offsetBottom = size.bottomCenter(new Offset(0.0, 0.0));
      Offset renderOffset = new Offset(
          offsetBottom.dx, offsetBottom.dy * (0.5 + (controller.value / 2)));
      canvas.drawLine(offsetCenter, renderOffset, lineStroke);
    } else if (lastElement) {
      Offset offsetTopCenter = size.topCenter(new Offset(0.0, 0.0));
      Offset offsetCenter = size.center(new Offset(0.0, -4.0));
      Offset renderOffset =
          new Offset(offsetCenter.dx, offsetCenter.dy * controller.value);
      canvas.drawLine(offsetTopCenter, renderOffset, lineStroke);
    } else {
      Offset offsetTopCenter = size.topCenter(new Offset(0.0, 0.0));
      Offset offsetBottom = size.bottomCenter(new Offset(0.0, 0.0));
      Offset renderOffset =
          new Offset(offsetBottom.dx, offsetBottom.dy * controller.value);
      canvas.drawLine(offsetTopCenter, renderOffset, lineStroke);
    }
    Paint circleFill = new Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(new Offset(0.0, -8.0)), 6.0, circleFill);
  }

  @override
  bool shouldRepaint(TimelinePainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
