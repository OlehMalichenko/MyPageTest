//
//  PageViewController.swift
//  MyPageTest
//
//  Created by OlehMalichenko on 01.05.2018.
//  Copyright © 2018 OlehMalichenko. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    // MARK: - Get ViewControllers
    lazy var viewControllerList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcGreen = storyboard.instantiateViewController(withIdentifier: "GreenVC")
        let vcYellow = storyboard.instantiateViewController(withIdentifier: "YellowVC")
        let vcPink = storyboard.instantiateViewController(withIdentifier: "PinkVC")
        return [vcGreen, vcYellow, vcPink]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstVC = viewControllerList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let indexVC = self.viewControllerList.index(of: viewController) else {return nil}
        guard indexVC > 0 else {return nil}
        let previousIndex = indexVC - 1
        return self.viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexVC = self.viewControllerList.index(of: viewController) else {return nil}
        guard indexVC != viewControllerList.count - 1 else {return nil}
        let nextIndex = indexVC + 1
        return viewControllerList[nextIndex]
    }
}
