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
    
    public init(fetchAllUserUseCase: FetchAllUserUseCase, seachUserUseCase: SeachUserUseCase) {
        self.fetchAllUserUseCase = fetchAllUserUseCase
        self.seachUserUseCase = seachUserUseCase
    }
    
    struct Input {
        
    }
    
    struct Output {
        let dataSource:PublishSubject<[User]> = .init()
    }
    
    public func transform(from input:Input) -> Output {
        
        let output = Output()
        
        self.fetchAllUserUseCase
            .execute()
            .asObservable()
            .bind(to:output.dataSource)
            .disposed(by: disposeBag)
        
     
        return output 
    }
    
}
