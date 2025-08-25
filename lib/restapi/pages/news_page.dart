import 'package:flutter/material.dart';
import 'package:kayaku_widget_app/restapi/datasources/api_provider.dart';
import 'package:kayaku_widget_app/restapi/models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<NewsModel> futureNews;

  Future<NewsModel> getHeadlines() async {
    futureNews = ApiProvider().fetchTopHeadlines();
    return futureNews;
  }

  @override
  void initState() {
    getHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Page')),
      body: FutureBuilder<NewsModel>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final articles = snapshot.data!.articles;
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  child: ListTile(
                    title: Text(article.title ?? 'No Title'),
                    subtitle: Text(article.description ?? 'No Description'),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
