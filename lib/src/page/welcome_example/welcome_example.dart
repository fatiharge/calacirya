import 'package:calacirya/src/base_welcome_widget_model.dart';
import 'package:calacirya/src/enum/asset_type.dart';
import 'package:calacirya/src/page/welcome_example/model/welcome_page_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// This class manages an example application of welcome screens using Calacirya's base widget model.
class WelcomeExample extends BaseWelcomeWidgetModel {
  /// List of data containing images and text for welcome screens.
  final List<WelcomePageData>? list;

  /// Creates a new instance of the WelcomeExample widget.
  ///
  /// The `list` parameter allows you to provide a custom list of welcome page data.
  const WelcomeExample({Key? key, this.list}) : super(key: key);

  @override
  State<WelcomeExample> createState() => _WelcomeExampleState();
}

class _WelcomeExampleState extends State<WelcomeExample> {
  late List<WelcomePageData> _list;
  final int imageFlex = 3;
  final int textFlex = 2;
  final int buttonFlex = 2;

  @override
  void initState() {
    super.initState();
    _list = widget.list ?? WelcomePageData.dummyList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            WelcomePageData item = _list[index];
            return _buildPage(index, item);
          },
        ),
      ),
    );
  }

  /// Returns the widgets composing the page content.
  Widget _buildPage(int index, WelcomePageData item) {
    final bool isLastPage = index == _list.length - 1;

    // Visual element (image or Lottie animation) widget
    Widget imageWidget = item.imageType == AssetType.lottie
        ? Lottie.asset(item.imagePath, package: item.calacirya ? "calacirya" : null)
        : Image.asset(item.imagePath, package: item.calacirya ? "calacirya" : null);

    // Text widget
    Widget textWidget = Center(
      child: Text(
        item.title,
        style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
      ),
    );

    // Complete button widget
    Widget buttonWidget = isLastPage
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => widget.completeWelcome(context),
                  child: const Text('Complete'),
                ),
              ),
            ],
          )
        : const SizedBox();

    // Page content widget
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Expanded(flex: imageFlex, child: imageWidget),
        Expanded(flex: textFlex, child: textWidget),
        Expanded(flex: buttonFlex, child: buttonWidget),
      ],
    );
  }
}
