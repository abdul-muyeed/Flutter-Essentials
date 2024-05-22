import 'package:flutter/material.dart';

class GoogleProducts {
  final List<String> items = [
    'Cloud Functions',
    'App Engine',
    'Kubernetes Engine',
    'Compute Engine',
    'Bare Metal',
    'Pre-emtible VMs',
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
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        actions: const [
          AppBarActionsShare(),
        ],
        title: Text(title, style: const TextStyle(color: Colors.black)),
      ),
      body: ProductListView(),
      
      drawer: const MyDrawerWidget(),
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
              SnackBar(content: Text('You selected the Action: Share'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}


// TODO: Enable Drawer
class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Icon(Icons.flutter_dash, size: 35),
          ),
        ],
      ),
    );
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
      leading: const Icon(Icons.info, color: Colors.black),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyDetails()),
        );
      },
    );
  }
}


class MyDetails extends StatelessWidget {
  final title = 'Details Page';

  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.grey, //change your color here
            ),
            title: Text(title, style: const TextStyle(color: Colors.grey)),
            actions: const [
              AppBarActionsShare(),
            ],

            bottom: const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.grey),
                  child: Text('Overview',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.grey),
                  child: Text('Docs',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.list, color: Colors.grey),
                  child: Text('Information',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.info, color: Colors.grey),
                  child: Text('Other',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          body: const TabBarView(
            children: [
              SizedBox(
                child: Center(
                  child: Text('Tab Page 1'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Tab Page 2'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Tab Page 3'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Tab Page 4'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}