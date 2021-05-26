//
//  DatabaseManager.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/26.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    public func test(){
        
        database.child("foo").setValue(["something": true])
    }
    
    
    
}
