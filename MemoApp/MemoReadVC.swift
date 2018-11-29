//
//  MemoReadVC.swift
//  MemoApp
//
//  Created by 503-26 on 28/11/2018.
//  Copyright © 2018 memo. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    //데이터를 넘겨받을 변수
        //처음에는 데이터가 없으므로 ?를 붙인다.
        //데이터가 1개 일 때는 ()를 안써도 되고
        //데이터가 2개 이상이면 ()를 써서 참조형으로 만들어준다.
    var memo : MemoVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //데이터가 넘어오는지 확인
        //print(memo) - 옵셔널로 넘어옴
        //옵셔널은 그냥 사용하면 항상 경고가 뜸
        //하위 뷰는 뷰가 생성되는 것이기 때문에 viewDidLoad나 viewWillAppear나 똑같다.
        self.subject.text = memo?.title!
        self.content.text = memo?.content!
        self.img.image = memo?.image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
