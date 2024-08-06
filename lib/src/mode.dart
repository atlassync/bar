/// An enumeration representing the different modes available for the sidebar menu.
enum SideBarMode {
  /// Automatically adjusts the sidebar menu based on the screen size or other factors.
  ///
  /// This mode is useful for responsive designs, allowing the sidebar to dynamically
  /// adapt its appearance to fit the available space.
  auto,

  /// Displays the sidebar menu in a compact form.
  ///
  /// In this mode, the sidebar occupies less space, showing only icons or minimal content.
  /// It is ideal for scenarios where screen real estate is limited or a minimalistic design
  /// is preferred.
  compact,

  /// Displays the sidebar menu in an expanded form.
  ///
  /// In this mode, the sidebar shows more detailed content, such as text labels or additional
  /// options. It is suitable for situations where more context or functionality needs to be
  /// provided to the user.
  expanded
}
