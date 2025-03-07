import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List Project',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter List Project')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Basic List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BasicListScreen()),
            ),
          ),
          ListTile(
            title: const Text('Horizontal List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HorizontalListScreen()),
            ),
          ),
          ListTile(
            title: const Text('Grid List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GridListScreen()),
            ),
          ),
          ListTile(
            title: const Text('Mixed List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MixedListScreen()),
            ),
          ),
          ListTile(
            title: const Text('Spaced Items List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SpacedItemsList()),
            ),
          ),
          ListTile(
            title: const Text('Long List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LongListScreen()),
            ),
          ),
          ListTile(
            title: const Text('Floating App Bar List'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FloatingAppBarList()),
            ),
          ),
        ],
      ),
    );
  }
}

class BasicListScreen extends StatelessWidget {
  const BasicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic List')),
      body: ListView(
        children: const <Widget>[
          ListTile(
              leading: Icon(Icons.map),
              title: Text('Map - Navigate to different places')),
          ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album - View your photos')),
          ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone - Call your contacts')),
        ],
      ),
    );
  }
}

class HorizontalListScreen extends StatelessWidget {
  const HorizontalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horizontal List')),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
                width: 160,
                color: Colors.red,
                child: Center(
                    child: Text('Red', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.blue,
                child: Center(
                    child:
                        Text('Blue', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.green,
                child: Center(
                    child:
                        Text('Green', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.yellow,
                child: Center(
                    child:
                        Text('Yellow', style: TextStyle(color: Colors.black)))),
            Container(
                width: 160,
                color: Colors.orange,
                child: Center(
                    child:
                        Text('Orange', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.red,
                child: Center(
                    child: Text('Red', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.blue,
                child: Center(
                    child:
                        Text('Blue', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.green,
                child: Center(
                    child:
                        Text('Green', style: TextStyle(color: Colors.white)))),
            Container(
                width: 160,
                color: Colors.yellow,
                child: Center(
                    child:
                        Text('Yellow', style: TextStyle(color: Colors.black)))),
            Container(
                width: 160,
                color: Colors.orange,
                child: Center(
                    child:
                        Text('Orange', style: TextStyle(color: Colors.white)))),
          ],
        ),
      ),
    );
  }
}

class GridListScreen extends StatelessWidget {
  const GridListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid List')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Card(
            color: Colors.blue.shade100,
            child: Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class MixedListScreen extends StatelessWidget {
  const MixedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i - Section Title')
          : MessageItem('Sender $i', 'This is a sample message for item $i.'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Mixed List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Icon(Icons.message, color: Colors.blueAccent),
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) =>
      Text(sender, style: TextStyle(fontWeight: FontWeight.bold));
  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

class SpacedItemsList extends StatelessWidget {
  const SpacedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spaced Items List')),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.label, color: Colors.purpleAccent),
            title: Text('Item $index'),
            subtitle: Text('This is a description for item $index.'),
          ),
        ),
      ),
    );
  }
}

class LongListScreen extends StatelessWidget {
  const LongListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items =
        List<String>.generate(10000, (i) => 'Item $i - Detailed description.');

    return Scaffold(
      appBar: AppBar(title: const Text('Long List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.list, color: Colors.green),
          title: Text(items[index]),
        ),
      ),
    );
  }
}

class FloatingAppBarList extends StatelessWidget {
  const FloatingAppBarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Floating App Bar'),
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/image.jpg', // Menggunakan gambar dari assets
                fit: BoxFit.cover, // Menyesuaikan gambar agar penuh
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: Text('Item #$index'),
                subtitle: Text('More details about item #$index.'),
              ),
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
