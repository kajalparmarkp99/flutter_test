import 'package:flutter/material.dart';
import 'package:my_app/utils/utils.dart';

import '../../domain/entities/quote.dart';

class QuoteDetailsScreen extends StatelessWidget {
  final Quote quote;

  const QuoteDetailsScreen({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(quote.dateAdded.toString());
    String dateAdded = date.formatTo('dd-MM-yyyy');
    DateTime date1 = DateTime.parse(quote.dateModified.toString());
    String dateModify = date1.formatTo('dd-MM-yyyy');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        bottomOpacity: 5,
        centerTitle: true,
        title: const Text('Quote',)
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            Text(
             '"${quote.content}"',
              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text(
                'Author:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              ),
              Text(
                textAlign: TextAlign.start,
                quote.author,
                style: const TextStyle(fontSize: 16),
              ),
            ],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tags:',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
                Text(
                  textAlign: TextAlign.start,
                  quote.tags!.first,
                  style: const TextStyle(fontSize: 16),
                ),
              ],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date Added:',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
                Text(
                  dateAdded,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 16),
                ),
              ],),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date Modify:',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
                Text(
                  dateModify,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 16),
                ),
              ],)
          ],
        ),
      ),
    );
  }
}