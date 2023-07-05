import UIKit
import SnapKit
import Then

class DetailViewController: BaseViewController<DetailViewModel> {
    private let cellName = ["회사 소개","주요 업무","자격요건","우대사항","채용절차", "병역특례 여부", "인사 담당자 정보"]
    private let cellDetail = ["온더룩은 패션 IT 회사입니다.","NodeJs 기반의 GraphQL 서버 운영 및 고도화","React-Native를 사용한 마켓 출시 경험이 있으신 분웹 서비스 개발부터 배포까지의 경험을 가지신 분테스트 작성/테스트 자동화 경험이 있으신 분웹사이트 성능 측정 및 최적화 경험이 있으신 분개발에 대한 열정을 갖고, 지속적이고 효과적으로 피드백을 주고 받는 분","React-Native를 사용한 마켓 출시 경험이 있으신 분웹 서비스 개발부터 배포까지의 경험을 가지신 분테스트 작성/테스트 자동화 경험이 있으신 분웹사이트 성능 측정 및 최적화 경험이 있으신 분개발에 대한 열정을 갖고, 지속적이고 효과적으로 피드백을 주고 받는 분", "서류검토 - 1차면접 - 2차면접(필요 시) - 최종합격", "병역특례 가입 예정", "직책 : 책임/n성명 : 오진석\n전화번호 : 01012341234"]
    
    override func viewDidLoad() {
        addScrollView()
        super.viewDidLoad()
    }
    
    private let detailScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let companyImage = UIImageView().then {
        $0.image = UIImage(named: "DummyImage.svg")
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
    
    private let detailTableView = UITableView().then {
        $0.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.isScrollEnabled = false
    }
    
    private func addScrollView() {
        view.addSubview(detailTableView)
    }
    
    override func addView() {
        [companyImage, companyTitle, companyLocation, detailTableView].forEach {
            detailScrollView.addSubview($0)
        }
    }
    
    override func setLayout() {
        companyImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
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
        detailTableView.snp.makeConstraints {
            $0.top.equalTo(companyLocation.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().offset(0)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.detailTitle.text = cellName[indexPath.row]
        cell.detailContent.text = (cellDetail[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 129
    }
}
