import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids_stories/config/add_config.dart';
import 'package:kids_stories/widgets/mark_as_read_trait_widget.dart';

import '../models/story_model.dart';

class StoryDetailsScreen extends StatefulWidget {
  const StoryDetailsScreen({
    Key? key,
    required this.backgroundColor,
    required this.story,
  }) : super(key: key);

  final Color backgroundColor;
  final Story story;

  @override
  State<StoryDetailsScreen> createState() => _StoryDetailsScreenState();
}

class _StoryDetailsScreenState extends State<StoryDetailsScreen> {
  late BannerAd _bannerAd;
  late InterstitialAd _interstitialAd;
  bool _isBannerAdLoaded = false;
  bool _isInterstitialAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
    _initInterstitialAd();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdConfigurations().bannerAdUnitId,
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              setState(() {
                _isBannerAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, error) {}),
        request: const AdRequest());
    _bannerAd.load();
  }

  void _initInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdConfigurations().interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}));
  }
  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isInterstitialAdLoaded = true;

    _interstitialAd.fullScreenContentCallback= FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _interstitialAd.dispose();
        Navigator.of(context).pop();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _interstitialAd.dispose();
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Responsive values
    double titleFontSize = screenWidth * 0.06;
    double paragraphFontSize = screenWidth * 0.04;
    double paragraphSpacing = screenWidth * 0.03;
    double imageAspectRatio = 5 / 3;
    double sizedBoxHeight = screenWidth * 0.03;

    return WillPopScope(
      onWillPop: () async {
        if (_isInterstitialAdLoaded) {
          _interstitialAd.show();
        } else {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.story.title,
            style: GoogleFonts.aBeeZee(
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                  ),
            ),
            softWrap: true,
          ),
          backgroundColor: widget.backgroundColor,
        ),
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        body: Container(
          color: widget.backgroundColor,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: widget.story.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: imageAspectRatio,
                            child: Image.network(
                              widget.story.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ...widget.story.paragraphs
                      .map((paragraph) => Padding(
                            padding: EdgeInsets.only(bottom: paragraphSpacing),
                            child: Text(
                              "$paragraph\n",
                              style: GoogleFonts.aBeeZee(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: paragraphFontSize,
                                    ),
                              ),
                              softWrap: true,
                            ),
                          ))
                      .toList(),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mark as Read ?',
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      MarkAsRead(id: widget.story.id, isTappable: true),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: _bannerAd.size.height.toDouble(),
                    child: Center(
                      child: _isBannerAdLoaded
                          ? AdWidget(ad: _bannerAd)
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
