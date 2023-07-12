import UIKit
import Then
import SnapKit

class MajorCell: UICollectionViewCell {
    static let identifier = "MajorCell"
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addView()
        self.setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var majorButton = UIButton().then {
        $0.setTitleColor(UIColor.b10, for: .normal)
        $0.titleLabel?.font = UIFont.JGFont(size: 14, family: .Regular)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.g30?.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private func addView() {
        [majorButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        majorButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.width.equalTo(60)
            $0.height.equalTo(32)
            $0.leading.equalToSuperview().offset(0)
        }
    }
}
    
