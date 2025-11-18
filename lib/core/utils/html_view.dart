import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HTMLView extends StatelessWidget {
  final String htmlData;
  final EdgeInsets? padding;
  final bool enableScrolling;

  const HTMLView({
    Key? key,
    required this.htmlData,
    this.padding = const EdgeInsets.all(20.0),
    this.enableScrolling = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Dynamic font scaling based on screen size and accessibility settings
    final double fontScale = MediaQuery.of(context).textScaleFactor * (MediaQuery.of(context).size.width < 600 ? 0.95 : 1.0);

    // Define HTML styles with theme integration
    final Map<String, Style> htmlStyles = {
      'body': Style(
        margin: Margins.zero,
        padding: HtmlPaddings.zero,
        color: theme.textTheme.bodyMedium?.color ?? Colors.black87,
        fontFamily: 'Roboto',
      ),
      'table': Style(
        backgroundColor: isDarkMode ? Colors.grey[800] : const Color.fromARGB(0x20, 0xee, 0xee, 0xee),
        border: Border.all(color: theme.dividerColor.withOpacity(0.5)),
        padding: HtmlPaddings.all(8.0),
      ),
      'tr': Style(
        border: Border(bottom: BorderSide(color: theme.dividerColor.withOpacity(0.3))),
      ),
      'th': Style(
        padding:  HtmlPaddings.all(12.0),
        backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[200],
        fontWeight: FontWeight.w700,
        color: theme.textTheme.titleMedium?.color ?? Colors.black87,
        fontFamily: 'Roboto',
      ),
      'td': Style(
        padding:  HtmlPaddings.all(12.0),
        alignment: Alignment.topLeft,
        color: theme.textTheme.bodyMedium?.color ?? Colors.black87,
        fontFamily: 'Roboto',
      ),
      'h1': Style(
        color: theme.textTheme.displayLarge?.color ?? Colors.black87,
        fontSize: FontSize(32.0 * fontScale),
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.left,
        margin: Margins.only(bottom: 20.0, top: 16.0),
        fontFamily: 'Poppins',
      ),
      'h2': Style(
        color: theme.textTheme.displayMedium?.color ?? Colors.black87,
        fontSize: FontSize(26.0 * fontScale),
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.left,
        margin: Margins.only(bottom: 16.0, top: 12.0),
        fontFamily: 'Poppins',
      ),
      'h3': Style(
        color: theme.textTheme.displaySmall?.color ?? Colors.black87,
        fontSize: FontSize(22.0 * fontScale),
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.left,
        margin: Margins.only(bottom: 12.0, top: 8.0),
        fontFamily: 'Poppins',
      ),
      'h4': Style(
        color: theme.textTheme.headlineMedium?.color ?? Colors.black87,
        fontSize: FontSize(18.0 * fontScale),
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.left,
        margin: Margins.only(bottom: 8.0, top: 8.0),
        fontFamily: 'Poppins',
      ),
      'h5': Style(
        color: theme.textTheme.headlineSmall?.color ?? Colors.black87,
        fontSize: FontSize(16.0 * fontScale),
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.left,
        margin: Margins.only(bottom: 8.0, top: 8.0),
        fontFamily: 'Poppins',
      ),
      'h6': Style(
        color: theme.textTheme.titleLarge?.color ?? Colors.black87,
        fontSize: FontSize(14.0 * fontScale),
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.left,
        margin: Margins.only(bottom: 8.0, top: 8.0),
        fontFamily: 'Poppins',
      ),
      'p': Style(
        color: theme.textTheme.bodyMedium?.color ?? Colors.black87,
        fontSize: FontSize(16.0 * fontScale),
        textAlign: TextAlign.justify,
        margin: Margins.only(bottom: 16.0),
        lineHeight: LineHeight(1.6),
        fontFamily: 'Roboto',
      ),
      'span': Style(
        color: theme.textTheme.bodyMedium?.color ?? Colors.black87,
        fontSize: FontSize(16.0 * fontScale),
        textAlign: TextAlign.justify,
        fontFamily: 'Roboto',
      ),
      'a': Style(
        color: theme.colorScheme.primary,
        textDecoration: TextDecoration.underline,
        textDecorationColor: theme.colorScheme.primary.withOpacity(0.7),
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
      'ul': Style(
        margin: Margins.only(left: 16.0, bottom: 12.0),
        padding: HtmlPaddings.only(left: 16.0),
      ),
      'ol': Style(
        margin: Margins.only(left: 16.0, bottom: 12.0),
        padding: HtmlPaddings.only(left: 16.0),
      ),
      'li': Style(
        color: theme.textTheme.bodyMedium?.color ?? Colors.black87,
        fontSize: FontSize(16.0 * fontScale),
        margin: Margins.only(bottom: 8.0),
        fontFamily: 'Roboto',
      ),
    };

    // Widget to render HTML content with animation
    Widget htmlContent = AnimatedOpacity(
      opacity: htmlData.isNotEmpty ? 1.0 : 0.5,
      duration: const Duration(milliseconds: 100),
      child: Html(
        data: htmlData.isNotEmpty ? htmlData : '<p>No content available</p>',
        shrinkWrap: true,
        style: htmlStyles,
        onLinkTap: (url, _, __) {
          if (url != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Opening: $url'),
                action: SnackBarAction(
                  label: 'Open',
                  onPressed: () {
                    // Add URL launch logic here (e.g., using url_launcher)
                  },
                ),
              ),
            );
          }
        },
      ),
    );

    // Wrap in a container with a subtle gradient background
    Widget content = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDarkMode
              ? [Colors.grey[900]!, Colors.grey[850]!]
              : [Colors.white, Colors.grey[50]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.1),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(20.0),
          child: htmlContent,
        ),
      ),
    );

    // Conditionally wrap in SingleChildScrollView for scrolling
    return enableScrolling
        ? SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: content,
    )
        : content;
  }
}