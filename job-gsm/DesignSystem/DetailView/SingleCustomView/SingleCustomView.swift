import Foundation
import UIKit
import Then
import SnapKit

public final class SingleCustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let singleBackgroundView = UIView().then {
        $0.backgroundColor = .f20
        $0.layer.cornerRadius = 10
    }
    
    let firstIcon = UIImageView().then {
        $0.image = UIImage(named: "employmentCount.svg")
    }
    
    let firstLabel = UILabel().then {
        $0.text = "1명"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    let firstSubLabel = UILabel().then {
        $0.text = "채용 예정 인원"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        $0.font = UIFont.JGFont(size: 10, family: .Regular)
    }
    
    let secondIcon = UIImageView().then {
        $0.image = UIImage(named: "hireTime.svg")
    }
    
    let secondLabel = UILabel().then {
        $0.text = "5월 말 ~ 6월 초"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    let secondSubLabel = UILabel().then {
        $0.text = "채용 예정 시기"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        $0.font = UIFont.JGFont(size: 10, family: .Regular)
    }
    
    private func addView() {
        [singleBackgroundView, firstIcon,firstLabel,firstSubLabel, secondIcon, secondLabel, secondSubLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        singleBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(100)
        }
        firstIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(70)
        }
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(firstIcon.snp.bottom).offset(10)
            $0.centerX.equalTo(firstIcon.snp.centerX).offset(0)
        }
        firstSubLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(0)
            $0.centerX.equalTo(firstIcon.snp.centerX).offset(0)
        }
        secondIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().inset(70)
        }
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(secondIcon.snp.bottom).offset(10)
            $0.centerX.equalTo(secondIcon.snp.centerX).offset(0)
        }
        secondSubLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(0)
            $0.centerX.equalTo(secondIcon.snp.centerX).offset(0)
        }
    }
}
