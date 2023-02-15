import 'package:covidtrack/Model/WorldStateModel.dart';
import 'package:covidtrack/Services/States_service.dart';
import 'package:covidtrack/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';


class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       // backgroundColor:Theme.of(context).backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: searchController,
              onChanged: (value){
                setState(() {

                });
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                  )
              ),
            ),),
            Expanded(
              child: FutureBuilder(
                future: stateServices.fetchWorldCountryRecords(),
                builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
                  if(!snapshot.hasData){
                    return ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  title : Container(height: 10, width: 80, color: Colors.white),
                                  subtitle:Container(height: 10, width: 80, color: Colors.white),
                                  leading: Container(height: 50, width: 50, color: Colors.white),
                                )

                              ],
                            ),
                          );
                        });
                  }
                  else{
                    return ListView.builder(
                    itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                      String name = snapshot.data![index]['country'];
                      if(searchController.text.isEmpty){
                        return Column(
                          children: [
                            InkWell(
                              onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(

                            image: snapshot.data![index]['countryInfo']['flag'],
                            name: snapshot.data![index]['country'] ,
                            totalCases:  snapshot.data![index]['cases'] ,
                            totalRecovered: snapshot.data![index]['recovered'] ,
                            totalDeaths: snapshot.data![index]['deaths'],
                            active: snapshot.data![index]['active'],
                            test: snapshot.data![index]['tests'],
                            todayRecovered: snapshot.data![index]['todayRecovered'],
                            critical: snapshot.data![index]['critical'] ,

                          )));
                        },
                              child: ListTile(
                                title : Text(snapshot.data![index]['country']),
                                subtitle:Text(snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                  height:50,
                                  width:50,
                                  image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),),
                              ),
                            )

                          ],
                        );
                      }
                      else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                        return Column(
                          children: [
                            InkWell(
                              onTap : (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(

                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  name: snapshot.data![index]['country'] ,
                                  totalCases:  snapshot.data![index]['cases'] ,
                                  totalRecovered: snapshot.data![index]['recovered'] ,
                                  totalDeaths: snapshot.data![index]['deaths'],
                                  active: snapshot.data![index]['active'],
                                  test: snapshot.data![index]['tests'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                  critical: snapshot.data![index]['critical'] ,

                                )));

                        },
                              child: ListTile(
                                title : Text(snapshot.data![index]['country']),
                                subtitle:Text(snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                  height:50,
                                  width:50,
                                  image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),),
                              ),
                            )

                          ],
                        );
                      }
                      else{
                        return Container();
                      }

                        });
                  }


                },
              ),
            )

          ],
        ),
      ),

    );
  }
}
