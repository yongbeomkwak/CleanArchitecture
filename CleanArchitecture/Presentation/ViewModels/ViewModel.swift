//
//  ViewModel.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
}

class ViewModel:ViewModelType {
    
    private let disposeBag = DisposeBag()
    private let fetchAllUserUseCase: FetchAllUserUseCase
    private let seachUserUseCase: SeachUserUseCase
    private let repository:UserRepository = UserRepositoryImpl(UserDataSourceImpl())
    
    public init() {
        self.fetchAllUserUseCase = FetchAllUserUseCaseImpl(repository)
        self.seachUserUseCase =  SeachUserUseCaseImpl(repository)
    }
    
    struct Input {
        var text:PublishRelay<String> = .init()
    }
    
    struct Output {
        let dataSource:BehaviorRelay<[User]> = .init(value: [])
    }
    
    public func transform(from input:Input) -> Output {
        
        let output = Output()
        

        input.text
            .withUnretained(self)
            .flatMap { (owner,name) -> Observable<[User]> in
                if name.isEmpty {
                    return self.fetchAllUserUseCase
                            .execute()
                            .asObservable()
                            .catch { error in
                                return Observable.empty()
                            }
                }
                
                else {
                    
                    return self.seachUserUseCase
                            .execute(name: name)
                            .asObservable()
                            .catch { error in
                                print(error)
                                return Observable.empty()
                    }
                }
                
                

                //return Observable.empty()
            }
            .debug("HELLO")
            .bind(to: output.dataSource)
            .disposed(by: disposeBag)
        

        
        
        
        
     
        return output 
    }
    
}
