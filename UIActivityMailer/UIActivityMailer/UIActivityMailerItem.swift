//
//  UIActivityMailerItem.swift
//  UIActivityMailer
//
//  Created by Neil Francis Hipona on 23/11/2015.
//  Copyright © 2015 NFerocious. All rights reserved.
//

import Foundation


// MARK: - UIActivityMailerItem
// MARK: -

class UIActivityMailerItem: NSObject {
    
    var mailBody: String = "Hello"
    var mailSubject: String = "Hello"
    var isHTML: Bool = false
    
    var mailRecipients: [String]?
    var mailCcRecipients: [String]?
    var mailBccRecipients: [String]?
    
    var attachment: UIActivityMailerItemAttachment?
    
    /**
     * Instantiate with components
     */
    class func composeMailActivityItemComponents(mailBody mailBody: String, mailSubject: String, isHTML: Bool, mailRecipients: [String]?, mailCcRecipients: [String]?, mailBccRecipients: [String]?, attachment: UIActivityMailerItemAttachment?) -> UIActivityMailerItem {

        let mailAcitivityItem = UIActivityMailerItem()
        
        mailAcitivityItem.mailBody = mailBody
        mailAcitivityItem.mailSubject = mailSubject
        mailAcitivityItem.isHTML = isHTML
        
        mailAcitivityItem.mailRecipients = mailRecipients
        mailAcitivityItem.mailCcRecipients = mailCcRecipients
        mailAcitivityItem.mailBccRecipients = mailBccRecipients
        
        mailAcitivityItem.attachment = attachment
        
        return mailAcitivityItem
    }
}

// MARK: - UIActivityMailerItemAttachment
// MARK: -

class UIActivityMailerItemAttachment: NSObject {

    /**
     * Attachment Data
     */
    var attachmentData: NSData!
    
    /**
     * Attachment's mime-type ex: 'application/pdf'
     */
    var attachmentDataMimeType: String!
    
    /**
     * Attachment's file name
     */
    var attachmentDataFilename: String!
    
    /**
     * Initialize with non-nil or empty values
     */
    class func composeMailActivityItemAttachment(attachmentData attachmentData: NSData, attachmentDataMimeType: String, attachmentDataFilename: String) -> UIActivityMailerItemAttachment {
     
        let mailerItemAttachment = UIActivityMailerItemAttachment()
        mailerItemAttachment.attachmentData = attachmentData
        mailerItemAttachment.attachmentDataMimeType = attachmentDataMimeType
        mailerItemAttachment.attachmentDataFilename = attachmentDataFilename
        
        return mailerItemAttachment
    }

}