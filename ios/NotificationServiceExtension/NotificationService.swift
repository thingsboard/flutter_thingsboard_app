import UIKit
import UniformTypeIdentifiers
import UserNotifications

/// Attaches the icon configured in the ThingsBoard notification template
/// (`icon.icon` + `icon.color` data keys) to incoming pushes before iOS
/// displays them (PROD-7932). Runs only when the APNs payload carries
/// `mutable-content: 1`.
///
/// The glyph is drawn from the Flutter icon fonts bundled in the containing
/// app (MaterialIcons / MaterialDesignIcons); the name-to-codepoint map is
/// generated into icon_map.json from the same maps the Dart side uses. Any
/// failure falls back to delivering the notification unchanged.
class NotificationService: UNNotificationServiceExtension {

    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(
        _ request: UNNotificationRequest,
        withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
    ) {
        self.contentHandler = contentHandler

        guard let content = request.content.mutableCopy() as? UNMutableNotificationContent else {
            contentHandler(request.content)
            return
        }
        bestAttemptContent = content

        if let attachment = Self.iconAttachment(for: request.content.userInfo) {
            content.attachments = [attachment]
        }
        contentHandler(content)
    }

    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

    // MARK: - Icon rendering

    private static func iconAttachment(for userInfo: [AnyHashable: Any]) -> UNNotificationAttachment? {
        guard (userInfo["icon.enabled"] as? String) == "true",
              let name = userInfo["icon.icon"] as? String,
              let glyph = Glyph(name: name),
              let image = glyph.render(color: color(from: userInfo["icon.color"] as? String), size: 256),
              let data = image.pngData()
        else { return nil }

        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent("notification_icon_\(UUID().uuidString).png")
        do {
            try data.write(to: url)
            return try UNNotificationAttachment(
                identifier: "tb_icon",
                url: url,
                options: [UNNotificationAttachmentOptionsTypeHintKey: UTType.png.identifier]
            )
        } catch {
            return nil
        }
    }

    /// Parses #RRGGBB or #RRGGBBAA (alpha last), mirroring
    /// toNotificationIconColor on the Dart side.
    private static func color(from hex: String?) -> UIColor {
        let fallback = UIColor.black.withAlphaComponent(0.54)
        guard var hex = hex?.replacingOccurrences(of: "#", with: ""), !hex.isEmpty else {
            return fallback
        }

        var alpha: CGFloat = 1
        if hex.count == 8 {
            if let alphaByte = UInt8(hex.suffix(2), radix: 16) {
                alpha = CGFloat(alphaByte) / 255
            }
            hex = String(hex.prefix(6))
        }
        guard hex.count == 6, let rgb = UInt32(hex, radix: 16) else { return fallback }

        return UIColor(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: alpha
        )
    }
}

/// An icon glyph resolved to a codepoint in one of the Flutter icon fonts
/// shipped inside the containing app bundle.
private struct Glyph {
    let codepoint: UInt32
    let fontPath: String

    private static let materialFontPath =
        "Frameworks/App.framework/flutter_assets/fonts/MaterialIcons-Regular.otf"
    private static let mdiFontPath =
        "Frameworks/App.framework/flutter_assets/assets/fonts/materialdesignicons-webfont.ttf"

    private static let iconMap: [String: [String: UInt32]] = {
        guard let url = Bundle.main.url(forResource: "icon_map", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let map = try? JSONDecoder().decode([String: [String: UInt32]].self, from: data)
        else { return [:] }
        return map
    }()

    init?(name: String) {
        if name.contains("mdi") {
            let mdiName = Glyph.mdiKey(name.components(separatedBy: "mdi:").last ?? name)
            guard let code = Glyph.iconMap["mdi"]?[mdiName] else { return nil }
            codepoint = code
            fontPath = Glyph.mdiFontPath
        } else {
            guard let code = Glyph.iconMap["material"]?[name] else { return nil }
            codepoint = code
            fontPath = Glyph.materialFontPath
        }
    }

    func render(color: UIColor, size: CGFloat) -> UIImage? {
        guard let scalar = Unicode.Scalar(codepoint), let font = loadFont(size: size) else {
            return nil
        }

        let text = NSAttributedString(
            string: String(Character(scalar)),
            attributes: [.font: font, .foregroundColor: color]
        )
        let bounds = text.boundingRect(
            with: CGSize(width: size * 2, height: size * 2),
            options: .usesLineFragmentOrigin,
            context: nil
        )

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        format.opaque = false
        return UIGraphicsImageRenderer(size: CGSize(width: size, height: size), format: format)
            .image { _ in
                text.draw(at: CGPoint(x: (size - bounds.width) / 2, y: (size - bounds.height) / 2))
            }
    }

    /// Loads the icon font from the containing app bundle: the extension
    /// lives at <app>.app/PlugIns/<ext>.appex, so the app bundle with the
    /// Flutter assets is two levels up. CTFont is toll-free bridged to
    /// UIFont, so the result can be used directly as an attributed-string
    /// font attribute without registering the font.
    private func loadFont(size: CGFloat) -> CTFont? {
        let appBundleURL = Bundle.main.bundleURL
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        let fontURL = appBundleURL.appendingPathComponent(fontPath)

        guard let provider = CGDataProvider(url: fontURL as CFURL),
              let cgFont = CGFont(provider)
        else { return nil }

        return CTFontCreateWithGraphicsFont(cgFont, size, nil, nil)
    }

    /// Mirrors mdiIconFromString in lib/utils/ui/material_icons.dart: the map
    /// keys are the MDI names without dashes, lower-cased, so both
    /// "account-circle" and "accountCircle" resolve.
    private static func mdiKey(_ name: String) -> String {
        name.replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "_", with: "")
            .lowercased()
    }
}
