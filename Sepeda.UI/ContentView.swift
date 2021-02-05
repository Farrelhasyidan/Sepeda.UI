//
//  ContentView.swift
//  Sepeda.UI
//
//  Created by Farrel hasyidan on 03/02/21.
//

import SwiftUI

// model data
struct ProductModel: Identifiable {
    let id: Int
    let namaProduk: String
    let fotoProduk: String
    let hargaProduk: Int
    let lokasi: String
    let ratingCount: Int
    let jumlahRating: Int
    
    init(id: Int, namaProduk: String, fotoProduk: String, hargaProduk: Int, lokasi: String, ratingCount: Int, jumlahRating: Int){
        
        self.id = id
        self.namaProduk = namaProduk
        self.fotoProduk = fotoProduk
        self.hargaProduk = hargaProduk
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}

struct ContentView: View {
    
    let data: [ProductModel] = [
        ProductModel(id: 1, namaProduk: "Polygon XTrada", fotoProduk: "foto1", hargaProduk: 2000000, lokasi: "Kab. Banyumas", ratingCount: 4, jumlahRating: 56),
        
        ProductModel(id: 2, namaProduk: "Polygon Heist", fotoProduk: "foto2", hargaProduk: 3000000, lokasi: "Kab. bogor", ratingCount: 5, jumlahRating: 50),
        
        ProductModel(id: 3, namaProduk: "Polygon Monarch", fotoProduk: "foto3", hargaProduk: 5000000, lokasi: "Kab. Brebes", ratingCount: 4, jumlahRating: 56),
        
        ProductModel(id: 4, namaProduk: "United Detroit", fotoProduk: "foto4", hargaProduk: 9000000, lokasi: "Kab. Pekalongan", ratingCount: 4, jumlahRating: 56),
        
        ProductModel(id: 5, namaProduk: "United Miami", fotoProduk: "foto5", hargaProduk: 9000000, lokasi: "Kab. Pemalang", ratingCount: 3, jumlahRating: 56),
        
        ProductModel(id: 6, namaProduk: "United Patrol", fotoProduk: "foto6", hargaProduk: 2000000, lokasi: "Kab. Banyumas", ratingCount: 4, jumlahRating: 56),
        
        ProductModel(id: 7, namaProduk: "Exotic M56", fotoProduk: "foto7", hargaProduk: 6000000, lokasi: "Kab. Banyumas", ratingCount: 5, jumlahRating: 56),
        
        ProductModel(id: 8, namaProduk: "Exotic J98", fotoProduk: "foto8", hargaProduk: 2000000, lokasi: "Kab. Banyumas", ratingCount: 4, jumlahRating: 56),
        
        ProductModel(id: 9, namaProduk: "Geino XTrada", fotoProduk: "foto9", hargaProduk: 8000000, lokasi: "Kab. Banyumas", ratingCount: 3, jumlahRating: 56),
        
        ProductModel(id: 10, namaProduk: "Pasific M898", fotoProduk: "foto10", hargaProduk: 2000000, lokasi: "Kab. Banyumas", ratingCount: 4, jumlahRating: 56)
    ]
    
    @State var jumlahKeranjang: Int = 0
    
    var body: some View {
  //      Product()
        NavigationView{
            ScrollView{
                ForEach(data) { row in
                    VStack(spacing: 10){
                        Product(data: row,jumlahproduk: self.$jumlahKeranjang)
                    }
                    .padding()
                }
            }
            .navigationTitle("Sepeda MTB")
            .navigationBarItems(
            trailing:
                HStack(spacing: 20){
                    Button(action: {print("")})
                    {
                        Image(systemName: "person.fill")
                    }
                    
                    keranjangView(jumlah: $jumlahKeranjang)
                }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct keranjangView: View {
    
    @Binding var jumlah: Int
    
    var body: some View {
        ZStack{
            Button(action: {print("")})
            {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Text("\(jumlah)")
                .foregroundColor(Color.white)
                .frame(width: 10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .offset(x: 10, y: -10)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: View {
    
    let data: ProductModel
    
    @Binding var jumlahproduk: Int
    
    var body: some View{
        VStack(alignment: .leading){
            //foto
            ZStack(alignment: .topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height:250)
                    .clipped()
                
                Button(action: {print("OK")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            
            Text (self.data.namaProduk)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            Text ("Rp. \(self.data.hargaProduk)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack{
                    ForEach(0..<self.data.ratingCount){
                        item in
                        Image(systemName: "strar fill")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            padding(.leading)
            padding(.trailing)
            
            Button(action: {print("ditambahkan")}){
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "cart")
                        Text("Tambah ke keranjang")
                            .font(.callout)
                            .padding()
                    }
                    Spacer()
                }
            }
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding()
            
            tambahKeranjang(jumlah: $jumlahproduk)
        }
        .background(Color("warna"))
        .cornerRadius(15)
        
    }
    
}
struct tambahKeranjang: View {
    
    @Binding var jumlah: Int
    
    var body: some View{
        Button(action: {self.jumlah += 1}){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah ke keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding()
    }
}
