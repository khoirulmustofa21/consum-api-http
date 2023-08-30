import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POST - PROVIDER'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['id'] == null)
                      ? 'ID : Belum ada data'
                      : '${value.data['id']}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                'Nama :',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['name'] == null)
                      ? 'Belum ada data'
                      : '${value.data['name']}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                "Job : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['job'] == null)
                      ? 'Belum ada data'
                      : '${value.data['job']}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FittedBox(
              child: Text(
                "Created At : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['createdAt'] == null)
                      ? 'Belum ada data'
                      : '${value.data['createdAt']}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                dataProvider.connectAPI('Paijo', 'Mobile Developer');
              },
              child: const Text('Post Data'),
            ),
          ],
        ),
      ),
    );
  }
}
