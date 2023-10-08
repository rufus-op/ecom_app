import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListviewItems extends StatelessWidget {
  const ListviewItems({super.key});

  @override
  Widget build(BuildContext context) {
     final providerIns = Provider.of<ApiProvider>(context);
    return  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: providerIns.jsonResponse!.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    // providerIns.resetValues();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    // height: 165,
                    width: 140,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(.3)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Image(
                            image: NetworkImage(
                                providerIns.jsonResponse![index]['image']),
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            height: 85,
                          ),
                        ),
                        Text(
                          providerIns.jsonResponse![index]['title'],
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                                providerIns.jsonResponse![index]['rating']
                                        ['rate']
                                    .toString(),
                                style:
                                    const TextStyle(color: Color(0xFffFBE30))),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                                '(${providerIns.jsonResponse![index]['rating']['count'].toString()})'),
                          ],
                        ),
                        Text(
                          '\$${providerIns.jsonResponse![index]['price'].toString()}',
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ));
            },
          )
     ;
  }
}