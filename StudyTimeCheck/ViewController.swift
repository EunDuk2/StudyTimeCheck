//
//  ViewController.swift
//  StudyTimeCheck
//
//  Created by EUNSUNG on 2023/07/27.
//

import UIKit
import RealmSwift
import UserNotifications

class ViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestNotificationAuthorization()
        scheduleLocalNotification()
    }
    
    // MARK: 알림 권한 요청
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("알림 권한 허용")
            } else {
                print("알림 권한 거부")
            }
        }
    }
    
    func scheduleLocalNotification() {
        // 알림 콘텐츠 생성
        let content = UNMutableNotificationContent()
        content.title = "로컬 알림 제목"
        content.body = "로컬 알림 내용"
        content.sound = UNNotificationSound.default
        // 로컬 알림의 추가 정보 설정 (옵션)
        content.badge = 1 // 앱 아이콘의 뱃지 카운트 변경

        // 로컬 알림 트리거 생성 (예: 5초 후에 알림이 뜨도록 설정)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // 로컬 알림 요청 생성
        let request = UNNotificationRequest(identifier: "EVENT_X_NOTIFICATION",
                                            content: content,
                                            trigger: trigger)

        // 요청 등록
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("로컬 알림 등록 실패: \(error.localizedDescription)")
            } else {
                print("로컬 알림 등록 성공!")
            }
        }
    }

    @IBAction func on(_ sender: Any) {
        let content = UNMutableNotificationContent()

        content.title = "This is title : Zedd"

        content.subtitle = "This is Subtitle : UserNotifications tutorial"

        content.body = "This is Body : 블로그 글 쓰기"

        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats:false)
        
        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
