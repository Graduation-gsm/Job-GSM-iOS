//
//  DetailViewModel.swift
//  job-gsm
//
//  Created by 선민재 on 2023/07/05.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift
import Moya

class DetailViewModel: BaseViewModel, Stepper{
    var idx: Int
    
    init(idx: Int) {
        self.idx = idx
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output{
        return Output()
    }
}
