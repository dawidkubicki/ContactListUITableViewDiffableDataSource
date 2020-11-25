//
//  ContentView.swift
//  ContactListUITableViewDiffableDataSource
//
//  Created by Dawid Kubicki on 23/11/2020.
//

import SwiftUI

enum SectionType {
    case ceo, peasants
}

struct Contact: Hashable {
    let name: String
}


class DiffableTableViewController: UITableViewController {
    
    //UITableViewDiffableDataSource
    
    lazy var source: UITableViewDiffableDataSource<SectionType, Contact> = .init(tableView: self.tableView) { (_, indexPath, contact) -> UITableViewCell? in
        
        let cell = ContactCell(style: .default, reuseIdentifier: nil)
        //cell.textLabel?.text = contact.name
        
        cell.viewModel.name = contact.name
        
        return cell
    }
    
    private func setupSource(){
        
        var snapshot = source.snapshot()
        snapshot.appendSections([.ceo, .peasants])
        snapshot.appendItems([
            .init(name: "1"),
            .init(name: "1")
        ], toSection: .ceo)
        
        snapshot.appendItems([
            .init(name: "1")
        ], toSection: .peasants)
        
        source.apply(snapshot)
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.text = section == 0 ? "CEO" : "Peasants"
        
        return label
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        setupSource()
    }
    
}

//UIViewControllerRepresentable it's a protocol that lets you use ViewController in SwiftUI
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
