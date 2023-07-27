//
//  ViewController.swift
//  StudyTimeCheck
//
//  Created by EUNSUNG on 2023/07/27.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Realm 파일 위치
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    

}

// 학생 클래스
class Student: Object {
    @objc dynamic var name: String = "" // 이름
    @objc dynamic var number: String = "" // 학번
    
    convenience init(name: String, number: String) {
        self.init()
        self.name = name
        self.number = number
    }
}
