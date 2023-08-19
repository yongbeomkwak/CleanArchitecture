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
            .flatMap { (owner,id) -> Observable<[User]> in
                
                return self.seachUserUseCase
                        .execute(id: id)
                        .map({[$0]})
                        .asObservable()
                        
                    
            }
            .debug("HELLO")
            .bind(to: output.dataSource)
            .disposed(by: disposeBag)
//        
//        self.fetchAllUserUseCase
//            .execute()
//            .asObservable()
//            .take(1)
//            .bind(to: output.dataSource)
//            .disposed(by: disposeBag)
        
        
        
        
     
        return output 
    }
    
}
