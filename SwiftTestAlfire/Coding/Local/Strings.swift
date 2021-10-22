// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum InfoPlist {
    /// zhishuVideo
    internal static let cfBundleDisplayName = L10n.tr("InfoPlist", "CFBundleDisplayName")
  }
  internal enum Localizable {
    /// autoSystem
    internal static let autoSystem = L10n.tr("Localizable", "autoSystem")
    /// Bluetooth
    internal static let bluetoothKey = L10n.tr("Localizable", "bluetoothKey")
    /// zhishuVideo
    internal static let cfBundleDisplayName = L10n.tr("Localizable", "CFBundleDisplayName")
    /// dark
    internal static let dark = L10n.tr("Localizable", "dark")
    /// darkMode
    internal static let darkModeKey = L10n.tr("Localizable", "darkModeKey")
    /// Home
    internal static let homeKey = L10n.tr("Localizable", "homeKey")
    /// light
    internal static let light = L10n.tr("Localizable", "light")
    /// local
    internal static let localKey = L10n.tr("Localizable", "localKey")
    /// movie
    internal static let movieKey = L10n.tr("Localizable", "movieKey")
    /// music
    internal static let musicKey = L10n.tr("Localizable", "musicKey")
    /// search
    internal static let searchKey = L10n.tr("Localizable", "searchKey")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
