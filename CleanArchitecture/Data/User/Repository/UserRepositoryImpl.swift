//
//  UserRepository.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift

struct UserRepositoryImpl:UserRepository {
    
    private let dataSource: any UserDataSource
    
    public init(_ dataSource:UserDataSource) {
        self.dataSource = dataSource
    }
    
    func serachUser(name: String) -> Single<[User]> {
        return dataSource.serachUser(name: name)
    }
    
    func fetchAllUser() -> Single<[User]> {
        return dataSource.fetchAllUser()
    }
    
    
   
    
}
