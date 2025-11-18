import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CustomToggleSwitch({
    Key? key,
    this.initialValue = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomToggleSwitchState createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch>
    with SingleTickerProviderStateMixin {
  late bool isOn;
  late AnimationController _controller;
  late Animation<double> _thumbAnimation;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _thumbAnimation = Tween<double>(begin: 0, end: 24).animate(_controller);

    if (isOn) _controller.forward();
  }

  void toggleSwitch() {
    setState(() {
      isOn = !isOn;
      if (isOn) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onChanged?.call(isOn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: 50,
            height: 25,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isOn ? Color(0XFF785E57) : Colors.grey,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: _thumbAnimation.value,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
