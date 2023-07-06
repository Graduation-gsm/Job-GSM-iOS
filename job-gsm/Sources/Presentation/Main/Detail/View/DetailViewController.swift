import UIKit
import SnapKit
import Then

class DetailViewController: BaseViewController<DetailViewModel> {
    
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        super.viewDidLoad()
        view.addSubview(detailScrollView)
        addScrollView()
        majorLabel.firstMajorLabel.text = "iOS"
        majorLabel.secondMajorLabel.text = "BE"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private let detailScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
    }
    
    private let backGroundView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 20
    }
    
    private let companyImage = UIImageView().then {
        $0.image = UIImage(named: "dummy.svg")
    }
    
    private let companyTitle = UILabel().then {
        $0.text = "(주) 온더룩"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 18, family: .Bold)
    }
    
    private let companyLocation = UILabel().then {
        $0.text = "서울 강남구 어쩌구 저쩌구"
        $0.textColor = .g20
        $0.font = UIFont.JGFont(size: 12, family: .Regular)
    }
    
    private let majorLabel = MajorLabel()
    
    private let descriptionTitle = DetailTitle(text: "회사 소개")
    
    private let descriptionContent = DetailContent(text: "온더룩은 패션 IT 회사입니다.")
    
    private let businessTitle = DetailTitle(text: "주요 업무")
    
    private let businessContent = DetailContent(text: "NodeJs 기반의 GraphQL 서버 운영 및 고도화")
    
    private let qualificationTitle = DetailTitle(text: "자격요건")
    
    private let qualificationContent = DetailContent(text: "React-Native를 사용한 마켓 출시 경험이 있으신 분\n웹 서비스 개발부터 배포까지의 경험을 가지신 분\n테스트 작성/테스트 자동화 경험이 있으신 분\n웹사이트 성능 측정 및 최적화 경험이 있으신 분\n개발에 대한 열정을 갖고, 지속적이고 효과적으로 피드백을 주고 받는 분")
    
    private let preferentialTitle = DetailTitle(text: "우대사항")
    
    private let preferentialContent = DetailContent(text: "React-Native를 사용한 마켓 출시 경험이 있으신 분\n웹 서비스 개발부터 배포까지의 경험을 가지신 분\n테스트 작성/테스트 자동화 경험이 있으신 분\n웹사이트 성능 측정 및 최적화 경험이 있으신 분\n개발에 대한 열정을 갖고, 지속적이고 효과적으로 피드백을 주고 받는 분")
    
    private let procedureTitle = DetailTitle(text: "채용 절차")
    
    private let procedureContent = DetailContent(text: "서류검토 - 1차면접 - 2차면접(필요 시) - 최종합격")
    
    private let militaryServiceTitle = DetailTitle(text: "병역특례 여부")
    
    private let militaryServiceContent = DetailContent(text: "병역특례 가입 예정")
    
    private let humanResourcesInfoTitle = DetailTitle(text: "인사 담당자 정보")
    
    private let humanResourcesInfoContent = DetailContent(text: "직책 : 책임\n 성명 : 오진석\n 전화번호 : 01012341234")
    
    private let homePageTitle = DetailTitle(text: "홈페이지")
    
    private let homePageContent = DetailContent(text: "https://www.youtube.com/watch?v=i-t8YpaslB4")
    
    private let detailLinkTitle = DetailTitle(text: "별도 링크")
    
    private let detailLinkContent = DetailContent(text: "https://github.com/team-haribo/iOSpublishing-ain/blob/main/GOMS/Controller/LoginVC/LoginViewController.swift")
    
    private let hireInfoTitle = DetailTitle(text: "채용 정보")
    
    private let hireInfo = SingleCustomView()
    
    private let employmentTitle = DetailTitle(text: "사원 수")
    
    private let employment = SingleCustomView().then {
        $0.firstIcon.image = UIImage(named: "totalEmployment.svg")
        $0.secondIcon.image = UIImage(named: "swEmployment.svg")
        $0.firstLabel.text = "총 10명"
        $0.secondLabel.text = "SW 직무 3명"
        $0.firstSubLabel.isHidden = true
        $0.secondSubLabel.isHidden = true
    }
    
    private let companySizeTitle = DetailTitle(text: "회사 규모")
    
    private let companySize = SingleCustomView().then {
        $0.firstIcon.image = UIImage(named: "capital.svg")
        $0.secondIcon.image = UIImage(named: "annualSales.svg")
        $0.firstLabel.text = "170,000,000원"
        $0.secondLabel.text = "1,230,000,000원"
        $0.firstSubLabel.text = "자본금"
        $0.secondSubLabel.text = "연간매출"
    }
    
    private let moneyTitle = DetailTitle(text: "급여조건")
    
    private let money = SingleCustomView().then {
        $0.firstIcon.image = UIImage(named: "capital.svg")
        $0.secondIcon.image = UIImage(named: "annualSales.svg")
        $0.firstLabel.text = "170,000,000원"
        $0.secondLabel.text = "1,230,000,000원"
        $0.firstSubLabel.text = "현장실습 + 수습기간 3개월"
        $0.secondSubLabel.text = "정사원 채용 후"
    }
    
    private let welfareTitle = DetailTitle(text: "후생 조건")
    
    private let welfare = FourCustomView()
    
    private func addScrollView() {
        detailScrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
            $0.trailing.equalTo(view.snp.trailing).offset(0)
            $0.leading.equalTo(view.snp.leading).offset(0)
        }
        detailScrollView.addSubview(backGroundView)
        backGroundView.snp.makeConstraints {
            $0.top.equalTo(detailScrollView.snp.top).offset(0)
            $0.bottom.equalTo(detailScrollView.snp.bottom).offset(0)
            $0.trailing.equalTo(detailScrollView.snp.trailing).offset(0)
            $0.leading.equalTo(detailScrollView.snp.leading).offset(0)
            $0.width.equalTo(detailScrollView.snp.width).offset(0)
        }
    }
    
    override func addView() {
        [companyImage, companyTitle, companyLocation,majorLabel,descriptionTitle, descriptionContent, businessTitle, businessContent,qualificationTitle, qualificationContent,preferentialTitle, preferentialContent,militaryServiceTitle, militaryServiceContent, humanResourcesInfoTitle, humanResourcesInfoContent,homePageTitle, homePageContent, detailLinkTitle,detailLinkContent,hireInfoTitle,hireInfo, employmentTitle, employment, companySizeTitle, companySize, moneyTitle, money,welfareTitle,welfare].forEach {
            backGroundView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        companyImage.snp.makeConstraints {
            $0.top.equalTo(backGroundView.snp.top).offset(0)
            $0.trailing.leading.equalToSuperview().inset(0)
            $0.height.equalTo(243)
        }
        companyTitle.snp.makeConstraints {
            $0.top.equalTo(companyImage.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(26)
        }
        companyLocation.snp.makeConstraints {
            $0.top.equalTo(companyTitle.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(26)
        }
        majorLabel.snp.makeConstraints {
            $0.top.equalTo(companyLocation.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(26)
            $0.height.equalTo(26)
        }
        descriptionTitle.snp.makeConstraints {
            $0.top.equalTo(majorLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        descriptionContent.snp.makeConstraints {
            $0.top.equalTo(descriptionTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        businessTitle.snp.makeConstraints {
            $0.top.equalTo(descriptionContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        businessContent.snp.makeConstraints {
            $0.top.equalTo(businessTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        qualificationTitle.snp.makeConstraints {
            $0.top.equalTo(businessContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        qualificationContent.snp.makeConstraints {
            $0.top.equalTo(qualificationTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        preferentialTitle.snp.makeConstraints {
            $0.top.equalTo(qualificationContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        preferentialContent.snp.makeConstraints {
            $0.top.equalTo(preferentialTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        militaryServiceTitle.snp.makeConstraints {
            $0.top.equalTo(preferentialContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        militaryServiceContent.snp.makeConstraints {
            $0.top.equalTo(militaryServiceTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        humanResourcesInfoTitle.snp.makeConstraints {
            $0.top.equalTo(militaryServiceContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        humanResourcesInfoContent.snp.makeConstraints {
            $0.top.equalTo(humanResourcesInfoTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        homePageTitle.snp.makeConstraints {
            $0.top.equalTo(humanResourcesInfoContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        homePageContent.snp.makeConstraints {
            $0.top.equalTo(homePageTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        detailLinkTitle.snp.makeConstraints {
            $0.top.equalTo(homePageContent.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        detailLinkContent.snp.makeConstraints {
            $0.top.equalTo(detailLinkTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        hireInfoTitle.snp.makeConstraints {
            $0.top.equalTo(detailLinkContent.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        hireInfo.snp.makeConstraints {
            $0.top.equalTo(hireInfoTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(100)
        }
        employmentTitle.snp.makeConstraints {
            $0.top.equalTo(hireInfo.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        employment.snp.makeConstraints {
            $0.top.equalTo(employmentTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(100)
        }
        companySizeTitle.snp.makeConstraints {
            $0.top.equalTo(employment.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        companySize.snp.makeConstraints {
            $0.top.equalTo(companySizeTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(100)
        }
        moneyTitle.snp.makeConstraints {
            $0.top.equalTo(companySize.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        money.snp.makeConstraints {
            $0.top.equalTo(moneyTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(100)
        }
        welfareTitle.snp.makeConstraints {
            $0.top.equalTo(money.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        welfare.snp.makeConstraints {
            $0.top.equalTo(welfareTitle.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(186)
        }
    }
}
