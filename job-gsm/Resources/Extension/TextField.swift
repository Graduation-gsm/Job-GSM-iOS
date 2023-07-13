import UIKit
import Foundation

extension UITextField {
    func leftPadding(width: Int){
        let iconContainerView: UIView = UIView(
            frame:CGRect(
                x: 0,
                y: 0,
                width: width,
                height: 30
            )
        )
        leftView = iconContainerView
        leftViewMode = .always
    }
        
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
}
