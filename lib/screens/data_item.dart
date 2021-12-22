import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/models/data_model.dart';

class DataItem extends StatelessWidget {
  // Data item
  final DataModel item;
  const DataItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: Text('${item.name}')),
          Text('${item.age}')
        ],
      ),
    );
  }
}
