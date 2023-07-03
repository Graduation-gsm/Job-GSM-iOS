import UIKit
import Then
import SnapKit

class UserCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellName = UILabel().then {
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 16,family: .Medium)
    }
    
    let cellDetail = UILabel().then {
        $0.textColor = .g10
        $0.font = UIFont.JGFont(size: 14,family: .Regular)
    }
    
    func addView() {
        [cellName, cellDetail].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        cellName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
        }
        
        cellDetail.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24)
        }
    }
}
