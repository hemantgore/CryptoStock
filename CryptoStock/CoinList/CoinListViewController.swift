//
//  ViewController.swift
//  CryptoStock
//
//  Created by Hemant Gore on 25/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import UIKit

class CoinListViewController: UIViewController {
    
    var viewModel: CoinListViewModel! {
        didSet {
            print("Model set!!!")
        }
    }
    
    required convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view.backgroundColor = UIColor.green
        self.bindToViewModel()
        self.reloadData()
    }
    
    private func bindToViewModel() {
        self.viewModel.didUpdate = { [weak self] _ in
            self?.viewModelDidUpdate()
        }
    }
    
    private func viewModelDidUpdate() {
        //Update UI for updated model data
    }
    
    private func reloadData() {
        self.viewModel.reloadCoinList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

