//
//  ViewController.swift
//  TagListViewDemo
//
//  Created by Dongyuan Liu on 2015-05-09.
//  Copyright (c) 2015 Ela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var biggerTagListView: TagListView!
    @IBOutlet weak var biggestTagListView: TagListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strings = ["TagListView", "TEAChart To Be Removed", "To Be Removed", "Quark Shell"]
        tagListView.delegate = self
        for str in strings {
            // Create Attachment
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: "add")
            // Set bound to reposition
            let imageOffsetY: CGFloat = -5.0
            imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 20, height: 20)
            // Create string with attachment
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            // Initialize mutable string
            let completeText = NSMutableAttributedString(string: "")
            // Add image to mutable string
            completeText.append(attachmentString)
            // Add your text to mutable string
            let textAfterIcon = NSAttributedString(string: str)
            completeText.append(textAfterIcon)
            tagListView.addTagAttributedString(completeText, buttonTitle: str, ImageWidth: 20)
        }
        
        
//        tagListView.addTag("TagListView")
//        tagListView.addTag("TEAChart")
//        tagListView.addTag("To Be Removed")
//        tagListView.addTag("To Be Removed")
//        tagListView.addTag("Quark Shell")
//        tagListView.removeTag("To Be Removed")
//        tagListView.addTag("On tap will be removed").onTap = { [weak self] tagView in
//            self?.tagListView.removeTagView(tagView)
//        }
        
        let tagView = tagListView.addTag("gray")
        tagView.tagBackgroundColor = UIColor.gray
        tagView.onTap = { tagView in
            print("Don’t tap me!")
        }

        tagListView.insertTag("This should be the third tag", at: 2)
        tagListView.enableRemoveButton = false
        biggerTagListView.delegate = self
        biggerTagListView.textFont = .systemFont(ofSize: 15)
        biggerTagListView.shadowRadius = 2
        biggerTagListView.shadowOpacity = 0.4
        biggerTagListView.shadowColor = UIColor.black
        biggerTagListView.shadowOffset = CGSize(width: 1, height: 1)
        biggerTagListView.addTag("Inboard")
        biggerTagListView.addTag("Pomotodo")
        biggerTagListView.addTag("Halo Word")
        biggerTagListView.alignment = .center
        
        biggestTagListView.delegate = self
        biggestTagListView.textFont = .systemFont(ofSize: 24)
        // it is also possible to add all tags in one go
        biggestTagListView.addTags(["all", "your", "tag", "are", "belong", "to", "us"])
        biggestTagListView.minWidth = 57
        biggestTagListView.alignment = .right
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TagListViewDelegate
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(tagView.buttonTitle)")
        tagView.isSelected = !tagView.isSelected
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
        sender.removeTagView(tagView)
    }
}

