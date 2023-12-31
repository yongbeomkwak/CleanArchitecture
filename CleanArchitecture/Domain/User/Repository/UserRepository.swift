//
//  UserRepository.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation

import RxSwift

protocol UserRepository {
    
    func serachUser(name:String) -> Single<[User]>
    
    func fetchAllUser() -> Single<[User]>
    
}
