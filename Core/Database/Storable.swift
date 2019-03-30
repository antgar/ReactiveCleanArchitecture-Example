//
//  Storable.swift
//  Core
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import RealmSwift

protocol Storable {}

extension Object: Storable {}
