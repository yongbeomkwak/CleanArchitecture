//
//  UserDTO.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation

struct UserDTO:Codable{

    let id:String
    let user_id:String
    let password:String
    let salt:String
    let name:String
    let age:Int
    
}

extension UserDTO {
    func toDomain() ->User {
        
        return User(name: self.name)
        
        
    }
}
