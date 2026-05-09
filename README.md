# Personal Portfolio

Ứng dụng portfolio cá nhân được xây dựng bằng Flutter, hỗ trợ responsive trên Mobile, Tablet và Desktop.

## Tính năng đã làm

- **Home Screen** – Hiển thị avatar, tên, chức danh và nút Download CV với animation entrance.
- **Resume Screen** – Trình bày thông tin cá nhân, mục tiêu nghề nghiệp, học vấn và kinh nghiệm làm việc.
- **Projects Screen** – Danh sách dự án với bộ lọc theo công nghệ (filter chip), layout dạng Wrap responsive theo màn hình.
- **Skills Screen** – Hiển thị kỹ năng dưới dạng progress bar.
- **Contact Screen** – Form liên hệ có validation (tên, email, tin nhắn) và phản hồi trạng thái gửi (loading / success / error).
- **Dark / Light Mode** – Chuyển đổi theme tối/sáng toàn app qua `DarkModeCubit`.
- **Responsive Layout** – Tự động điều chỉnh giao diện cho 3 breakpoint: Mobile (≤600px), Tablet (601–1024px), Desktop (≥1025px).
- **Navigation** – Bottom navigation bar trên mobile, sidebar trên desktop với `StatefulShellRoute`.
- **Page & Widget Animations** – Hiệu ứng slide/fade khi chuyển màn hình và khi widget xuất hiện.
- **Smooth Scroll** – Cuộn mượt trên web với `web_smooth_scroll`.
- **Clean URL** – Loại bỏ ký tự `#` trong URL bằng `PathUrlStrategy`.

---

## Tính năng chưa làm

- Sử dụng Lazy loading cho danh sách dài.
- Hiệu ứng lướt nhẹ khi scroll (Scroll Reveal).

*cần học thêm

## Tech Stack

| Thành phần | Công nghệ |
|---|---|
| Framework | [Flutter](https://flutter.dev) (Web) |
| State Management | [flutter_bloc](https://pub.dev/packages/flutter_bloc) – BLoC & Cubit |
| Routing | [go_router](https://pub.dev/packages/go_router) |
| Responsive | [responsive_framework](https://pub.dev/packages/responsive_framework) |
| Smooth Scroll | [web_smooth_scroll](https://pub.dev/packages/web_smooth_scroll) |
| URL Strategy | [flutter_web_plugins](https://pub.dev/packages/flutter_web_plugins) (PathUrlStrategy) |

---

## Hướng dẫn chạy dự án

### Yêu cầu
- Flutter SDK đã được cài đặt (khuyến nghị phiên bản ổn định mới nhất)
- Trình duyệt Google Chrome

### Các bước thực hiện

**1. Cài đặt dependencies:**
```bash
flutter pub get
```

**2. Chạy ứng dụng trên Chrome:**
```bash
flutter run -d chrome
```
**3. Chạy ứng dụng trên mobile(android):**
```bash
- bật debug-USB trên điện thoại
- kết nối với điện thoại bằng dây cắm xịn
- flutter run
```

