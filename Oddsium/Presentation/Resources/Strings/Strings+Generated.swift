// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Copy {
  internal enum Tab {
    /// All Matches
    internal static let allMatches = Copy.tr("Localizable", "tab.allMatches", fallback: "All Matches")
    /// Calendar
    internal static let calendar = Copy.tr("Localizable", "tab.calendar", fallback: "Calendar")
    /// Favourites
    internal static let favourites = Copy.tr("Localizable", "tab.favourites", fallback: "Favourites")
    /// Menu
    internal static let menu = Copy.tr("Localizable", "tab.menu", fallback: "Menu")
    /// Localizable.strings
    ///   Oddsium
    /// 
    ///   Created by Samuel Kebis on 27/01/2023.
    internal static let myBets = Copy.tr("Localizable", "tab.myBets", fallback: "My Bets")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Copy {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
