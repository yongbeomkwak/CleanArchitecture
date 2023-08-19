//
//  FetchAllUserUseCaseImpl.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift

struct FetchAllUserUseCaseImpl: FetchAllUserUseCase {
    
    private let userRepository: any UserRepository
    
    
    public init(_ repository: any UserRepository) {
        self.userRepository = repository
    }
    
    public func execute() -> Single<[User]> {
        self.userRepository.fetchAllUser()
    }
    
}
