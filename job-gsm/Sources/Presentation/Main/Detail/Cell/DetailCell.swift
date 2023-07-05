import UIKit
import Then
import SnapKit

class DetailCell: UITableViewCell {
    static let identifier = "DetailCell"
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
        self.setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let detailTitle = UILabel().then {
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 16, family: .Bold)
    }
    
    let detailContent = UILabel().then {
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    private func addView() {
        [detailTitle, detailContent].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        detailTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview()
        }
        detailContent.snp.makeConstraints {
            $0.top.equalTo(detailTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
    
