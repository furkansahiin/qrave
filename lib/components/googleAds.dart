// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:velocity_x/velocity_x.dart';

// class GoogleAdsContainer extends StatefulWidget {
//   @override
//   _GoogleAdsContainerState createState() => _GoogleAdsContainerState();
// }

// class _GoogleAdsContainerState extends State<GoogleAdsContainer> {
//   BannerAd? _bannerAd;
//   bool _isBannerAdLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadBannerAd();
//   }

//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }

//   void _loadBannerAd() {
//     final adUnitId = 'YOUR_AD_UNIT_ID';
//     final adSize = AdSize.banner;

//     _bannerAd = BannerAd(
//       adUnitId: adUnitId,
//       size: adSize,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (_) {
//           setState(() {
//             _isBannerAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//         },
//       ),
//     );

//     _bannerAd!.load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: 
//       _isBannerAdLoaded
//           ? AdWidget(ad: _bannerAd!):
//            Container(height: 150, child: Center(child: "reklam alanı".text.make())),
//     );
//   }
// }
