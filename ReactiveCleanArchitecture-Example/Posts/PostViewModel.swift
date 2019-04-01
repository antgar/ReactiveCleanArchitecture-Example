//
//  PostViewModel.swift
//  ReactiveCleanArchitecture-Example
//
//  Created by Antoine Garcia on 3/17/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

struct PostViewModel {
    struct Input {
        
    }
    
    struct Output {
        let posts: Driver<[Post]>
    }
    
    var input: Input
    var output: Output
    
    private let disposeBag = DisposeBag()
    init(useCase: PostUseCase) {
        let posts = useCase.getPosts().asDriver(onErrorJustReturn: [])
        self.input = Input()
        self.output = Output(posts: posts)
    }
}
