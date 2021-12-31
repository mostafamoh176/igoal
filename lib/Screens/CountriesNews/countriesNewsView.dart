import 'package:app_igoal/Screens/NextMatches/nextMatchesViewModel.dart';
import 'package:app_igoal/Widgets/customTextFields.dart';
import 'package:app_igoal/Widgets/topLogoWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_igoal/Screens/CountriesNews/countriesNewsViewModel.dart';
import 'dart:ui' as ui;

class CountriesNewsView extends StatefulWidget {
  bool istrue;
  CountriesNewsView({this.istrue});
  @override
  _CountriesNewsViewState createState() => _CountriesNewsViewState();
}

class _CountriesNewsViewState extends State<CountriesNewsView> {
  bool isExpanded = false;
  bool isExpandedCountry = false;
  bool isTabSelected_1 = false;
  NextMatchesViewModel nextMatchesViewModel = NextMatchesViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountriesNewsViewModel>(
        init: CountriesNewsViewModel(isTrue: widget.istrue),
        builder: (viewModel) {
          return Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      //  backBtn(),
                      if (widget.istrue) Expanded(child: TopLogoItem()),
                    ],
                  ),
                  searchTextField(viewModel),
                  (viewModel.searchCountriesList != null)
                      ? Expanded(
                          child: Container(
                            // color: Colors.orange,
                            padding: EdgeInsets.only(right: 20, top: 28),
                            child: Directionality(
                              textDirection: ui.TextDirection.rtl,
                              child: ListView.builder(
                                itemCount: viewModel.searchCountriesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print("searchCountriesList :" +
                                      viewModel.searchCountriesList.toString());
                                  return interNationalItem(
                                      viewModel.searchCountriesList[index],
                                      viewModel,
                                      index);
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        });
  }

  Widget interNationalItem(Countries country,
      CountriesNewsViewModel countriesNewsViewModel, int mainIndex) {
    print("mainIndex: $mainIndex");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            splashColor:Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor:Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () => countriesNewsViewModel.onExpansionChanged(mainIndex),
            child: Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  child: (country.countryLogoPath != null)
                      ? Image.network(country.countryLogoPath)
                      : Container(
                          child: Image.asset("assets/images/goal.png,"),
                        ),
                ),
                SizedBox(
                  width: 13,
                ),
                Text(
                  country.countryName,
                  style: Theme.of(context).primaryTextTheme.headline1,
                ),
                SizedBox(
                  width: 13,
                ),
                (country.isExpanded == false)
                    ? Icon(
                        Icons.navigate_next,
                      )
                    : Icon(
                        Icons.expand_more,
                        color: Color(0xffD7191D),
                      ),
              ],
            ),
          ),
          (country.isExpanded == true)
              ? Container(
                  height: (50 * country.data.length).toDouble(),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 4.5),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: country.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        print("index! $index");
                        return countryItem(country.data[index].data,
                            countriesNewsViewModel, index, mainIndex);
                      }),
                )
              : Container()
        ],
      ),
    );
  }

  subCountryItem(League) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 28,
            decoration:
                BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 13,
          ),
          Text(
            'City',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(
            width: 13,
          ),
        ],
      ),
    );
  }

  Widget countryItem(dynamic league, CountriesNewsViewModel viewModel,
      int index, int mainIndex) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 21),
      child: InkWell(
        splashColor:Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor:Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          if (viewModel.searchCountriesList[mainIndex].data[index].isFavorite ==
              false) {
            showCustomDialog(context, viewModel, league, index, mainIndex,
                title: "هذا سوف يترك التطبيق", okBtnFunction: () {});
          }
          if (viewModel.searchCountriesList[mainIndex].data[index].isFavorite ==
              true) {
            showCustomDialogDelete(context, viewModel, league, index, mainIndex,
                title: "", okBtnFunction: () {});
          }
        },
        child: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              child: (league["logo_path"] != null)
                  ? Image.network(league['logo_path'])
                  : Container(),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                splashColor:Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor:Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  if (viewModel.searchCountriesList[mainIndex].data[index]
                          .isFavorite ==
                      false) {
                    showCustomDialog(
                        context, viewModel, league, index, mainIndex,
                        title: "هذا سوف يترك التطبيق", okBtnFunction: () {});
                  }
                  if (viewModel.searchCountriesList[mainIndex].data[index]
                          .isFavorite ==
                      true) {
                    showCustomDialogDelete(
                        context, viewModel, league, index, mainIndex,
                        title: "", okBtnFunction: () {});
                  }
                },
                child: Text(
                  league['Arleagues'],
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Spacer(),
            (viewModel.isTrue == false)
                ? InkWell(
                splashColor:Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor:Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      if (viewModel.searchCountriesList[mainIndex].data[index]
                              .isFavorite ==
                          false) {
                        showCustomDialog(
                            context, viewModel, league, index, mainIndex,
                            title: "هذا سوف يترك التطبيق",
                            okBtnFunction: () {});
                      }
                      if (viewModel.searchCountriesList[mainIndex].data[index]
                              .isFavorite ==
                          true) {
                        showCustomDialogDelete(
                            context, viewModel, league, index, mainIndex,
                            title: "", okBtnFunction: () {});
                      }
                      //print(league);
                    },
                    child: Icon(
                      Icons.star,
                      color: (viewModel.searchCountriesList[mainIndex]
                                  .data[index].isFavorite ==
                              true)
                          ? Colors.red
                          : Colors.black45,
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget searchTextField(CountriesNewsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormTextField(
        prefixIcon: Icons.search,
        txtHint: 'بحث في الدوريات....',
        txtController: viewModel.txtSearchController,
        onChanged: (val) => viewModel.onSearchFilter(val),

        // enableBorderColor: Colors.white,
        // focusBorderColor: Colors.grey,
        textColor: Color(0xff5F5F5F),
      ),
    );
  }
}

