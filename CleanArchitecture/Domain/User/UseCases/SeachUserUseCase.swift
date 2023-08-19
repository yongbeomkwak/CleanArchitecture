//
//  SeachUserUseCase.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift

protocol SeachUserUseCase {
    
    func execute(id:String) -> Single<User>
    
}
