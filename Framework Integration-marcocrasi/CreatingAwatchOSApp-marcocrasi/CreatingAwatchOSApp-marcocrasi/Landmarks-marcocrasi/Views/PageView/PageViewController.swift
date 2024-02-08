//
//  PageViewController.swift
//  Landmarks-marcocrasi
//
//  Created by Marcos Uriel Martinez Ortiz on 15/12/23.
//

import Foundation
import UIKit
import SwiftUI

// Structure representing a page controller in SwiftUI
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    // Array storing the views (pages) to be displayed in the page controller
    var pages: [Page]
    
    // Binding variable indicating the current page in the page controller
    @Binding var currentPage: Int
    
    // Function to create the coordinator for the page controller
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    
    // Function to create the UIPageViewController and configure it
    func makeUIViewController(context: Context) -> UIPageViewController {
        // Create an instance of UIPageViewController with scroll transition style and horizontal navigation orientation
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        // Set the coordinator as the data source and delegate for the page view controller
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        // Return the configured UIPageViewController
        return pageViewController
    }

    
    // Function to update the UIPageViewController when the underlying data model changes
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        // Set the view controllers in the UIPageViewController
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], // Array containing the current page's view controller
            direction: .forward, // Specify the direction of the transition (forward)
            animated: true // Indicate whether the transition should be animated
        )
    }

    
    // Coordinator class responsible for managing UIPageViewController data and navigation
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        // Reference to the parent PageViewController
        var parent: PageViewController
        
        // Array to store UIHostingControllers corresponding to each page
        var controllers = [UIViewController]()
        
        // Coordinator initializer
        init(_ pageViewController: PageViewController) {
            // Reference to the parent PageViewController
            parent = pageViewController
            
            // Map each page to a UIHostingController and store in the controllers array
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
    

        
        // Function to retrieve the view controller preceding the given view controller
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            // Retrieve the index of the given view controller in the controllers array
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            // Check if the given view controller is the first one
            if index == 0 {
                // If so, return the last view controller to create a circular page loop
                return controllers.last
            }
            
            // Return the view controller that precedes the given view controller
            return controllers[index - 1]
        }

        
        // Function to retrieve the view controller following the given view controller
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            // Retrieve the index of the given view controller in the controllers array
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            // Check if the given view controller is the last one
            if index + 1 == controllers.count {
                // If so, return the first view controller to create a circular page loop
                return controllers.first
            }
            
            // Return the view controller that follows the given view controller
            return controllers[index + 1]
        }

        
        // Function called when the animation of changing pages has finished
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            // Check if the transition animation has completed successfully
            guard completed,// Attempt to retrieve the currently visible view controller after the animation
                let visibleViewController = pageViewController.viewControllers?.first,
                // Attempt to find the index of the visible view controller in the array of controllers
                let index = controllers.firstIndex(of: visibleViewController) else { return }
            // Update the parent PageViewController's currentPage with the index of the visible view controller
            parent.currentPage = index
        }

        
    }
}
