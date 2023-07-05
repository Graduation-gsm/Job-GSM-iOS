import Foundation
import UIKit

public final class MajorLabel: UILabel {
    required public init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    init(){
        super.init(frame: CGRect.zero)
    }
    convenience init(
        text: String = ""
    ) {
        self.init()
        self.text = text
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.g20?.cgColor
        self.layer.cornerRadius = 5
        self.textColor = .b10
        self.textAlignment = .center
        self.font = UIFont.JGFont(size: 12, family: .Regular)
    }
}
