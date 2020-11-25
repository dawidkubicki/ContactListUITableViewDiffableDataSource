//
//  ContactCell.swift
//  ContactListUITableViewDiffableDataSource
//
//  Created by Dawid Kubicki on 25/11/2020.
//

import SwiftUI

class ContactViewModel: ObservableObject {
    @Published var name = ""
}


struct ContactRowView: View {
    
    @ObservedObject var viewModel: ContactViewModel
    
    var body: some View{
        HStack {
            Image(systemName: "person.fill")
            Text(viewModel.name)
            Spacer()
            Image(systemName: "star")
        }.padding(20)
    }
}

class ContactCell: UITableViewCell {
    
    let viewModel = ContactViewModel()
    
    lazy var row = ContactRowView(viewModel: viewModel)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //setup my SwiftUI view..
        
        let hostingController = UIHostingController(rootView: row)
        self.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        viewModel.name = "Something new"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
