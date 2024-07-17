//
//  ViewController.swift
//  widgetClickSwiftDemo
//
//  Created by sunyc on 2024/7/17.
//

import UIKit
import ActivityKit

@available(iOS 16.2, *)
class ViewController: UIViewController {

    @IBOutlet weak var clickBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.clickBtn.layer.cornerRadius = 10
        self.clickBtn.backgroundColor = UIColor.cyan
    }

    @IBAction func createMethod(_ sender: UIButton) {
        if !self.checkLiveActivityIsAvailable() {
            return
        }
            
        let att  = ClickActivityWidgetAttributes(name: "ClickDemo")
        do {
            let activity = try Activity.request(
                attributes: att,
                content: .init(state: ClickActivityWidgetAttributes.ContentState(clickTitle: "Click Here"), staleDate: nil),
                pushType: nil
            )
            print("request to open id: \(activity.id)")
            self.showToast(message: "Create successful!")
        } catch (let error) {
            print("request to open error: \(error.localizedDescription)")
        }
    }
    
    func checkLiveActivityIsAvailable() -> Bool {
        if !self.isAreActivitiesEnabled() {
            return false
        }
        
        if self.activitiesCount() >= 1 {
            return false
        }
        
        return true
    }
    
    func isAreActivitiesEnabled() -> Bool {
        let isEnabled = ActivityAuthorizationInfo().areActivitiesEnabled
        if !isEnabled{
            self.showToast(message: "Activities are disabled")
        }
        return isEnabled
    }
    
    func activitiesCount() -> Int{
        let count = Activity<ClickActivityWidgetAttributes>.activities.count
        if count >= 1 {
            self.showToast(message: "There is already a live activity")
        }
        return count
    }
}

