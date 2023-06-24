import 'package:dress_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../details/components/details_screen.dart';
import '../services/search_repo.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ContentService _contentService = ContentService();
  String _searchQuery = '';
  List<Product> _searchResults = [];

  void _performSearch() async {
    if (_searchQuery.isNotEmpty) {
      final results = await _contentService.searchContent(_searchQuery);
      setState(() {
        _searchResults = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar(),
      ),
      body: SearchResult(searchResults: _searchResults),
    );
  }

  TextFormField searchBar() {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
      onFieldSubmitted: (_) => _performSearch(),
      decoration: InputDecoration(
        hintText: 'Search...',
      ),
    );
  }
}

class SearchResult extends ConsumerWidget {
  const SearchResult({
    super.key,
    required List<Product> searchResults,
  }) : _searchResults = searchResults;

  final List<Product> _searchResults;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _searchResults.isEmpty
        ? Center(
            child: Text('No result found !!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
        : ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final doc = _searchResults[index];

              return ListTile(
                title: Text(doc.title!),
                subtitle: Text(
                  doc.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Text(
                  '\$ ${doc.price.toString()}',
                ),
                leading: Image.network(doc.image!),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: doc,
                      ),
                    )),
              );
            },
          );
  }
}
