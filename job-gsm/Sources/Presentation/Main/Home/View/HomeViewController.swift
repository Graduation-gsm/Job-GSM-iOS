import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Kingfisher

class HomeViewController: BaseViewController<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        homeListCollectionView.collectionViewLayout = layout
        getData()
    }
    
    private let homeLogo = JGHomeLogo()
    
    private var filterButton = UIButton().then {
        $0.setTitle("기술 스택", for: .normal)
        $0.setTitleColor(UIColor.main, for: .normal)
        $0.titleLabel?.font = UIFont.JGFont(size: 14, family: .Regular)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.g20?.cgColor
        $0.layer.cornerRadius = 8
    }
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(
            width: (
                147
            ),
            height: (
                180
            )
        )
        $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //아이템 상하좌우 사이값 초기화
    }
    
    private let homeListCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        $0.register(HomeListCell.self, forCellWithReuseIdentifier: "HomeListCell")
        $0.isScrollEnabled = true
    }
    
    func getData() {
        // MARK: Input
        let viewWillApeearObservable = self.rx.methodInvoked(#selector(viewWillAppear))
            .map { _ in }
            .asObservable()
        
        let companySelectedObservable = homeListCollectionView.rx.modelSelected(HomeListResponse.self)
            .asObservable()
            .map(\.idx)
        
        // MARK: Output
        let output = viewModel.transform(
            input: .init(
                viewWillAppear: viewWillApeearObservable,
                companyCellDidselect: companySelectedObservable
            )
        )
        
        output.list
            .bind(
                to: homeListCollectionView.rx.items(cellIdentifier: "HomeListCell", cellType: HomeListCell.self)
            ) { ip, item, cell in
                let url = URL(string: item.thumbnailUrl)
                cell.companyImage.kf.setImage(with: url, placeholder: UIImage(named: "DummyImage.svg"))
                cell.companyName.text = item.companyName
                cell.companyLocation.text = item.address
                cell.firstMajorLabel.text = item.major.first
                if item.major.count > 1 {
                    cell.secondMajorLabel.isHidden = false
                    cell.secondMajorLabel.text = item.major.last
                }
            }
            .disposed(by: disposeBag)
    }

    override func addView() {
        [homeLogo, filterButton, homeListCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        homeLogo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 10.15)
            $0.leading.equalToSuperview().offset(26)
        }
        filterButton.snp.makeConstraints {
            $0.top.equalTo(homeLogo.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(26)
            $0.width.equalTo(102)
            $0.height.equalTo(36)
        }
        homeListCollectionView.snp.makeConstraints {
            $0.top.equalTo(filterButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

//extension HomeViewController:
//    UICollectionViewDelegate,
//    UICollectionViewDelegateFlowLayout,
//    UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 16
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeListCell.identifier, for: indexPath) as? HomeListCell else {
//            return UICollectionViewCell()
//        }
//
//        cell.companyImage.image = UIImage(named: "DummyImage.svg")
//        cell.companyName.text = "(주) 온더룩"
//        cell.companyLocation.text = "서울시 강남구 어쩌구 저쩌구"
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(
//            width: (
//                156
//            ),
//            height: (
//                148
//            )
//        )
//    }
//}
//
