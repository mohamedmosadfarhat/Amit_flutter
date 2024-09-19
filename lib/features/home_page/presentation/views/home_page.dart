import 'package:amit_flutter/core/utitls/style.dart';
import 'package:amit_flutter/features/home_page/data/models/product_model.dart';
import 'package:amit_flutter/features/home_page/presentation/manager/cubit/product_cubit.dart';
import 'package:amit_flutter/features/home_page/presentation/manager/cubit/product_state.dart';
import 'package:amit_flutter/features/home_page/presentation/views/homw_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductCubit>(context).products;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Buy now",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.grey[100],
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
            builder: (context, state) {
              return GridView.builder(
                  itemCount: cubit.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.84,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(HomeDetails.id,
                        arguments: ProductModel(
                          id: cubit[index].id,
                          title: cubit[index].title,
                          image: cubit[index].image,
                          price: cubit[index].price,
                          description: cubit[index].description
                        )
                        );
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                              height: 300,
                              width: double.infinity,
                              child: Image.network(
                                "${cubit[index].image}",
                                fit: BoxFit.fill,
                              )),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${cubit[index].title?.substring(0, 13)}",
                                  style: Style.textstyle18,
                                ),
                                Text("${cubit[index].price}")
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            listener: (context, state) {}));
  }
}
