//
//  OnBoardingViewController.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/26.
//

import UIKit
import SnapKit
import Then

class OnBoardingViewController: BaseViewController<OnBoardingViewModel> {
    let vm = OnBoardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(){
        super.init(vm)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logo = UIImageView().then {
        $0.image = UIImage(named: "OnBoardingLogo.svg")
    }
    
    private let subText = UILabel().then {
        $0.text = "GSM의 채용 공고를\n간편하게 확인해보세요"
        $0.textColor = UIColor(
            red: 67/255,
            green: 142/255,
            blue: 1,
            alpha: 0.6
        )
        $0.font = UIFont.JGFont(
            size: 15,
            family: .Regular
        )
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    override func addView() {
        [logo, subText].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 3.44)
        }
        subText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(10)
        }
    }

}
