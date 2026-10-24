// 通用屏保加载冒烟测试:验证 .saver 能被系统加载
// 用法: swift scripts/test-load.swift <path/to/x.saver>
import AppKit
import ScreenSaver

let path = CommandLine.arguments[1]
guard let b = Bundle(path: path) else { print("✗ Bundle 识别失败"); exit(1) }
print("✓ Bundle 识别成功")
guard let pc = b.principalClass else { print("✗ principalClass = nil(模块无法加载)"); exit(1) }
print("✓ principalClass =", pc)
if let v = (pc as? ScreenSaverView.Type)?.init(frame: NSRect(x: 0, y: 0, width: 400, height: 300), isPreview: true) {
    print("✓ 视图实例化成功:", v)
} else {
    print("⚠ 视图实例化失败(不影响模块加载判定)")
}
