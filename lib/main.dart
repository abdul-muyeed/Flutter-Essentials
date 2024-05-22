import 'package:flutter/material.dart';


class GoogleProducts {
  final List<String> items = [
    'Cloud Functions',
    'App Engine',
    'Kubernetes Engine',
    'Compute Engine',
    'Bare Metal',
    'Preemptible VMs',
    'Shielded VMs',
    'Sole-tenet Nodes',
    'VMWare Engine',
    'Cloud Firestore',
    'Cloud Storage',
    'Persistent Disk',
    'Local SSD',
    'Cloud Bigtable',
    'Cloud Firestore',
    'Cloud Memorystore',
    'Cloud Spanner',
  ];
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Google Products';
    return const MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: ProductHomeWidget(title),
    );
  }
}


class ProductHomeWidget extends StatelessWidget {
  final String title;

  const ProductHomeWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const AppBarLeading(),

        actions: const [
          AppBarActionsShare(),
        ],
        title: Text(title, style: const TextStyle(color: Colors.black)),
      ),
      body: ProductListView(),
    );
  }
}

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      icon: Icon(
        Icons.menu,
      ),
      onPressed: null,
    );
  }
}

class AppBarActionsShare extends StatelessWidget {
  const AppBarActionsShare({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.share,
        ),
        onPressed: () {
          const snackBar =
              SnackBar(content: Text('You selected the Share Action'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}

class ProductListView extends StatelessWidget {
  final googleProducts = GoogleProducts();

  ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: googleProducts.items.length,
      itemBuilder: (context, index) {
        return ProductListTile(googleProducts.items[index]);
      },
    );
  }
}

class ProductListTile extends StatelessWidget {
  final String? productLabel;

  const ProductListTile(this.productLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$productLabel', style: const TextStyle(color: Colors.black)),
      subtitle: const Text('SubTitle', style: TextStyle(color: Colors.black)),
      leading: const Icon(Icons.help_center_outlined, color: Colors.black),

      onTap: () {
        final snackBar = SnackBar(content: Text('You selected $productLabel'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyDetails()),
        );
      },
    );
  }
}


class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Details Page';

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const AppBarLeading(),
        actions: const [
          AppBarActionsShare(),
        ],
        title: const Text(title, style: TextStyle(color: Colors.black)),
      ),
      
      body: const Center(
        child: Text('Hello Details Page')),
    );
  }
 }