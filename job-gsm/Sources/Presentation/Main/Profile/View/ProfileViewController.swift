import UIKit
import SnapKit
import Then

class ProfileViewController: BaseViewController<ProfileViewModel> {
    let vm = ProfileViewModel()
    private let cellName = ["전화번호","포트폴리오","지원한회사","전공"]
    private let cellDetail = ["01055136475",">","1","iOS"]


    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.layer.cornerRadius = 10
        userTableView.layer.masksToBounds = true
    }
    
    init() {
        super.init(vm)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private let userProfile = UIImageView().then {
        $0.image = UIImage(named: "dummyImg")
        $0.layer.cornerRadius = 50
        $0.layer.masksToBounds = true
    }
    
    private let userName = UILabel().then {
        $0.text = "선민재"
        $0.textColor = .b10
        $0.font = UIFont.JGFont(size: 16,family: .Medium)
    }
    
    private let userTableView = UITableView().then {
        $0.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.isScrollEnabled = false
    }
    
    override func addView() {
        [userProfile, userName, userTableView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        userProfile.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 8.54)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        userName.snp.makeConstraints {
            $0.top.equalTo(userProfile.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        userTableView.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset((bounds.height) / 19.33)
            $0.leading.equalToSuperview().offset(26)
            $0.trailing.equalToSuperview().inset(26)
            $0.bottom.equalTo(view.snp.bottom).inset((bounds.height) / 2.90)
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.cellName.text = cellName[indexPath.row]
        cell.cellDetail.text = (cellDetail[indexPath.row])
        cell.backgroundColor = .f20
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (bounds.height / 3.02) / 4
    }
}
