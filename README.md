# odyssey_mobile

A digital schedule and information guide for Finały Ogólnopolskie Odysei Umysłu, organized by Odyssey of the Mind Polska foundation.

## Important info

Currently, the app undergoes a rewrite and switches to feature-based architecture.

Also, the app migrates to a new theming system with support multiple themes. Due to this, new theming classes have been added alonside the deprecated ones.

Hopefully, this chaotic period will soon end.

## Contribution (for Łappka Team)

### New theme System

Try not to use the deprecated classes and ways of accessing them from legacy code – they're incompatible with multiple themes (light, dark), which is our new requirement.

In my opinion we shouldn't use theme checks in code, such as isDark. Although the method can work with our current designs, it would be a big annoyance if we decide to implement a third theme (for instance, AMOLED black). An app with focus on children and playfulness is not a safe bet for strictly two themes.

Preffered method of accessing theme data is via widgets' specific ThemeExtensions. It's a robust solution with some boilerplate. It offers proper transitions between values, thanks to lerp() implementation. Theme Extensions also aggregate all styling information outside of widgets, akin to web (css for styling + html for content). On my end, I'll try to implement all the universal widgets in this way.

If color designations match between themes, direct access via their extension is also acceptable.

```dart
// BAD 
Color? color; 
color = AppColors.primaryOrange;

TextStyle? textStyle;
textStyle = AppTextStyles.h2;

color = isDark ? DarkTheme.grey700 : DarkTheme.grey100

// GOOD

// If there is a ThemeExtension for our extension
final ootmWidgetTheme = Theme.of(context).extension<OotmNavigationBarThemeData>();
color = ootmWidgetTheme.thisWidgetBackgroundColor;

// If color designations match up (they generally do for primary and accent colors. Greys tend to differ)
final AppColors colorExtension = Theme.of(context).c;
color = colorExtension.primary.color200;
```

### New Features
Please add new features to lib/features/${feature_name}.

Features don't have to include all typical layers or complete paths. They can combine various elements of a certain functionality. E.g. in-app updates:
- simple repository
- screen widget
- modal sheet widget

They should be user-presented / business functionalities. Can depend on each other, but should strive for internal cohesion.

### root-level folders
assets/ -> fonts, graphics, icons
lib/** -> mostly dart code

> Don't add new files to these folders, they should be removed after their dependent classes are refactored:
lib/consts -> DEPRECATED
lib/presentation -> DEPRECATED

> Previous architecture was heighly layer-specific and rewriting it requires time and testing. For now former domain and data folders have been put into core folder. Subject to refactoring.


> New folders:
lib/app -> contains application entry points and related components, router, and themes.
lib/config -> configuration variables and constants
lib/core -> fundamental building blocks used throughout the application, as well as util functions, validators. To some extent shared data and domain code
lib/features -> features
lib/widgets -> universal widgets

### Widgets
screens -> lib/features/${feature_name}
screen_specific widgets -> lib/features/${feature_name}
universal widgets, that are referenced from the features -> lib/widgets
components or shared elements of said widgets -> lib/widgets/elements

Please choose private Widgets over widget functions.

You can use OotmNavigationBar as an example.

## Resources for generating icons
https://www.fluttericon.com/
https://pub.dev/packages/icon_font_generator
https://github.com/fontello/fontello/wiki/How-to-use-custom-images#importing-svg-images
https://www.sitepoint.com/understanding-svg-fill-rule-property/

## Strange bugs
Xcode issues
https://stackoverflow.com/questions/79118572/xcode-16-and-ios-18-project-not-compiling
