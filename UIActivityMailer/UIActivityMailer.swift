//
//  UIActivityMailer.swift
//  UIActivityMailer
//
//  Created by Neil Francis Hipona on 23/11/2015.
//  Copyright © 2015 NFerocious. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

// MARK: - UIActivityMailer Info Dictionary
// MARK: -

/**
 * Mailer Info Dictionary
 */
private var UIActivityMailerInfo: NSDictionary = {
    
    if let UIActivityMailerPlistPath = NSBundle(forClass: UIActivityMailer.self).pathForResource("UIActivityMailer", ofType: "plist") {
        
        if let bundle = NSDictionary(contentsOfFile: UIActivityMailerPlistPath) {
            return bundle
        }
    }
    
    return [:]
}()

/**
 * Mailer Type
 */
private let UIActivityMailerType: String = {
    
    if let type = UIActivityMailerInfo.objectForKey("UIActivityMailerType") as? String {
        return type
    }
    
    return "UIActivityMailer"
}()

/**
 * Mailer Title
 */
private let UIActivityMailerTitle: String = {
    
    if let title = UIActivityMailerInfo.objectForKey("UIActivityMailerTitle") as? String {
        return title
    }
    
    return "Mailer"
}()

/**
 * Mailer Icon
 */
private let UIActivityMailerIcon: UIImage? = {
    
    if let iconName = UIActivityMailerInfo.objectForKey("UIActivityMailerType") as? String {
        return UIImage(named: iconName)
    }
    
    return UIImage(named: "UIActivityMailerIcon")
}()


// MARK: - UIActivityMailer
// MARK: -

class UIActivityMailer: UIActivity, MFMailComposeViewControllerDelegate {
    
    private var mailerActivityItem: UIActivityMailerItem!
    private weak var activeViewController: UIViewController!
    
    // Lock init to prevent user from initialization error
    private override init() {
        super.init()
        
    }
    
    /**
     * Initialize with active UIViewController
     */
    convenience init(presentInViewController viewController: UIViewController) {
        self.init()
        
        activeViewController = viewController
    }
    
    override class func activityCategory() -> UIActivityCategory {
        return .Share
    }
    
    override func activityType() -> String? {
        return UIActivityMailerType
    }
    
    override func activityTitle() -> String? {
        return UIActivityMailerTitle
    }
    
    
    override func activityImage() -> UIImage? {
        
        return UIActivityMailerIcon
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        
        let mailerActivityItems = activityItems.filter {
            $0.isKindOfClass(UIActivityMailerItem)
        }
        
        mailerActivityItem = mailerActivityItems.first as! UIActivityMailerItem
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        
        return activityItems.filter {
            $0.isKindOfClass(UIActivityMailerItem)
            }.count > 0 && MFMailComposeViewController.canSendMail()
    }
    
    override func performActivity() {
        
        let mailerViewController = MFMailComposeViewController()
        mailerViewController.setSubject(mailerActivityItem.mailSubject)
        
        mailerViewController.setToRecipients(mailerActivityItem.mailRecipients)
        mailerViewController.setCcRecipients(mailerActivityItem.mailCcRecipients)
        mailerViewController.setBccRecipients(mailerActivityItem.mailBccRecipients)
        
        mailerViewController.mailComposeDelegate = self
        mailerViewController.setMessageBody(mailerActivityItem.mailBody, isHTML: mailerActivityItem.isHTML)
        
        if let attachment = mailerActivityItem.attachment {
            mailerViewController.addAttachmentData(attachment.attachmentData, mimeType: attachment.attachmentDataMimeType, fileName: attachment.attachmentDataFilename)
        }
        
        activeViewController.presentViewController(mailerViewController, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismissViewControllerAnimated(true) { () -> Void in
            self.activityDidFinish(true)
        }
    }
}