import UIKit

public final class EditTextField: UITextField {
    required public init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    init(){
        super.init(frame: CGRect.zero)
    }
    
    convenience init(
        placeholder: String = "",
        width: Int = 0,
        placeholderColor: UIColor = .g20 ?? .gray
    ) {
        self.init()
        self.leftPadding(width: width)
        self.placeholder = placeholder
        self.setPlaceholderColor(placeholderColor)
        self.backgroundColor = .f20
        self.layer.cornerRadius = 8
        self.textColor = .b10
    }
    
    public override func becomeFirstResponder() -> Bool {
        let didBecomeFirstResponder = super.becomeFirstResponder()
        if didBecomeFirstResponder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.main?.cgColor
        }
        return didBecomeFirstResponder
    }

    public override func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        if didResignFirstResponder {
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
        }
        return didResignFirstResponder
    }
}
