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
    var data: [HomeListResponse] = []

    struct Input {
        var viewWillAppear: Observable<Void>
        var companyCellDidselect: Observable<Int>
        var filterButtonDidTap: Observable<Void>
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
                            let responseData = res.data
                            do {
                                self.data = try JSONDecoder().decode([HomeListResponse].self, from: responseData)
                                observer.onNext(self.data ?? [])
                                
                            }catch(let err) {
                                print(String(describing: err))
                            }
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
                self.steps.accept(JGStep.detailIsRequired(idx: idx))
                print(idx)
            }
            .disposed(by: disposeBag)
        
        input.filterButtonDidTap.subscribe(
            onNext: pushFilter
        ) .disposed(by: disposeBag)
        
        
        return Output(
            list: listRelay.asObservable()
        )
    }
    
    func pushFilter() {
        self.steps.accept(JGStep.filterIsRequired)
    }

}
