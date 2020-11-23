//
//  ContentView.swift
//  ContactListUITableViewDiffableDataSource
//
//  Created by Dawid Kubicki on 23/11/2020.
//

import SwiftUI

class DiffableTableViewController: UITableViewController {
    
    //UITableViewDiffableDataSource
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
}

struct DiffableContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        UINavigationController(rootViewController:
                                DiffableTableViewController(style: .insetGrouped))
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    typealias UIViewControllerType = UIViewController
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiffableContainer()
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
