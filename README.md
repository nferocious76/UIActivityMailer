![UIActivityMailer](http://vector.me/files/images/1/9/196007/e_mail_icon.jpg?raw=true 'UIActivityMailer')

## UIActivityMailer

`UIActivityMailer` is a custom sub class of UIActivity for UIActivityViewController.


### Features
- [x] Provides a custom mailing content from share sheet
- [x] Supports mail attachments
- [x] Full title, body, subject, recipients management
- [x] HTML option is available
- [x] Optimized and is build using swift
- [x] Provides safe initialization of 'UIActivityMailer'

Can be use with multiple UIActivityType option, just provide the other contents to be loaded.

Contributions are welcome!

### About

Thanks to everyone who has contributed and helped make this a fun project and community.

## Installation

### CocoaPods

To integrate, just add the following line to your `Podfile`:

```ruby
pod '****' - not yet supported
```

## Usage

Drag and drop UIActivityMailer folder. 

![Usage](http://i.imgur.com/dcpQwfZ.png?raw=true 'Settings')

Creating attachment data (Optional)

```Swift

// Create attachment data
let image = UIImage(named: "mail-icon")!
let attachmentData = UIImagePNGRepresentation(image)!
        
let attachment = UIActivityMailerItemAttachment.composeMailActivityItemAttachment(attachmentData: attachmentData,
    attachmentDataMimeType: "image/png",
    attachmentDataFilename: "Attachment")

```

Create mail activity item

```Swift

// Create mail activity item
let mailerActivityItem = UIActivityMailerItem.composeMailActivityItemComponents(mailBody: "Test Body String\n\nAnother Line",
    mailSubject: "Test Subject",
    isHTML: false,
    mailRecipients: ["nferocious76@gmail.com"],
    mailCcRecipients: nil,
    mailBccRecipients: nil,
    attachment: attachment)

```

Initialize our custom mailer

```Swift

// Initialize our custom mailer
let mailerActivity = UIActivityMailer(presentInViewController: self)

```

Initialize activity view controller and pass our params

```Swift

// Initialize activity controller and pass our params
// NOTE: you can add other items in 'activityItems:' to be read by apple UIActivity. 
// Our 'UIActivityMailerItem' will only be read by our 'UIActivityMailer'
let activityViewController = UIActivityViewController(activityItems: [mailerActivityItem], applicationActivities: [mailerActivity])
        
    activityViewController.excludedActivityTypes = [UIActivityTypeMail]
        
    presentViewController(activityViewController, animated: true, completion: nil)

```


## License

UIActivityMailer is available under the MIT license, see the [LICENSE](https://github.com/nferocious76/UIActivityMailer/blob/master/LICENSE) file for more information.