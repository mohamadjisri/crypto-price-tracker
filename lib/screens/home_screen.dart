import 'package:flutter/material.dart';
import 'package:flutter_crypto_price_tracker/controllers/coin_controller.dart';
import 'package:flutter_crypto_price_tracker/utils.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crypto Market",
                  style: textStyle(25, Colors.white, FontWeight.bold)),
              Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[700],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey[700]!,
                                                  offset: const Offset(4, 4),
                                                  blurRadius: 5)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.network(
                                              controller.coinList[index].image),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            controller.coinList[index].name,
                                            style: textStyle(18, Colors.white,
                                                FontWeight.w600),
                                          ),
                                          Text(
                                            "${controller.coinList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                            style: textStyle(18, Colors.grey,
                                                FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$ ${controller.coinList[index].currentPrice}",
                                        style: textStyle(
                                            18, Colors.white, FontWeight.w600),
                                      ),
                                      Text(
                                        controller.coinList[index].symbol
                                            .toUpperCase(),
                                        style: textStyle(
                                            18, Colors.grey, FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
