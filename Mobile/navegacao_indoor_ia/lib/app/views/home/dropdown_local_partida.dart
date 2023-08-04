import 'package:flutter/material.dart';
import 'package:navegacao_indoor_ia/app/models/estabelecimento.dart';

import '../../models/user_options.dart';
import '../../shared/colors.dart';
import '../../shared/widget/default_space.dart';

class DropdownLocalPartida extends StatefulWidget {
  final UserOptions userOptions;
  final List<Estabelecimento> listEstabelecimento;
  final String title;

  const DropdownLocalPartida(
      {required this.userOptions,
      required this.listEstabelecimento,
      required this.title,
      super.key});

  @override
  State<DropdownLocalPartida> createState() => _DropdownLocalPartidaState();
}

class _DropdownLocalPartidaState extends State<DropdownLocalPartida> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            text: TextSpan(
              text: widget.title,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              children: const <TextSpan>[
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        SizedBox(height: size.height * 0.005),
        Container(
          height: 30,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: defaultColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<Estabelecimento>(
              value: widget.userOptions.estabelecimentoPartida,
              icon: const Icon(Icons.arrow_drop_down,
                  size: 30, color: Colors.black),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              underline: Container(),
              onChanged: (Estabelecimento? newValue) => setState(() {
                widget.userOptions.setEstabelecimentoPartida(newValue!);
              }),
              items: widget.listEstabelecimento
                  .map<DropdownMenuItem<Estabelecimento>>(
                      (Estabelecimento value) {
                return DropdownMenuItem<Estabelecimento>(
                  value: value,
                  child: Text(value.name,
                      style: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
