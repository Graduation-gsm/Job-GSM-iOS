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
    
    var firstMajorLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.g20?.cgColor
        $0.layer.cornerRadius = 5
        $0.textColor = .b10
        $0.textAlignment = .center
        $0.font = UIFont.JGFont(size: 12, family: .Regular)
    }
    
    var secondMajorLabel = UILabel().then {
        $0.isHidden = true
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.g20?.cgColor
        $0.layer.cornerRadius = 5
        $0.textColor = .b10
        $0.textAlignment = .center
        $0.font = UIFont.JGFont(size: 12, family: .Regular)
    }
    
    private func addView() {
        [companyImage, companyName, companyLocation, firstMajorLabel, secondMajorLabel].forEach {
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
        firstMajorLabel.snp.makeConstraints {
            $0.top.equalTo(companyLocation.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(0)
            $0.width.equalTo(60)
            $0.height.equalTo(26)
        }
        secondMajorLabel.snp.makeConstraints {
            $0.top.equalTo(companyLocation.snp.bottom).offset(6)
            $0.leading.equalTo(firstMajorLabel.snp.trailing).offset(6)
            $0.width.equalTo(60)
            $0.height.equalTo(26)
        }
    }
}
    
