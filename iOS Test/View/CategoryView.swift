//
//  CategoryView.swift
//  iOS Test
//
//  Created by Sazza on 31/5/22.
//

import SwiftUI


struct CategoryView: View {
    @State private var selectedStep: TabViewItem = .Nature
    @State private var scrollViewProxy: ScrollViewProxy?
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    Spacer(minLength: 75)
                    StepTabViewContainer
                    Spacer(minLength: 100)
                }
                VStack{
                    HStack{
                        Spacer()
                        StepsViewSection
                    }
                    .padding(.top, 30)
                    .padding(.bottom,10)
                    .background(
                        Color.black.opacity(0.4)
                    )
                    Spacer()
                }
            }
            .background(.black)
            /// Hides the image when scrolled
            .background(NavigationConfigurator { navigationConfigurator in
                navigationConfigurator.hidesBarsOnSwipe = true
            })
            /// Top Image
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("imgL")
                        .resizable()
                        .frame( height: 200)
                        .scaledToFill()
                        .padding(-2)
                }
            }
        }
        
    }
    
    
    /// Step tab view at the top
    private var StepsViewSection: some View {
        func captureScrollView(proxy: ScrollViewProxy) -> some View {
            DispatchQueue.main.async { scrollViewProxy = proxy }
            return EmptyView()
        }
        return ScrollView(.horizontal, showsIndicators: false, content: {
            ScrollViewReader { value in
                captureScrollView(proxy: value)
                HStack {
                    Spacer(minLength: 15)
                    ForEach(0..<TabViewItem.allCases.count, id: \.self, content: { id in
                        VStack(spacing: 5) {
                            
                            if selectedStep == TabViewItem.allCases[id]{
                                VStack {
                                    Text(TabViewItem.allCases[id].title)
                                        .font(.subheadline)
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 3)
                                        .foregroundColor(.yellow)
                                    
                                }
                            } else {
                                Text(TabViewItem.allCases[id].title)
                            }
                        }
                        .padding(.horizontal,10)
                        .foregroundColor(selectedStep == TabViewItem.allCases[id] ? .yellow : .white)
                        .onTapGesture {
                            UIImpactFeedbackGenerator().impactOccurred()
                            selectedStep = TabViewItem.allCases[id]
                            withAnimation { value.scrollTo(id + 2) }
                        }
                    })
                    Spacer(minLength: 15)
                }
            }
        })
    }
    
    /// Step tab view container
    private var StepTabViewContainer: some View {
        VStack {
            switch selectedStep {
            case .Nature:
                GridImageView(image: "img1")
            case .Colors:
                GridImageView(image: "img2")
            case .Texture:
                GridImageView(image: "img3")
            case .Superhero:
                GridImageView(image: "img4")
            case .Technology:
                GridImageView(image: "img5")
            case .Abstract:
                GridImageView(image: "img6")
            case .Animation:
                GridImageView(image: "img1")
            case .Cars:
                GridImageView(image: "img2")
            }
        }
    }
}

/// Tab view at the top
enum TabViewItem: String, CaseIterable {
    case Nature
    case Colors
    case Texture
    case Superhero
    case Technology
    case Abstract
    case Animation
    case Cars
    
    /// Custom title
    var title: String {
        String(reflecting: self)
            .replacingOccurrences(of: "iOS_Test.TabViewItem.", with: "")
            .capitalized
    }
    
}

/// Loads the navigation controller
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        let controller = UIViewController()
        DispatchQueue.main.async {
            if let navigationController = controller.navigationController {
                self.configure(navigationController)
                print("Successfully obtained navigation controller")
            } else {
                print("Failed to obtain navigation controller")
            }
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
