//
//  ViewController.swift
//  MemeMaker
//
//  Created by akshay.m on 14/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    var topChoices = [CaptionOption]()
    var topChoice = CaptionOption(emoji: "😎", caption: "This is cool!")
    
    var bottomChoices = [CaptionOption]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentedControl.removeAllSegments()
        topChoices.append(topChoice)
        bottomChoices.append(topChoice)
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        setLabels()
    }

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        setLabels()
    }
    
    func setLabels() {
        topCaptionLabel.text = topChoices[topSegmentedControl.selectedSegmentIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomSegmentedControl.selectedSegmentIndex].caption
    }
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
}

