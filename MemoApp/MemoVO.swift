//
//  MemoVO.swift
//  MemoApp
//
//  Created by 503-26 on 28/11/2018.
//  Copyright © 2018 memo. All rights reserved.
//

import Foundation
import UIKit //UIImage가 에러가 떠서 작성

class MemoVO{
    var memoIdx : Int?
    var title : String?
    var content : String?
    var image : UIImage?
    var regdate : Date? //struct로 하면 ?를 안 써도 된다.
}
