import 'package:beauty_e_commerce/presentation/profile/components/profile_ui.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../models/product_model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.product.videoUrl!);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    scroll() {
      return Material(
        // color: ColorManager.bgWhite,
        type: MaterialType.transparency,
        child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 1.0,
            minChildSize: 0.5,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: ColorManager.black,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 35,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(widget.product.productName,
                          style: GoogleFonts.poppins(
                              fontSize: 34,
                              color: ColorManager.kTextColor,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'Rs ${widget.product.productPrice.toStringAsFixed(0)}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: ColorManager.kTextColor,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultButton(
                        text: 'Add to Cart',
                        press: () {
                          controller.addToCart(widget.product);
                        },
                        color: ColorManager.kPrimaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: ColorManager.white,
                          height: 10,
                        ),
                      ),
                      Text("Description",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: ColorManager.kTextColor)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.product.productDesc,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: ColorManager.kTextColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: ColorManager.white,
                          height: 4,
                        ),
                      ),
                      Text("Application Process",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: ColorManager.kTextColor)),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: SizeConfig.screenHeight * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: ColorManager.kPrimaryColor,
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(
                                isExpanded: true,
                                colors: ProgressBarColors(
                                  playedColor: ColorManager.kPrimaryColor,
                                  handleColor: ColorManager.kPrimaryColor,
                                ),
                              )
                            ],
                            topActions: <Widget>[
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  _controller.metadata.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.05)
                    ],
                  ),
                ),
              );
            }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Description",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
          textAlign: TextAlign.right,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Hero(
        tag: widget.product.productId.toString(),
        child: Stack(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.5,
              width: double.infinity,
              child: Image.network(
                widget.product.productImage,
                fit: BoxFit.cover,
              ),
            ),
            scroll(),
          ],
        ),
      ),
    );
  }
}
