//
//  PostDB.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers final class PostDB: Object {
    dynamic var userId: Int = 0
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var body: String = ""
    
    public init(userId: Int, id: Int, title: String, body: String) {
        super.init()
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
