import 'dart:io';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_state/features/feature_place_details/presntation/view/place_details.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinksService {
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  // id => property/imageId
  // type => propertyType(sell/rent)
  static Future<String> createDynamicLink(int id, int type,
      {String image = ""}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://realestatesapp.page.link',
        link: Uri.parse('https://realestatesapp.page.link/?id=$id&type=$type'),
        androidParameters: const AndroidParameters(
          packageName: "com.tripleq.real_state",
          minimumVersion: 0,
        ),
        iosParameters: const IOSParameters(
          bundleId: 'com.tripleq.real_state',
          minimumVersion: '0',
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
            title: '',
            // description: event.post?.excerpt,
            imageUrl: Uri.parse(image)),
        navigationInfoParameters:
            const NavigationInfoParameters(forcedRedirectEnabled: true));

    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    print('============>{${shortLink.shortUrl.toString()}}');
    return shortLink.shortUrl.toString();
  }

  static Future<void> shareData(
      BuildContext context, String image, String subject) async {
    final bytes = await rootBundle.load(image);
    final list = bytes.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/place3.png');
    file.writeAsBytesSync(list);
    List<String> imagePath = ['${tempDir.path}/place3.png'];
    final box = context.findRenderObject() as RenderBox?;
    Share.shareFiles(imagePath,
        text: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  static handleDeepLink(PendingDynamicLinkData dynamicLinkData) {
    PendingDynamicLinkData data = dynamicLinkData;
    Uri deepLink = data.link;
    if (deepLink.queryParameters.containsKey('type')) {
      var propertyType = deepLink.queryParameters['type'];
      int type = int.parse("$propertyType");
      var propertyId = deepLink.queryParameters['id']!;
      int id = int.parse(propertyId);

      switch (type) {
        case 0:
          {
            Get.to(() => PlaceDetails(
                  propertyId: id,
                  propertyType: type,
                ));
            break;
          }
        case 1:
          {
            Get.to(() => PlaceDetails(
                  propertyId: id,
                  propertyType: type,
                ));
            break;
          }
      }
    }
  }

  Future initDynamicLinks() async {
    // Get any initial links
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      handleDeepLink(initialLink);
    }
  }
}
