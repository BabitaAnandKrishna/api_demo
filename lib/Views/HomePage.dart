import 'package:api_demo/Model/factResponse.dart';
import 'package:api_demo/Services/dataServices.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataServices dataServices = DataServices();
  // FactsResponse factsResponse = FactsResponse();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Api Integration"),
      ),
      body: Container(
        child: FutureBuilder(
          future: dataServices.getData(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              FactsResponse factsResponse = snapshot.data; //connect to the model class
              return ListView.builder(
                  itemCount: factsResponse.facts.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(child: Text(factsResponse.facts[index].title)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(child: Text(factsResponse.facts[index].description)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Image.network(factsResponse.facts[index].imageUrl)),
                        ),
                      ],
                    );
                  });


              //Text(factsResponse.category);
            }
            else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
