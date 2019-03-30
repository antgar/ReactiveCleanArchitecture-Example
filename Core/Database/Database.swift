//
//  Database.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift

protocol WriteableDatabase {
    func save<T: Storable>(object: T) throws
    func remove<T: Storable>(object: T) throws
}

protocol ReadableDatabase {
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?) -> Observable<[T]>
}

typealias Database = WriteableDatabase & ReadableDatabase