showCustomDialog(BuildContext context, CountriesNewsViewModel viewModel,
    dynamic league, int index, int mainIndex,
    {@required String title, @required Function okBtnFunction}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Text(
                'اضافة',
                style: Theme.of(context).primaryTextTheme.headline1,
              )),
          content: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Text(
                'هل تريد اضافة الفريق',
                style: Theme.of(context).primaryTextTheme.headline1,
              )),
          actions: <Widget>[
            Directionality(
              textDirection: ui.TextDirection.rtl,
              child: Row(
                children: [
                  InkWell(
                      splashColor:Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor:Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        viewModel.onFavouriteSave(league, index, mainIndex);
                        Get.back();
                      },
                      child: Text(
                        "نعم",
                        style: Theme.of(context).primaryTextTheme.headline6,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                      splashColor:Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor:Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "لا",
                        style: Theme.of(context).primaryTextTheme.headline6,
                      )),
                ],
              ),
            ),
          ],
        );
      });
}

showCustomDialogDelete(BuildContext context, CountriesNewsViewModel viewModel,
    dynamic league, int index, int mainIndex,
    {@required String title, @required Function okBtnFunction}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Text(
                'حذف',
                style: Theme.of(context).primaryTextTheme.headline1,
              )),
          content: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Text(
                'هل تريد حذف الفريق',
                style: Theme.of(context).primaryTextTheme.headline1,
              )),
          actions: <Widget>[
            Directionality(
              textDirection: ui.TextDirection.rtl,
              child: Row(
                children: [
                  InkWell(
                      splashColor:Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor:Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        viewModel.onLeagueRemove(league, index, mainIndex);
                        Get.back();
                      },
                      child: Text(
                        "نعم",
                        style: Theme.of(context).primaryTextTheme.headline6,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  InkWell(
                      splashColor:Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor:Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "لا",
                        style: Theme.of(context).primaryTextTheme.headline6,
                      )),
                ],
              ),
            ),
          ],
        );
      });
}

const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpanionTile extends StatefulWidget {
  /// Creates a single-line [ListTile] with a trailing button that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const CustomExpanionTile({
    Key key,
    this.leading,
    @required this.title,
    this.subtitle,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
  })  : assert(initiallyExpanded != null),
        assert(maintainState != null),
        assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        ),
        super(key: key);

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget subtitle;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool> onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  final Color backgroundColor;

  /// A widget to display instead of a rotating arrow icon.
  final Widget trailing;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  /// Specifies whether the state of the children is maintained when the tile expands and collapses.
  ///
  /// When true, the children are kept in the tree while the tile is collapsed.
  /// When false (default), the children are removed from the tree when the tile is
  /// collapsed and recreated upon expansion.
  final bool maintainState;

  /// Specifies padding for the [ListTile].
  ///
  /// Analogous to [ListTile.contentPadding], this property defines the insets for
  /// the [leading], [title], [subtitle] and [trailing] widgets. It does not inset
  /// the expanded [children] widgets.
  ///
  /// When the value is null, the tile's padding is `EdgeInsets.symmetric(horizontal: 16.0)`.
  final EdgeInsetsGeometry tilePadding;

  /// Specifies the alignment of [children], which are arranged in a column when
  /// the tile is expanded.
  ///
  /// The internals of the expanded tile make use of a [Column] widget for
  /// [children], and [Align] widget to align the column. The `expandedAlignment`
  /// parameter is passed directly into the [Align].
  ///
  /// Modifying this property controls the alignment of the column within the
  /// expanded tile, not the alignment of [children] widgets within the column.
  /// To align each child within [children], see [expandedCrossAxisAlignment].
  ///
  /// The width of the column is the width of the widest child widget in [children].
  ///
  /// When the value is null, the value of `expandedAlignment` is [Alignment.center].
  final Alignment expandedAlignment;

  /// Specifies the alignment of each child within [children] when the tile is expanded.
  ///
  /// The internals of the expanded tile make use of a [Column] widget for
  /// [children], and the `crossAxisAlignment` parameter is passed directly into the [Column].
  ///
  /// Modifying this property controls the cross axis alignment of each child
  /// within its [Column]. Note that the width of the [Column] that houses
  /// [children] will be the same as the widest child widget in [children]. It is
  /// not necessarily the width of [Column] is equal to the width of expanded tile.
  ///
  /// To align the [Column] along the expanded tile, use the [expandedAlignment] property
  /// instead.
  ///
  /// When the value is null, the value of `expandedCrossAxisAlignment` is [CrossAxisAlignment.center].
  final CrossAxisAlignment expandedCrossAxisAlignment;

  /// Specifies padding for [children].
  ///
  /// When the value is null, the value of `childrenPadding` is [EdgeInsets.zero].
  final EdgeInsetsGeometry childrenPadding;

  @override
  _CustomExpanionTileState createState() => _CustomExpanionTileState();
}

class _CustomExpanionTileState extends State<CustomExpanionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<Color> _borderColor;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: ListTile(
              onTap: _handleTap,
              contentPadding: widget.tilePadding,
              // leading: widget.leading,
              title: widget.title,
              subtitle: widget.subtitle,
              trailing: widget.trailing ??
                  RotationTransition(
                    turns: _iconTurns,
                    child: const Icon(Icons.expand_more),
                  ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.subtitle1.color
      ..end = theme.accentColor;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColorTween.end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
        child: TickerMode(
          child: Padding(
            padding: widget.childrenPadding ?? EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: widget.expandedCrossAxisAlignment ??
                  CrossAxisAlignment.center,
              children: widget.children,
            ),
          ),
          enabled: !closed,
        ),
        offstage: closed);

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
