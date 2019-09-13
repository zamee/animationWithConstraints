

import UIKit

// A delay function
func delay(_ seconds: Double, completion: @escaping ()->Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewController: UIViewController {
  
  // MARK: IB outlets
  

  @IBOutlet var loginButton: UIButton!
  @IBOutlet var heading: UILabel!
  @IBOutlet var username: UITextField!
  @IBOutlet var password: UITextField!
  
  @IBOutlet var cloud1: UIImageView!
  @IBOutlet var cloud2: UIImageView!
  @IBOutlet var cloud3: UIImageView!
  @IBOutlet var cloud4: UIImageView!
  
    @IBOutlet weak var constraintCloud1: NSLayoutConstraint!
    @IBOutlet weak var constraintCloud2: NSLayoutConstraint!
    @IBOutlet weak var constraintCloud3: NSLayoutConstraint!
    @IBOutlet weak var constraintCloud4: NSLayoutConstraint!
    // MARK: further UI
  
  let spinner = UIActivityIndicatorView(style: .whiteLarge)
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
  
  var statusPosition = CGPoint.zero
  
  // MARK: view controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //set up the UI
    loginButton.layer.cornerRadius = 8.0
    loginButton.layer.masksToBounds = true
    
    spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
    spinner.startAnimating()
    spinner.alpha = 0.0
    loginButton.addSubview(spinner)
    
    status.isHidden = true
    status.center = loginButton.center
    view.addSubview(status)
    
    label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
    label.textAlignment = .center
    status.addSubview(label)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    constraintCloud1.constant -= view.frame.width
    constraintCloud2.constant -= view.frame.width
    constraintCloud3.constant -= view.frame.width
    constraintCloud4.constant -= view.frame.width
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

   UIView.animate(withDuration: 5, delay: 1, options: [.repeat, .curveLinear], animations: {

    self.constraintCloud1.constant = self.view.bounds.width * 1
    self.constraintCloud2.constant = self.view.bounds.width * 1
    self.constraintCloud3.constant = self.view.bounds.width * 1
    self.constraintCloud4.constant = self.view.bounds.width * 1

     self.view.layoutIfNeeded()
    
   }, completion: nil)
  }
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let nextField = (textField === username) ? password : username
    nextField?.becomeFirstResponder()
    return true
  }
  
}
