//
//  SeachUserUseCaseImpl.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift

struct SeachUserUseCaseImpl: SeachUserUseCase {
    
    private let userRepository: any UserRepository
    
    
    public init(_ repository: any UserRepository) {
        self.userRepository = repository
    }
    
    public func execute(name: String) -> Single<[User]> {
        self.userRepository.serachUser(name: name)
    }
    
}
