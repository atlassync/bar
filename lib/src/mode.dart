/// An enumeration representing the different modes available for the sidebar menu.
enum BarMode {
  /// Automatically adjusts the sidebar menu based on the screen size or other factors.
  /// 
  /// This mode is useful for responsive designs where the sidebar can change its
  /// appearance to best fit the available space.
  auto,

  /// Displays the sidebar menu in a compact form.
  ///
  /// In this mode, the sidebar takes up less space, showing icons or minimal content.
  /// This is ideal for scenarios where screen real estate is limited or a minimalistic
  /// design is desired.
  compact,

  /// Displays the sidebar menu in an expanded form.
  ///
  /// In this mode, the sidebar shows more detailed content, such as text labels or
  /// additional options. This is suitable for situations where the sidebar needs to
  /// provide more context or options to the user.
  expanded
}
