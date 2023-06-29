import Foundation
import UIKit

public final class JGLogo: UIImageView {
    required public init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    init(){
        super.init(frame: CGRect.zero)
        self.image = UIImage(named: "HomeLogo")
    }
//
//    convenience init() {
//        self.init()
//        self.image = UIImage(named: "HomeLogo")
//    }
}
