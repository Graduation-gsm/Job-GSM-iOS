//
//  HomeListCell.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/29.
//
import UIKit
import Then
import SnapKit

class HomeListCell: UICollectionViewCell {
    static let identifier = "HomeListCell"
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addView()
        self.setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var companyImage = UIImageView()

    var companyName = UILabel().then {
        $0.font = UIFont.JGFont(size: 16,family: .Medium)
        $0.textColor = UIColor.b10
    }
    
    var companyLocation = UILabel().then {
        $0.font = UIFont.JGFont(size: 12,family: .Regular)
        $0.textColor = UIColor.g20
    }
    
    var bookMarkButton = UIButton().then {
        $0.setImage(UIImage(named: "BookMarkIcon.svg"), for: .normal)
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.layer.cornerRadius = 12
    }
    
    private func addView() {
        [companyImage, companyName, companyLocation, bookMarkButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        companyImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.width.equalTo(156)
            $0.height.equalTo(94)
        }
        companyName.snp.makeConstraints {
            $0.top.equalTo(companyImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(0)
        }
        companyLocation.snp.makeConstraints {
            $0.top.equalTo(companyName.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(0)
        }
        bookMarkButton.snp.makeConstraints {
            $0.top.equalTo(companyImage.snp.top).offset(8)
            $0.trailing.equalTo(companyImage.snp.trailing).inset(8)
            $0.width.height.equalTo(24)
        }
    }
}
    
