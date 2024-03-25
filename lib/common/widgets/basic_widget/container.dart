import 'package:flutter/material.dart';

class ContainerCustom extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const ContainerCustom({super.key, this.height, this.width, this.child});

  @override
  State<ContainerCustom> createState() => _ContainerCustomState();
}

class _ContainerCustomState extends State<ContainerCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: widget.child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset(0, 2), // Surélever la barre de navigation vers le haut
          )
        ],
      ),
    );
  }
}
