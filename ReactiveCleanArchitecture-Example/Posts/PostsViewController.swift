//
//  ViewController.swift
//  ReactiveCleanArchitecture-Example
//
//  Created by Antoine Garcia on 3/16/19.
//  Copyright © 2019 antgar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class PostsViewController: UIViewController {

    var viewModel: PostViewModel!
    private let disposeBag = DisposeBag()
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.output
        .posts
        .drive(tableView.rx.items(cellIdentifier: "postCell", cellType: UITableViewCell.self)) { tv, post, cell in
            cell.textLabel?.text = post.title
            cell.textLabel?.numberOfLines = 0
        }.disposed(by: disposeBag)
    }
}

