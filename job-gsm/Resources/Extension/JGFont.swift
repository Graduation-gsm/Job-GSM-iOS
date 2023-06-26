import UIKit

extension UIFont {
    
    enum Family: String {
        case Medium
        case Regular
        case Bold
    }
    
    static func JGFont(size: CGFloat = 10, family: Family = .Regular) -> UIFont {
        return UIFont(
            name: "NotoSansKR-\(family)",
            size: size
        ) ??
        systemFont(
            ofSize: 20,
            weight: .thin
        )
    }
}
