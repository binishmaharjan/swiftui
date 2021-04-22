//
//  SettingsLabel.swift
//  Fructus
//
//  Created by Maharjan Binish on 2021/04/21.
//

import SwiftUI

struct SettingsLabel: View {
    // MARK: Properties
    var labelText: String
    var labelImage: String
    
    // MARK: Body
    var body: some View {
        
        HStack {
            
            Text(labelText.uppercased())
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: labelImage)
            
        } //: HStak
        
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
