import 'package:flutter/material.dart';
import '/repo/records.dart';
import 'package:provider/provider.dart';

class w2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //final provider = Provider.of<RecordsProvider>(context);
    final provider = context.watch<RecordsProvider>();
    provider.refresh();
    return Container(
      width: double.infinity,
      height: 700,
      child:
      provider.list.isEmpty
          ? const Center(child: Text('Немає записів'))
          : ListView.builder(
        itemCount: provider.list.length,
        itemBuilder: (context, index) {
          final item = provider.list[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 7.0),
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color(0xFF2C2B44),
              ),
              child:
              ListTile(
                subtitle: Text(item.formatDate(), style: Theme.of(context).textTheme.titleSmall),
                title: Text(item.description, style: Theme.of(context).textTheme.titleMedium),
              )
          );
        },
      ),
    );
  }
}