//
//  TableVC.swift
//  Rx_Login
//
//  Created by Keval Patel on 5/5/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Channel{
    let title: String
    let description: String
    let dj : String
    let url : String
}

class TableVC: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    let channels = [
    Channel(title: "Title_1", description: "Description_1", dj: "Dj_1", url: "Url_1"),
    Channel(title: "Title_2", description: "Description_2", dj: "Dj_2", url: "Url_2"),
    Channel(title: "Title_3", description: "Description_3", dj: "Dj_3", url: "Url_3"),
    Channel(title: "Title_4", description: "Description_4", dj: "Dj_4", url: "Url_4"),
    Channel(title: "Title_5", description: "Description_5", dj: "Dj_5", url: "Url_5"),
    Channel(title: "Title_6", description: "Description_6", dj: "Dj_6", url: "Url_6"),
    Channel(title: "Title_7", description: "Description_7", dj: "Dj_7", url: "Url_7"),
    Channel(title: "Title_8", description: "Description_8", dj: "Dj_8", url: "Url_8"),
    Channel(title: "Title_9", description: "Description_9", dj: "Dj_9", url: "Url_9"),
    Channel(title: "Title_10", description: "Description_10", dj: "Dj_10", url: "Url_10"),
    Channel(title: "Title_11", description: "Description_11", dj: "Dj_11", url: "Url_11"),
    ]
    var observableChannels : Observable<[Channel]>{
        return Observable.just(channels)
    }
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
        selectTableviewItem()
        
    }
    // Configure the cellforRow and number of rows => by binding tableview to observabel of channel model array
    func configureTableview(){
        observableChannels.bind(to: tblList.rx.items(cellIdentifier: "TableCell")){
            _ , channel, cell in
            if let cell = cell as? TableCell{
                cell.channel = channel
            }
            }.disposed(by: disposeBag)
    }
    // Configure the cellforRow and number of rows => by binding tableview to observabel of channel model array
    func selectTableviewItem(){
        tblList.rx.itemSelected.subscribe(onNext: {[weak self] indexPath in
            if let cell = self?.tblList.cellForRow(at: indexPath) as? TableCell{
                cell.selectedChannel = self?.channels[indexPath.row]
            }
            }).disposed(by: disposeBag)
    }
}
