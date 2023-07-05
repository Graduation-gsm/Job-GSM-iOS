import Foundation
import UIKit

public final class DetailContent: UILabel {
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
        self.font = UIFont.JGFont(size: 14, family: .Regular)
    }
}
