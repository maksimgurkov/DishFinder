import UIKit
import YandexMobileAds

class ViewController: UIViewController {

    lazy var adView: AdView = {
        let width = view.safeAreaLayoutGuide.layoutFrame.width
        let adSize = BannerAdSize.stickySize(withContainerWidth: width)

        let adView = AdView(adUnitID: "demo-banner-yandex", adSize: adSize)
        adView.translatesAutoresizingMaskIntoConstraints = false
        adView.delegate = self
        return adView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        adView.loadAd()
    }

    func showAd() {
        view.addSubview(adView)
        NSLayoutConstraint.activate([
            adView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            adView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

extension ViewController: AdViewDelegate {
    func adViewDidLoad(_ adView: AdView) {
        print(">>> YandexMobileAds \(#function)")
        showAd()
    }
}
