//
//  RealmDatabase.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift
import RxRealm

public enum DatabaseError: Error {
    case noDatabase
    case objectNotSaved
}

public enum ConfigurationType {
    case basic(url: String?)
    case inMemory(identifier: String?)
    var associated: String? {
        switch self {
        case .basic(let url): return url
        case .inMemory(let identifier): return identifier
        }
    }
}

final class RealmDatabase: Database {
    private let configuration: ConfigurationType
    init(configuration: ConfigurationType = .basic(url: nil)) throws {
        self.configuration = configuration
    }
    private func instantiateRealm() -> Realm? {
        var rmConfig = Realm.Configuration()
        switch configuration {
        case .basic:
            rmConfig = Realm.Configuration.defaultConfiguration
            if let url = configuration.associated {
                rmConfig.fileURL = NSURL(string: url) as URL?
            }
        case .inMemory:
            rmConfig = Realm.Configuration()
            if let identifier = configuration.associated {
                rmConfig.inMemoryIdentifier = identifier
            }
        }
        return try? Realm(configuration: rmConfig)
    }
    
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?) -> Observable<[T]> {
        guard let realm = instantiateRealm(),
            let objectType = model as? Object.Type else {
                return Observable.empty()
        }
        var objects = realm.objects(objectType)
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        return Observable.collection(from: objects).map {result in
            return result.compactMap {$0 as? T}
        }
    }
    
    func save<T: Storable>(object: T) throws {
        guard let realm = instantiateRealm() else {
            throw DatabaseError.objectNotSaved
        }
        do {
            try realm.write {
                // swiftlint:disable force_cast
                realm.add(object as! Object, update: true)
                // swiftlint:enable force_cast
            }
        } catch {
            throw DatabaseError.objectNotSaved
        }
    }
    
    func remove<T: Storable>(object: T) throws {
        guard let realm = instantiateRealm() else {
            throw DatabaseError.objectNotSaved
        }
        do {
            try realm.write {
                // swiftlint:disable force_cast
                realm.delete(object as! Object)
                // swiftlint:enable force_cast
            }
        } catch {
            throw DatabaseError.objectNotSaved
        }
    }
}
