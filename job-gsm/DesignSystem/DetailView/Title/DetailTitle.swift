import Foundation
import UIKit

public final class DetailTitle: UILabel {
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
        self.textColor = .b10
        self.font = UIFont.JGFont(size: 16, family: .Bold)
    }
}
