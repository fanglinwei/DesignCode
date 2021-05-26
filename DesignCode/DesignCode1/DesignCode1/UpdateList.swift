//
//  UpdateList.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/22.
//

import SwiftUI

struct UpdateList: View {
    
    var updates = updateData
    
    @ObservedObject var store = UpdateStore()
    
    @State var isEidt = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: addUpdate) {
                    Text("Add Updates")
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(Color("background3"))
                .cornerRadius(8)
                
                List {
                    ForEach(store.updates) { item in
                        NavigationLink(
                            destination: UpdateDetail(update: item)) {
                            
                            HStack(spacing: 12.0) {
                                
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(item.title)
                                        .font(.headline)
                                    
                                    Text(item.text)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                        .lineSpacing(4)
                                        .frame( height: 50)
                                    
                                    Text(item.date)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 8.0)
                        
                    }
                    .onDelete(perform: removeUpdate)
                    .onMove(perform: moveUpdate)
                }
            }
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("Updates")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
    
    func addUpdate() {
        store.updates.append(Update.init(image: "Illustration1", title: "New title", text: "New text", date: "New date"))
    }
    
    func removeUpdate(at indexSet: IndexSet) {
        guard let index = indexSet.last else {
            return
        }
        store.updates.remove(at: index)
    }
    
    func moveUpdate(at indices: IndexSet, newOffset: Int) {
        store.updates.move(fromOffsets: indices, toOffset: newOffset)
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
