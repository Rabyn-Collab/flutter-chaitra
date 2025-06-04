import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});
  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage>   {

  double _progress = 0;
  bool isLoad = false;

  late InAppWebViewController _controller;
  bool isError = false;




  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        var isLastPage = await _controller.canGoBack();
        if(isLastPage){
          _controller.goBack();
          return false;
        }
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            // toolbarHeight: 39,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: IconButton(onPressed: (){
              context.pop();
            }, icon: Icon(CupertinoIcons.arrow_left)),
          ),
          body: SafeArea(
              child: Stack(
                children: [
                  InAppWebView(
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                            transparentBackground: true
                        )),
                    // initialSettings: InAppWebViewSettings(
                    //     allowBackgroundAudioPlaying: false,
                    //     isPagingEnabled: true,
                    //     iframeAllowFullscreen: true,
                    //     isElementFullscreenEnabled: true,
                    //     transparentBackground: true
                    // ),
                    onReceivedServerTrustAuthRequest: (controller, challenge) async {
                      return ServerTrustAuthResponse(
                          action: ServerTrustAuthResponseAction.PROCEED
                      );
                    },
                    initialUrlRequest:
                    URLRequest(url: WebUri(widget.url )),
                    onWebViewCreated: (InAppWebViewController controller) {
                      _controller = controller;
                    },
                    onProgressChanged:
                        (InAppWebViewController controller, int progress) {
                      setState(() {
                        _progress = progress / 100;
                      });
                    },
                  ),
                  _progress < 1
                      ? Container(
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          color:Colors.black,
                          value: _progress,
                        ),
                      ],
                    ),
                  )
                      : SizedBox()
                ],
              )
          ),
        ),
      ),
    );
  }





}
