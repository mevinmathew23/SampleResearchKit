//
//  ViewController.swift
//  SampleResearchKit
//
//  Created by Meivn Mathew  g jjbkkb on 2/5/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func consentClicked(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func surveyClicked(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func activeTaskClicked(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ActiveTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
        let defaultFileManager = FileManager.default
        let documentDirectoryURL = defaultFileManager.urls(for: .documentDirectory, in: .userDomainMask)
        taskViewController.outputDirectory = documentDirectoryURL.first!
        //NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    }
    
    
    // MARK: - ORKTaskViewControllerDelegate Protocol
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        if(reason != ORKTaskViewControllerFinishReason.failed){
            taskViewController.dismiss(animated: true, completion: nil)
            let results = taskViewController.result.results
            print("\(results)")
        }
        
        
        //taskViewController.dismiss(animated: true, completion: nil)
    }

}

