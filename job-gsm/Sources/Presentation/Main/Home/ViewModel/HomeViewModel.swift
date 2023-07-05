//
//  HomeViewModel.swift
//  job-gsm
//
//  Created by 선민재 on 2023/06/28.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift
import Moya

class HomeViewModel: BaseViewModel, Stepper{

    struct Input {
        var viewWillAppear: Observable<Void>
        var companyCellDidselect: Observable<Float>
    }
    
    struct Output {
        var list: Observable<[HomeListResponse]>
    }
    
    func transform(input: Input) -> Output{
        let provider = MoyaProvider<JobServices>(plugins: [NetworkLoggerPlugin()])
        
        let listRelay = BehaviorRelay<[HomeListResponse]>(value: [])
        
        input.viewWillAppear
            .flatMap {
                Observable<[HomeListResponse]>.create { observer in
                    provider.request(.homeList(authorization: self.accessToken)) { result in
                        switch result {
                        case let .success(res):
                            print(self.accessToken)
                            let data = try? JSONDecoder().decode([HomeListResponse].self, from: res.data)
                            observer.onNext(data ?? [])
                            
                        case let .failure(err):
                            observer.onError(err)
                        }
                    }
                    return Disposables.create()
                }
            }
            .bind(to: listRelay)
            .disposed(by: disposeBag)
        
        input.companyCellDidselect
            .bind(with: self) { owner, idx in
//                Navigation step.accept()
                print(idx)
            }
            .disposed(by: disposeBag)
        
        return Output(
            list: listRelay.asObservable()
        )
    }

}
