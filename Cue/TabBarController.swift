import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        self.hero.modalAnimationType = .push(direction: .left)
        
       //  self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.clipsToBounds = true
        self.tabBar.selectedItem?.badgeColor = UIColor(named: "border")
        
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = UIColor(named: "border")
        
        let bgView: UIImageView = UIImageView(image: UIImage(named: "tab_bar"))
//        bgView.frame = CGRect(x: self.tabBar.frame.minX, y: self.tabBar.frame.minY, width: self.tabBar.bounds.width, height: self.tabBar.bounds.height)
        bgView.frame = self.tabBar.bounds
        print(self.tabBar.bounds)
        print(self.tabBar.frame)
        //self.tabBar.addSubview(bgView)
         self.tabBar.sendSubviewToBack(bgView)
         viewDidLayoutSubviews()
         loadViewIfNeeded()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.hero.modalAnimationType = .pull(direction: .right)
    }

}
