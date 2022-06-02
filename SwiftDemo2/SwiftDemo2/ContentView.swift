//
//  ContentView.swift
//  SwiftDemo2
//
//  Created by ldd on 2022/5/24.
//

import SwiftUI

class ResultJson<T: Codable>: Codable {
    var state: Int?
    var data: T?
    var message: String?
}

class ContentViewModel: ObservableObject {
    @Published var blogs = [Blog]()

    init() {
        fetchData()
    }

    private func fetchData() {
        guard let url = URL(string: "https://itbug.shop/api/blog/list?page=1&pageSize=20") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ResultJson<BlogDataWithPage>.self, from: data)
                DispatchQueue.main.async {
                    self.blogs.append(contentsOf: result.data?.list ?? [Blog]())
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
        }.resume()
    }
}

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab: Tab = .home

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HomePage().appllyBg().tag(Tab.home)
                MessagePage().appllyBg().tag(Tab.message)
                SearchPage().appllyBg().tag(Tab.search)
                WritePage().appllyBg().tag(Tab.write)
                UserPage().appllyBg().tag(Tab.me)
            }
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

extension View {
    func appllyBg() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.green
            }
    }
}
