
import UIKit
import EFQRCode

class IDCardViewController: UIViewController {
    let userDefault = UserDefaults.standard

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var qrCodeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = self.userDefault.object(forKey: "userInfo") as? [String : Any]
        id.text = "\(user!["id"]!)"
        name.text = user!["name"]! as? String
        email.text = user!["email"]! as? String
        
        
        if let qrCode = EFQRCode.generate(
            content: "\(user!["id"]!)"
            ) {
            qrCodeView.image = UIImage(cgImage: qrCode)
            print("Create QRCode image success!")
        } else {
            print("Create QRCode image failed!")
        }
        
    }

    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.userDefault.removeObject(forKey: "userInfo")
        self.performSegue(withIdentifier: "logoutToMain", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}