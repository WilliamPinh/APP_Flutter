import 'package:flutter/material.dart';

class CampoTextoCustomizado extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;


  const CampoTextoCustomizado({super.key, required this.icon, required this.label, this.isSecret = false});

  @override
  State<CampoTextoCustomizado> createState() => _CampoTextoCustomizadoState();
}

class _CampoTextoCustomizadoState extends State<CampoTextoCustomizado> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
            ? IconButton(
            onPressed: (){
              setState((){
                isObscure = ! isObscure;
              });
            }, 
            icon: Icon(isObscure ? Icons.visibility: Icons.visibility_off),
          ) 
          : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18)
          ),
        ),
      ),
    );
  }
}