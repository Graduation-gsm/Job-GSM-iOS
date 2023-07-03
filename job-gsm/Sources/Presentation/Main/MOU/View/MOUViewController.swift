import UIKit
import SnapKit
import Then

class MOUViewController: BaseViewController<MOUViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mouListCollectionView.dataSource = self
        mouListCollectionView.delegate = self
        mouListCollectionView.register(
            MOUListCell.self,
            forCellWithReuseIdentifier: MOUListCell.identifier
        )
    }
    
    private let logo = JGHomeLogo()
    
    private let mouListCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        $0.isScrollEnabled = true
    }
    
    override func addView() {
        [logo, mouListCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        logo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 10.15)
            $0.leading.equalToSuperview().offset(26)
        }
        mouListCollectionView.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().offset(0)
        }
    }
}

extension MOUViewController:
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MOUListCell.identifier, for: indexPath) as? MOUListCell else {
            return UICollectionViewCell()
        }
        
        cell.companyImage.image = UIImage(named: "DummyImage.svg")
        cell.companyName.text = "(주) 온더룩"
        cell.companyLocation.text = "서울시 강남구 어쩌구 저쩌구"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (
                156
            ),
            height: (
                148
            )
        )
    }
}

