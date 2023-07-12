//
//  FilterViewController.swift
//  job-gsm
//
//  Created by 선민재 on 2023/07/12.
//

import UIKit

class FilterViewController: BaseViewController<FilterViewModel> {
    
    private let majorName = ["iOS","FE","BE","AOS","Game","AI","Design","DevOps","기타"]

    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "기술 스택"
        super.viewDidLoad()
        majorCollectionView.dataSource = self
        majorCollectionView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(
            width: (
                60
            ),
            height: (
                32
            )
        )
        $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 27) //아이템 상하좌우 사이값 초기화
    }
    
    private let majorCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        $0.register(MajorCell.self, forCellWithReuseIdentifier: "MajorCell")
        $0.isScrollEnabled = true
    }
    
    override func addView() {
        [majorCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        majorCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalToSuperview().inset(27)
            $0.bottom.equalToSuperview().offset(500)
        }
    }
}

extension FilterViewController:
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MajorCell.identifier, for: indexPath) as? MajorCell else {
            return UICollectionViewCell()
        }
        cell.majorButton.setTitle(majorName[indexPath.row], for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (
                60
            ),
            height: (
                32
            )
        )
    }
}
