import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedItem;

  // Função callback que será chamada quando uma moeda for selecionada
  // Recebe o modelo da moeda selecionada como parâmetro
  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
  });

  @override // ← Indica que estamos sobrescrevendo um método
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(              
              iconEnabledColor: Colors.amber,
              isExpanded: true, // Ocupa toda largura disponível
              value: selectedItem,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ), // Linha embaixo
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 10), // Espaçamento entre colunas
        // SEGUNDA COLUNA - CAMPO DE TEXTO
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextField(
              controller: controller, // Conecta com o controller
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade300),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
