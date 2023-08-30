import 'package:flutter/material.dart';
import 'package:http_project/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateFull dataResponse = HttpStateFull();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POST - STATEFUL'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                (dataResponse.id == null)
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: const TextStyle(fontSize: 20),
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
              child: Text(
                (dataResponse.name == null)
                    ? "Belum ada data"
                    : "${dataResponse.name}",
                style: const TextStyle(fontSize: 20),
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
              child: Text(
                (dataResponse.job == null)
                    ? "Belum ada data"
                    : "${dataResponse.job}",
                style: const TextStyle(fontSize: 20),
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
              child: Text(
                (dataResponse.createdAt == null)
                    ? "Belum ada data"
                    : "${dataResponse.createdAt}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                HttpStateFull.connectAPI('Mdara', 'Back End').then((value) {
                  setState(() {
                    print(value.name);
                    dataResponse = value;
                  });
                });
              },
              child: const Text('Post Data'),
            ),
          ],
        ),
      ),
    );
  }
}
