import Foundation
import UIKit
import Then
import SnapKit

public final class MajorLabel: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let firstMajorLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.g20?.cgColor
        $0.layer.cornerRadius = 5
        $0.textColor = .b10
        $0.textAlignment = .center
        $0.font = UIFont.JGFont(size: 12, family: .Regular)
    }
    
    let secondMajorLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.g20?.cgColor
        $0.layer.cornerRadius = 5
        $0.textColor = .b10
        $0.textAlignment = .center
        $0.font = UIFont.JGFont(size: 12, family: .Regular)
    }
    
    private func addView() {
        [firstMajorLabel, secondMajorLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        firstMajorLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.width.equalTo(60)
            $0.height.equalTo(26)
        }
        secondMajorLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalTo(firstMajorLabel.snp.trailing).offset(6)
            $0.width.equalTo(60)
            $0.height.equalTo(26)
        }
    }
}
