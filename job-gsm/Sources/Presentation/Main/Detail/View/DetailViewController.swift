import UIKit
import SnapKit
import Then

class DetailViewController: BaseViewController<DetailViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailScrollView)
        addScrollView()
    }
    
    private let detailScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
    }
    
    private let backGroundView = UIView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func addScrollView() {
        detailScrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
            $0.trailing.equalTo(view.snp.trailing).offset(0)
            $0.leading.equalTo(view.snp.leading).offset(0)
        }
    }
    
    override func addView() {
        [backGroundView,companyImage, companyTitle, companyLocation, descriptionTitle, descriptionContent, businessTitle, businessContent,qualificationTitle, qualificationContent,preferentialTitle, preferentialContent,militaryServiceTitle, militaryServiceContent, humanResourcesInfoTitle, humanResourcesInfoContent].forEach {
            detailScrollView.addSubview($0)
        }
    }
    
    override func setLayout() {
        backGroundView.snp.makeConstraints {
            $0.edges.equalTo(detailScrollView.contentLayoutGuide)
            $0.width.equalTo(detailScrollView.frameLayoutGuide)
            $0.height.equalTo(detailScrollView.frameLayoutGuide).offset(150)
        }
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
        descriptionTitle.snp.makeConstraints {
            $0.top.equalTo(companyLocation.snp.bottom).offset(20)
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
    }
}
