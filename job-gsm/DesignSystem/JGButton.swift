import Foundation
import UIKit

public final class JGButton: UIButton {
    required public init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    init(){
        super.init(frame: CGRect.zero)
    }
    convenience init(
        title: String = ""
    ) {
        self.init()
        self.backgroundColor = .main
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.JGFont(size: 16, family: .Bold)
        self.layer.cornerRadius = 10
    }
}
