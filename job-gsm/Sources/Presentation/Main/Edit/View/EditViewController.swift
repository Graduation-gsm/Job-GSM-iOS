//
//  EditViewController.swift
//  job-gsm
//
//  Created by 선민재 on 2023/07/13.
//
import UIKit
import Then
import SnapKit

class EditViewController: BaseViewController<EditViewModel> {
    
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "수정하기"
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private let dividingLine = UIView().then {
        $0.backgroundColor = .g30
    }
    
    private let phoneNumText = UILabel().then {
        $0.text = "전화번호"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let phoneNumTextField = EditTextField(
        placeholder: "01055136475",
        width: 14,
        placeholderColor: .g20 ?? .gray
    )
    
    private let portfolioUrlText = UILabel().then {
        $0.text = "포트폴리오 링크"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let portfolioUrlTextField = EditTextField(
        placeholder: "https://www.youtube.com/watch?v=i-t8Ypasuiwmmm.asd",
        width: 14,
        placeholderColor: .g20 ?? .gray
    )
    
    private let emailText = UILabel().then {
        $0.text = "이메일"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let emailTextField = EditTextField(
        placeholder: "이메일 링크",
        width: 14,
        placeholderColor: .g20 ?? .gray
    )
    
    private let majorText = UILabel().then {
        $0.text = "전공"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let majorTextField = EditTextField(
        placeholder: "iOS",
        width: 14,
        placeholderColor: .g20 ?? .gray
    )

    
    override func addView() {
        [
            dividingLine,
            phoneNumText,
            phoneNumTextField,
            portfolioUrlText,
            portfolioUrlTextField,
            emailText,
            emailTextField,
            majorText,
            majorTextField
        ].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        dividingLine.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 7.315)
            $0.trailing.leading.equalToSuperview().inset(27)
            $0.height.equalTo(1)
        }
        phoneNumText.snp.makeConstraints {
            $0.top.equalTo(dividingLine.snp.bottom).offset(50)
            $0.leading.equalTo(view.snp.leading).offset(27)
        }
        phoneNumTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumText.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(27)
            $0.height.equalTo(44)
        }
        portfolioUrlText.snp.makeConstraints {
            $0.top.equalTo(phoneNumTextField.snp.bottom).offset(36)
            $0.leading.equalTo(view.snp.leading).offset(27)
        }
        portfolioUrlTextField.snp.makeConstraints {
            $0.top.equalTo(portfolioUrlText.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(27)
            $0.height.equalTo(44)
        }
        emailText.snp.makeConstraints {
            $0.top.equalTo(portfolioUrlTextField.snp.bottom).offset(36)
            $0.leading.equalTo(view.snp.leading).offset(27)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailText.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(27)
            $0.height.equalTo(44)
        }
        majorText.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(36)
            $0.leading.equalTo(view.snp.leading).offset(27)
        }
        majorTextField.snp.makeConstraints {
            $0.top.equalTo(majorText.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(27)
            $0.height.equalTo(44)
        }
    }
}
