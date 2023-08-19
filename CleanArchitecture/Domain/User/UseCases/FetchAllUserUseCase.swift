//
//  fetchAllUserUseCase.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation

import RxSwift

protocol FetchAllUserUseCase {
    
    func execute() -> Single<[User]>
    
}
