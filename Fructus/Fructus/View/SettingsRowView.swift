//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK: Enums & Structs
    enum RowType {
        case content(String)
        case link(RowLink)
    }
    
    struct RowLink {
        let linkLabel: String
        let linkDestination: String
    }
    
    // MARK: Properties
    var name: String
    var rowType: RowType
    
    // MARK: Body
    var body: some View {
        
        VStack {
            
            Divider()
                .padding(.vertical, 4)
            
            HStack {
                
                Text(name)
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                switch rowType {
                
                case .content(let content):
                    Text(content)
                    
                case .link(let rowLink):
                    
                    Link(rowLink.linkLabel, destination: URL(string: "https://\(rowLink.linkDestination)")!)
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                    
                } //: Switch
                
            } //: HStack
            
        } //: VStack
        
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            SettingsRowView(name: "Developer", rowType: .content("John / Jane"))
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            
            SettingsRowView(name: "Web", rowType: .link(.init(linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")))
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
