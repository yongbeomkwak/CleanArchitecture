//
//  UserDataSourceImpl.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation
import RxSwift
import Alamofire

struct UserDataSourceImpl: UserDataSource {
    
    
    func fetchAllUser() -> Single<[User]> {
        
        return Single.create { single -> Disposable in
            
            AF.request(UserAPI.fetchAllUser)
                .responseDecodable(of: [UserDTO].self) { response in
                    
                    switch response.result {
                    case .success(let data):
                        single(.success(data.map{($0.toDomain())}))
                        
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            
            return Disposables.create()
        }
        
        
    }
    
    func serachUser(id: String) -> Single<User> {
        
        return Single.create { single -> Disposable in
            
            AF.request(UserAPI.fetchAllUser)
                .responseDecodable(of: UserDTO.self) { response in
                    
                    switch response.result {
                    case .success(let data):
                        single(.success(data.toDomain()))
                        
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            
            return Disposables.create()
        }
        
    }
    
    
    
    
}
