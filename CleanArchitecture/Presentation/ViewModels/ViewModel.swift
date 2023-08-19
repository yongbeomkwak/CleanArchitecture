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
        
        self.fetchAllUserUseCase
            .execute()
            .asObservable()
            .debug("HELLo")
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
    }
    
    struct Input {
        
    }
    
    struct Output {
        let dataSource:PublishSubject<[User]> = .init()
    }
    
    public func transform(from input:Input) -> Output {
        
        let output = Output()
        
     
        
     
        return output 
    }
    
}
