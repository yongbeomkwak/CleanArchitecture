//
//  UserDataSource.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift

protocol UserDataSource {
    
    func fetchAllUser() -> Single<[User]>
    func serachUser(id:String) -> Single<User>
}
