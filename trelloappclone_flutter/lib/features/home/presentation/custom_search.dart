// ignore_for_file: strict_raw_type, inference_failure_on_collection_literal

import 'package:flutter/material.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(List<Board> s) {
    searchTerms = s;
  }
  List<Board> searchTerms = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final matchQuery = <Board>[];
    for (final brd in searchTerms) {
      if (brd.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(brd);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];

        return ListTile(
          onTap: () async {
            if (context.mounted) {
              await Navigator.pushNamed(context, '/board');
            }
          },
          title: Text(result.name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final matchQuery = [];
    for (final brd in searchTerms) {
      if (brd.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(brd);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];

        return ListTile(
          onTap: () async {
            if (context.mounted) {
              await Navigator.pushNamed(context, '/board');
            }
          },
          // ignore: avoid_dynamic_calls
          title: Text(result.name.toString()),
        );
      },
    );
  }
}
