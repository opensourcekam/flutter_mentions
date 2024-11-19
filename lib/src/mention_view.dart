part of flutter_mentions;

class FlutterMentions extends StatefulWidget {
  FlutterMentions({
    required this.mentions,
    Key? key,
    this.defaultText,
    this.disableLocalSearch = false,
    this.suggestionPosition = SuggestionPosition.Bottom,
    this.suggestionListHeight = 300.0,
    this.suggestionListWidth = double.infinity,
    this.suggestionListPadding = EdgeInsets.zero,   
     this.onMarkupChanged,
    this.onMentionAdd,
    this.onSearchChanged,
    this.leading = const [],
    this.trailing = const [],
    this.suggestionListDecoration,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.readOnly = false,
    this.showCursor,
    this.maxLength,
    this.maxLengthEnforcement = MaxLengthEnforcement.none,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.onTap,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.appendSpaceOnAdd = true,
    this.hideSuggestionList = false,
    this.onSuggestionVisibleChanged,
    this.smartDashesType,
    this.smartQuotesType,
  }) : super(key: key);

  final SmartDashesType? smartDashesType;

  final SmartQuotesType? smartQuotesType;

  final bool hideSuggestionList;

  /// Disable local search/filter.
  final bool disableLocalSearch;

  /// default text for the Mention Input.
  final String? defaultText;

  /// Triggers when the suggestion list visibility changed.
  final Function(bool)? onSuggestionVisibleChanged;

  /// List of Mention that the user is allowed to triggered
  final List<Mention> mentions;

  /// Leading widgets to show before teh Input box, helps preseve the size
  /// size for the Portal widget size.
  final List<Widget> leading;

  /// Trailing widgets to show before teh Input box, helps preseve the size
  /// size for the Portal widget size.
  final List<Widget> trailing;

  /// Suggestion modal position, can be alligned to top or bottom.
  ///
  /// Defaults to [SuggestionPosition.Bottom].
  final SuggestionPosition suggestionPosition;

  /// Triggers when the suggestion was added by tapping on suggestion.
  final Function(Map<String, dynamic>)? onMentionAdd;

  /// Max height for the suggestion list
  ///
  /// Defaults to `300.0`
  final double suggestionListHeight;
   /// Max width for the suggestion list
   ///
   /// Defaults to `double.infinity`
   final double suggestionListWidth;

   /// Suggestion list Padding
   final EdgeInsets suggestionListPadding;
  /// A Functioned which is triggered when ever the input changes
  /// but with the markup of the selected mentions
  ///
  /// This is an optional porperty.
  final ValueChanged<String>? onMarkupChanged;

  final void Function(String trigger, String value)? onSearchChanged;

  /// Decoration for the Suggestion list.
  final BoxDecoration? suggestionListDecoration;

  /// Focus node for controlling the focus of the Input.
  final FocusNode? focusNode;

  /// Should selecting a suggestion add a space at the end or not.
  final bool appendSpaceOnAdd;

