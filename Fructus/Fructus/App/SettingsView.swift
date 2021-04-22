//
//  SettingsView.swift
//  Fructus
//
//  Created by Maharjan Binish on 2021/04/19.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var closeButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
        }
    }
    
    // MARK: Body
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    // MARK: Section 1
                    GroupBox(label:
                        
                        SettingsLabel(labelText: "Fructus", labelImage: "info.circle")
                    
                    ) {
                        
                        Divider()
                            .padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutirents, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                            
                        } //: HStack
                        
                        
                    } //: Group Box
                    
                    // MARK: Section 2
                    GroupBox(label:
                                
                        SettingsLabel(labelText: "Customization", labelImage: "paintbrusuh")
                             
                    ) {
                        
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts with the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            
                            if isOnboarding {
                                
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                                
                            } else {
                                
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                        
                    } //: Group Box
                    
                    // MARK: Section 3
                    GroupBox(label:
                                
                        SettingsLabel(labelText: "Application", labelImage: "apps.iphone")
                             
                    ) {
                        
                        SettingsRowView(name: "Developer", rowType: .content("John / Jane"))
                        SettingsRowView(name: "Designer", rowType: .content("Robert Petras"))
                        SettingsRowView(name: "Compatibility", rowType: .content("iOS 14"))
                        SettingsRowView(name: "WebSite", rowType: .link(.init(linkLabel: "SwiftUIMasterClass", linkDestination: "swiftuimasterclass.com")))
                        SettingsRowView(name: "Twitter", rowType: .link(.init(linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")))
                        SettingsRowView(name: "SwiftUI", rowType: .content("2.0"))
                        SettingsRowView(name: "Version", rowType: .content("1.1.0"))
                    }
                    
                } //: VStack
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(trailing: closeButton)
                .padding()
                
            } //: ScrollView
            
        } //: NavigationView
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
