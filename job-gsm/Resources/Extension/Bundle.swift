import Foundation

// MARK: - Swift Bundle Accessor

private class BundleFinder {}

extension Foundation.Bundle {
    /// Since GCMS is a application, the bundle for classes within this module can be used directly.
    static let module = Bundle(for: BundleFinder.self)
}

// MARK: - Objective-C Bundle Accessor

@objc
public class JGResources: NSObject {
    @objc public class var bundle: Bundle {
        return .module
    }
}
