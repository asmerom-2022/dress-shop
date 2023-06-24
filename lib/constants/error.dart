import 'package:flutter/material.dart';

class AdminErrorWidget extends StatelessWidget {
  const AdminErrorWidget({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(54),
        child: Column(
          children: [
            Text('No results',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text(
                'Sorry something went wrong, there are no results try again later.',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
