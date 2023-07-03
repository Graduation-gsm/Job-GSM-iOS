import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class InsertInfoViewController: BaseViewController<InsertInfoViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "학생 정보 입력"
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = InsertInfoViewModel.Input(
            buttonDidTap: completeButton.rx.tap.asObservable()
        )
        viewModel.transVC(input: input)
    }

    private let phoneNumText = UILabel().then {
        $0.text = "전화번호"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let phoneNumTextField = JGTextField(
        placeholder: "01012341234( - 없이 작성 )",
        width: 14
    )
    
    private let emailText = UILabel().then {
        $0.text = "이메일"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let emailTextField = JGTextField(
        placeholder: "이메일을 입력해주세요",
        width: 14
    )
    
    private let linkText = UILabel().then {
        $0.text = "포트폴리오 링크"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let linkTextField = JGTextField(
        placeholder: "포트폴리오 링크를 입력해주세요",
        width: 14
    )
    
    private let majorText = UILabel().then {
        $0.text = "전공"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(
            size: 14,
            family: .Regular
        )
    }
    
    private let majorTextField = JGTextField(
        placeholder: "전공을 입력해주세요 (iOS, Android)",
        width: 14
    )
    
    private var completeButton = JGButton(title: "완료")
        
    override func addView() {
        [phoneNumText, phoneNumTextField, emailText, emailTextField, linkText, linkTextField, majorText, majorTextField, completeButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        phoneNumText.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 6)
            $0.leading.equalToSuperview().offset(26)
        }
        
        phoneNumTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumText.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(54)
        }
        
        emailText.snp.makeConstraints {
            $0.top.equalTo(phoneNumTextField.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(26)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailText.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(54)
        }
        
        linkText.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(26)
        }
        
        linkTextField.snp.makeConstraints {
            $0.top.equalTo(linkText.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(54)
        }
        
        majorText.snp.makeConstraints {
            $0.top.equalTo(linkTextField.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(26)
        }
        
        majorTextField.snp.makeConstraints {
            $0.top.equalTo(majorText.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(54)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(64)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(60)
        }
    }
}
