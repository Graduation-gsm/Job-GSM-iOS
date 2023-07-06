import Foundation
import UIKit
import Then
import SnapKit

public final class FourCustomView: UIView {
    
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
        $0.image = UIImage(named: "Domotori.svg")
    }
    
    let firstLabel = UILabel().then {
        $0.text = "기숙사 X"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    let secondIcon = UIImageView().then {
        $0.image = UIImage(named: "dish.svg")
    }
    
    let secondLabel = UILabel().then {
        $0.text = "식사제공 (점심, 저녁)"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    let thridIcon = UIImageView().then {
        $0.image = UIImage(named: "dish.svg")
    }
    
    let thridLabel = UILabel().then {
        $0.text = "식대 X"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    let fourthIcon = UIImageView().then {
        $0.image = UIImage(named: "bus.svg")
    }
    
    let fourthLabel = UILabel().then {
        $0.text = "통근버스 X"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 14, family: .Regular)
    }
    
    private func addView() {
        [singleBackgroundView, firstIcon,firstLabel, secondIcon, secondLabel, thridIcon, thridLabel, fourthIcon, fourthLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        singleBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(186)
        }
        firstIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(70)
        }
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(firstIcon.snp.bottom).offset(10)
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
        thridIcon.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(70)
        }
        thridLabel.snp.makeConstraints {
            $0.top.equalTo(thridIcon.snp.bottom).offset(10)
            $0.centerX.equalTo(firstIcon.snp.centerX).offset(0)
        }
        fourthIcon.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().inset(70)
        }
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(fourthIcon.snp.bottom).offset(10)
            $0.centerX.equalTo(fourthIcon.snp.centerX).offset(0)
        }
    }
}
