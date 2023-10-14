/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

import 'package:calacirya/abstract/base_welcome_page_model.dart';
import 'package:calacirya/enum/asset_type.dart';
import 'package:calacirya/page/welcome_example/model/welcome_page_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// This class manages an example application of welcome screens using Calacirya's base widget model.
class WelcomeExample extends BaseWelcomePageModel {
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
// List of data containing images and text for welcome screens.
  late List<WelcomePageData> _list;

// Flex value for the image section of the page.
  final int imageFlex = 3;

// Flex value for the text section of the page.
  final int textFlex = 2;

// Flex value for the button section of the page.
  final int buttonFlex = 2;

// Controller for managing the PageView.
  late PageController _pageController;

// The index of the currently displayed page.
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Listen to page changes and update _currentPage
    _pageController.addListener(_pageChanged);
    _list = widget.list ?? WelcomePageData.dummyList;
  }

  void _pageChanged() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  WelcomePageData item = _list[index];
                  return _buildPage(index, item);
                },
              ),
            ),
            _buildPageIndicators(),
          ],
        ),
      ),
    );
  }

  /// Returns a Row widget containing the page indicators.
  Widget _buildPageIndicators() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _list.length,
          (index) => Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _currentPage ? Colors.blue : Colors.grey,
            ),
          ),
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
