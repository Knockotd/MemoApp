//
//  ViewController.swift
//  MemoApp
//
//  Created by 503-26 on 28/11/2018.
//  Copyright © 2018 memo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func moveMemo(_ sender: Any) {
        //하위 뷰 객체 생성
        let memoListVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoListVC") as? MemoListVC
        
        //하위 뷰 타이틀 정하기
        memoListVC?.navigationItem.title = "메모 목록"
    
        //페이지 이동
        self.navigationController?.pushViewController(memoListVC!, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