  /// The decoration to show around the text field.
  final InputDecoration decoration;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  ///
  /// Defaults to [TextInputAction.newline] if [keyboardType] is
  /// [TextInputType.multiline] and [TextInputAction.done] otherwise.
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subtitle1` text style from the current [Theme].
  final TextStyle? style;

  /// {@macro flutter.widgets.editableText.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.services.textInput.enableSuggestions}
  final bool enableSuggestions;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// If [maxLength] is set to this value, only the "current input length"
  /// part of the character counter is shown.
  static const int noMaxLength = -1;

  /// The maximum number of characters (Unicode scalar values) to allow in the
  /// text field.
  final int? maxLength;

  /// If true, prevents the field from allowing more than [maxLength]
  /// characters.
  ///
  /// If [maxLength] is set, [maxLengthEnforcement] indicates whether or not to
  /// enforce the limit, or merely provide a character counter and warning when
  /// [maxLength] is exceeded.
  final MaxLengthEnforcement maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.onChanged}
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [Decoration.enabled] property.
  final bool? enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The color to use when painting the cursor.
  ///
  /// Defaults to [ThemeData.cursorColor] or [CupertinoTheme.primaryColor]
  /// depending on [ThemeData.platform] .
  final Color? cursorColor;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to the brightness of [ThemeData.primaryColorBrightness].
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.rendering.editable.selectionEnabled}
  bool get selectionEnabled => enableInteractiveSelection;

  /// {@template flutter.material.textfield.onTap}
  /// Called for each distinct tap except for every second tap of a double tap.
  final GestureTapCallback? onTap;

  /// Callback that generates a custom [InputDecorator.counter] widget.
  ///
  /// See [InputCounterWidgetBuilder] for an explanation of the passed in
  /// arguments.  The returned widget will be placed below the line in place of
  /// the default widget built when [counterText] is specified.
  ///
  /// The returned widget will be wrapped in a [Semantics] widget for
  /// accessibility, but it also needs to be accessible itself.  For example,
  /// if returning a Text widget, set the [semanticsLabel] property.
  final InputCounterWidgetBuilder? buildCounter;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  /// {@macro flutter.widgets.editableText.autofillHints}
  /// {@macro flutter.services.autofill.autofillHints}
  final Iterable<String>? autofillHints;

  @override
  FlutterMentionsState createState() => FlutterMentionsState();
}

class FlutterMentionsState extends State<FlutterMentions> {
  AnnotationEditingController? controller;
  ValueNotifier<bool> showSuggestions = ValueNotifier(false);
  LengthMap? _selectedMention;
  String _pattern = '';

  Map<String, Annotation> mapToAnotation() {
    final data = <String, Annotation>{};

    // Loop over all the mention items and generate a suggestions matching list
    widget.mentions.forEach((element) {
      // if matchAll is set to true add a general regex patteren to match with
      if (element.matchAll) {
        data['${element.trigger}([A-Za-z0-9])*'] = Annotation(
          style: element.style,
          id: null,
          display: null,
          trigger: element.trigger,
          disableMarkup: element.disableMarkup,
          markupBuilder: element.markupBuilder,
        );
      }

      element.data.forEach(
        (e) => data["${element.trigger}${e['display']}"] = e['style'] != null
            ? Annotation(
                style: e['style'],
                id: e['id'],
                display: e['display'],
                trigger: element.trigger,
                disableMarkup: element.disableMarkup,
                markupBuilder: element.markupBuilder,
              )
            : Annotation(
                style: element.style,
                id: e['id'],
                display: e['display'],
                trigger: element.trigger,
                disableMarkup: element.disableMarkup,
                markupBuilder: element.markupBuilder,
              ),
      );
    });

    return data;
  }

 void _addMention(Map<String, dynamic> value) {
    final selectedMention = _selectedMention!;
    final trigger = widget.mentions.firstWhere((mention) =>
        selectedMention.str.startsWith(mention.trigger));

    final updatedText = controller!.text.replaceRange(
      selectedMention.start,
      selectedMention.end,
      '${trigger.trigger}${value['display']} ',
    );

    setState(() {
      controller!.text = updatedText;
      controller!.selection = TextSelection.fromPosition(
        TextPosition(offset: (selectedMention.start + value['display'].length + 1).toInt()),
      );
      _selectedMention = null;
      showSuggestions.value = false;
    });

    widget.onMentionAdd?.call(value);
  }

  void suggestionListerner() {
    final cursorPos = controller!.selection.baseOffset;

    if (cursorPos >= 0) {
      var _pos = 0;

      final lengthMap = <LengthMap>[];

      // split on each word and generate a list with start & end position of each word.
      List<String> textList = controller!.value.text.split(RegExp(r'(\s)'));

      _pattern = widget.mentions.map((e) => e.trigger).join('|');

      var mentionIndex = -2;

      List triggerList = widget.mentions.map((e) => e.trigger).toList();

      triggerList.forEach((element) {
        var triggerIndex = textList.lastIndexWhere((e) => e.contains(element));
        if (triggerIndex > mentionIndex) {
          mentionIndex = triggerIndex;
        }
      });

      if (textList.length - 1 > mentionIndex && mentionIndex != -1) {
        var nextWordIndex = mentionIndex + 1;

        var mention = textList[mentionIndex] + ' ' + textList[nextWordIndex];

        _pattern = widget.mentions.map((e) => e.trigger).join('|');

        // Filter the list based on the latest entered mention
        final list =
            widget.mentions.firstWhere((e) => mention.contains(e.trigger)).data;

        // Loop until the the mention is contain in given mention list or not
        while (list.indexWhere((element) {
              final displayName = element['display'].toLowerCase();
              return displayName == mention.substring(1).toLowerCase() ||
                  displayName.contains(mention.substring(1).toLowerCase());
            }) !=
            -1) {
          // Assign full name mention to the list if the mention is is exist in the list
          textList[mentionIndex] = mention;

          // Assign null to the next word because it's already concatenate to the mention index word
          textList[nextWordIndex] = "null";

          // If the word is exist on the next index then concatenate it otherwise break the loop
          if (textList.length - 1 > nextWordIndex) {
            // concatenate the next word to the mention and again iterate the while loop with condition of check weather the mention is available or in the list or  not
            mention = mention + ' ' + textList[++nextWordIndex];
          } else {
            break;
          }
        }
      }

      // Remove all the null entries from the list
      textList.removeWhere((element) => element == "null");

      textList.forEach((element) {
          lengthMap.add(
              LengthMap(str: element, start: _pos, end: _pos + element.length));

          _pos = _pos + element.length + 1;
        });

      final val = lengthMap.indexWhere((element) {
        _pattern = widget.mentions.map((e) => e.trigger).join('|');

        return element.end == cursorPos &&
            element.str.toLowerCase().contains(RegExp(_pattern));
      });

      showSuggestions.value = val != -1;

      if (widget.onSuggestionVisibleChanged != null) {
        widget.onSuggestionVisibleChanged!(val != -1);
      }

      setState(() {
        _selectedMention = val == -1 ? null : lengthMap[val];
      });
    }
  }

  void inputListeners() {
    if (widget.onChanged != null) {
      widget.onChanged!(controller!.text);
    }

    if (widget.onMarkupChanged != null) {
      widget.onMarkupChanged!(controller!.markupText);
    }

    if (widget.onSearchChanged != null && _selectedMention?.str != null) {
      final str = _selectedMention!.str.toLowerCase();

      widget.onSearchChanged!(str[0], str.substring(1));
    }
  }

@override
  void initState() {
    super.initState();

    final data = _mapToAnnotations();
    controller = AnnotationEditingController(data);

    if (widget.defaultText != null) {
      controller!.text = widget.defaultText!;
    }

    _pattern = widget.mentions.map((e) => e.trigger).join('|');

    controller!.addListener(_suggestionListener);
    controller!.addListener(_inputListener);
  }

  Map<String, Annotation> _mapToAnnotations() {
    final data = <String, Annotation>{};

    for (var mention in widget.mentions) {
      if (mention.matchAll) {
        data['${mention.trigger}([A-Za-z0-9]*)'] = Annotation(
          style: mention.style,
          id: null,
          display: null,
          trigger: mention.trigger,
          disableMarkup: mention.disableMarkup,
          markupBuilder: mention.markupBuilder,
        );
      }

      for (var item in mention.data) {
        data["${mention.trigger}${item['display']}"] = Annotation(
          style: mention.style,
          id: item['id'],
          display: item['display'],
          trigger: mention.trigger,
          disableMarkup: mention.disableMarkup,
          markupBuilder: mention.markupBuilder,
        );
      }
    }
    return data;
  }

   void _suggestionListener() {
    final cursorPos = controller!.selection.baseOffset;
    if (cursorPos >= 0) {
      final currentWord = _getWordAtCursor(cursorPos);
      if (currentWord.startsWith(RegExp(_pattern))) {
        _updateSuggestions(currentWord);
      } else {
        showSuggestions.value = false;
      }
    }
  }

    void _updateSuggestions(String currentWord) {
    showSuggestions.value = true;
    _selectedMention = LengthMap(
      str: currentWord,
      start: controller!.selection.baseOffset - currentWord.length,
      end: controller!.selection.baseOffset,
    );

    final trigger = currentWord[0];
    final searchQuery = currentWord.substring(1);
    widget.onSearchChanged?.call(trigger, searchQuery);
  }

  void _inputListener() {
    widget.onChanged?.call(controller!.text);
    widget.onMarkupChanged?.call(controller!.markupText);
  }

   String _getWordAtCursor(int cursorPos) {
    final text = controller!.text;
    final start = text.lastIndexOf(' ', cursorPos - 1) + 1;
    final end = text.indexOf(' ', cursorPos);
    return text.substring(start, end == -1 ? text.length : end);
  }

  @override
  void dispose() {
    controller!.removeListener(_suggestionListener);
    controller!.removeListener(_inputListener);
    controller!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(widget) {
    super.didUpdateWidget(widget);

    controller!.mapping = mapToAnotation();
  }

  @override
  Widget build(BuildContext context) {
   final suggestionList = _selectedMention != null
        ? widget.mentions.firstWhere((mention) =>
            _selectedMention!.str.startsWith(mention.trigger)).data
        : widget.mentions[0].data;

    return Container(
      child: PortalTarget(
         anchor: Aligned(
           follower: widget.suggestionPosition == SuggestionPosition.Bottom
               ? Alignment.topCenter
               : Alignment.bottomCenter,
           target: widget.suggestionPosition == SuggestionPosition.Bottom
               ? Alignment.bottomCenter
               : Alignment.topCenter,
         ),
         portalFollower: ValueListenableBuilder(
          valueListenable: showSuggestions,
          builder: (BuildContext context, bool show, Widget? child) {
            return show && !widget.hideSuggestionList
                ? ClipRRect( // Ensures content is clipped within bounds
              borderRadius: BorderRadius.circular(0),
              child: OptionList(
                suggestionListHeight: widget.suggestionListHeight,
                suggestionListWidth: widget.suggestionListWidth,
                suggestionBuilder: widget.mentions.first.suggestionBuilder,
                suggestionListDecoration: widget.suggestionListDecoration,
                data: suggestionList,
                onTap: (value) {
                  _addMention(value);
                  showSuggestions.value = false;
                },
              ),
            )
                : Container();
          },
        ),
        child: Row(
          children: [
            ...widget.leading,
            Expanded(
              child: TextField(
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                maxLength: widget.maxLength,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboardType,
                keyboardAppearance: widget.keyboardAppearance,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                style: widget.style,
                textAlign: widget.textAlign,
                textDirection: widget.textDirection,
                readOnly: widget.readOnly,
                showCursor: widget.showCursor,
                autofocus: widget.autofocus,
                autocorrect: widget.autocorrect,
                maxLengthEnforcement: widget.maxLengthEnforcement,
                cursorColor: widget.cursorColor,
                cursorRadius: widget.cursorRadius,
                cursorWidth: widget.cursorWidth,
                buildCounter: widget.buildCounter,
                autofillHints: widget.autofillHints,
                decoration: widget.decoration,
                expands: widget.expands,
                onEditingComplete: widget.onEditingComplete,
                onTap: widget.onTap,
                onSubmitted: widget.onSubmitted,
                enabled: widget.enabled,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                enableSuggestions: widget.enableSuggestions,
                scrollController: widget.scrollController,
                scrollPadding: widget.scrollPadding,
                scrollPhysics: widget.scrollPhysics,
                controller: controller,
                smartDashesType: widget.smartDashesType,
                smartQuotesType: widget.smartQuotesType,
              ),
            ),
            ...widget.trailing,
          ],
        ),
      ),
    );
  }
}