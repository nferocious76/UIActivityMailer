//
//  ViewController.swift
//  UIActivityMailer
//
//  Created by Neil Francis Hipona on 23/11/2015.
//  Copyright © 2015 NFerocious. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Create attachment data
        let image = UIImage(named: "mail-icon")!
        let attachmentData = UIImagePNGRepresentation(image)!
        
        let attachment = UIActivityMailerItemAttachment.composeMailActivityItemAttachment(attachmentData: attachmentData,
            attachmentDataMimeType: "image/png",
            attachmentDataFilename: "Attachment")
        
        // Create mail activity item
        let mailerActivityItem = UIActivityMailerItem.composeMailActivityItemComponents(mailBody: "Test Body String\n\nAnother Line",
            mailSubject: "Test Subject",
            isHTML: false,
            mailRecipients: ["nferocious76@gmail.com"],
            mailCcRecipients: nil,
            mailBccRecipients: nil,
            attachment: attachment)
        
        // Initialize our custom mailer
        let mailerActivity = UIActivityMailer(presentInViewController: self)
        
        // Initialize activity controller and pass our params
        // NOTE: you can add other items in 'activityItems:' to be read by apple UIActivity. 
        // Our 'UIActivityMailerItem' will only be read by our 'UIActivityMailer'
        let activityViewController = UIActivityViewController(activityItems: [mailerActivityItem], applicationActivities: [mailerActivity])
        
        activityViewController.excludedActivityTypes = [UIActivityTypeMail]
        
        presentViewController(activityViewController, animated: true, completion: nil)
    }
}

