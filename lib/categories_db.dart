import 'package:flutterprjgroup3/product.dart';

class CategoriesDb {
  static Map<String, List<Product>> getCategories() {
    List<Product> category1Products = [];
    List<Product> category2Products = [];
    List<Product> category3Products = [];
    List<Product> category4Products = [];
    List<Product> category5Products = [];
    List<Product> category6Products = [];

    // Laptops
    category1Products.addAll([
      Product(
        1,
        "Chromebook Laptop",
        "Compact and stylish Windows laptop tailored for students and everyday users. Delivers reliable performance in a sleek, lightweight design.",
        "HP Stream 14 Laptop features an Intel processor, 4GB RAM, and 64GB eMMC storage, making it ideal for web browsing, document editing, and casual tasks. With Windows 11 pre-installed, it offers a modern and user-friendly experience. The vibrant 14 display and full-size keyboard provide a comfortable workspace, while the long battery life ensures productivity on the go. Whether you’re working from home, attending online classes, or managing personal projects, this HP laptop is built to keep up with your lifestyle.",
        899.99,
        "hp_stream_14_laptop.webp",
      ),
      Product(
        2,
        "Lenovo Chromebook",
        "Sleek and secure Chromebook built for productivity and entertainment, powered by Chrome OS. Perfect for cloud computing and streamlined performance.",
        "Lenovo Ideapad 3i Chromebook combines the reliability of Lenovo hardware with the simplicity of Chrome OS. Featuring a responsive keyboard, spacious touchpad, and crisp Full HD display, it's designed for seamless multitasking across web apps and Google Workspace. It offers fast boot-up, built-in virus protection, and long-lasting battery life. With ample cloud storage support and smooth integration with Android apps, it’s an ideal choice for students, remote workers, and casual users looking for portability and efficiency.",
        1299.00,
        "lenovo_ideapad_3i_chromebook.jpg",
      ),
      Product(
        3,
        "Acer Aspire",
        "Reliable and efficient everyday laptop designed for students, professionals, and home users. Perfect balance of performance and affordability.",
        "Acer Aspire 1 A115-32-C6PW delivers smooth performance for daily computing tasks, whether you're browsing, working, or streaming. It features a sleek silver design, a crisp Full HD display, and long battery life for on-the-go productivity. With an Intel Core processor, ample RAM, and SSD storage, this laptop ensures fast boot times and responsive multitasking. Ideal for anyone seeking a dependable laptop for school, work, or home use at a budget-friendly price.",
        599.00,
        "acer_aspire.webp",
      ),
      Product(
        4,
        "Acer Chromebook Laptop",
        "Powerful and stylish Chromebook designed for everyday cloud-based computing. A great choice for students, casual users, and professionals who prefer speed and simplicity.",
        "Acer Chromebook Laptop runs on Chrome OS and features a sleek aluminum-style finish with a bright Full HD display for vibrant visuals. With fast boot times, automatic updates, and built-in security, it offers a hassle-free user experience. The device is optimized for Google apps and supports Android applications via Google Play. Perfect for multitasking, video conferencing, and content consumption, this Acer Chromebook delivers both performance and portability, backed by excellent battery life.",
        749.00,
        "acer_chromebook_laptop.webp",
      ),
      Product(
        5,
        "DELL Latitude",
        "Durable and compact convertible laptop designed for students and on-the-go professionals. Perfect for classroom learning, note-taking, and light productivity.",
        "DELL Latitude 3189 features a rugged design with a 360-degree hinge, allowing it to switch easily between laptop and tablet modes. Powered by Windows 10 and equipped with an Intel processor, 4GB RAM, and 64GB storage, it’s built for dependable performance in educational settings. The 11.6 touchscreen display and solid build make it ideal for mobility and daily use. Whether for school or light office tasks, this Dell Latitude model is a budget-friendly solution for reliable performance in a compact form.",
        999.00,
        "dell_latitude_3189.jpg",
      ),
    ]);

    // Mobiles
    category2Products.addAll([
      Product(
        7,
        "Apple iPhone 13",
        "The iconic iPhone experience with powerful performance, stunning visuals, and exceptional camera quality. A perfect blend of style, speed, and innovation.",
        "The iPhone 13 features Apple’s A15 Bionic chip for lightning-fast performance and efficiency. Its 6.1 Super Retina XDR display delivers vibrant colors and deep blacks for an immersive viewing experience. The dual-camera system with sensor-shift stabilization captures brilliant photos and cinematic videos, even in low light. With 5G connectivity, enhanced battery life, iOS 17 features, and long-term software support, iPhone 13 is a top choice for users seeking premium quality and seamless performance in a compact, elegant design.",
        1099.00,
        "apple_iphone_13.jpg",
      ),
      Product(
        8,
        "Apple iPhone 14",
        "Next-level performance and safety with stunning visuals and advanced camera features. iPhone 14 delivers the ultimate Apple experience in a sleek and durable design.",
        "Powered by the A15 Bionic chip with a 5-core GPU, the iPhone 14 offers ultra-smooth performance, perfect for gaming, video editing, and multitasking. It boasts a 6.1 Super Retina XDR display and an upgraded dual-camera system for sharper photos and cinematic video. With features like Crash Detection, Emergency SOS via satellite, improved battery life, and 5G connectivity, iPhone 14 is built for both power and peace of mind. Ideal for users who want performance, reliability, and cutting-edge technology in one device.",
        299.00,
        "apple_iphone_14.jpg",
      ),
      Product(
        9,
        "Apple iPhone 15",
        "A new era of iPhone with enhanced design, Dynamic Island, and next-gen camera capabilities. iPhone 15 delivers elegance, innovation, and intelligence in every tap.",
        "iPhone 15 introduces Dynamic Island — a whole new way to interact with notifications and activities. Equipped with the A16 Bionic chip, it ensures high-speed performance and power efficiency. The 6.1 Super Retina XDR display is stunningly bright and fluid, while the 48MP main camera captures breathtaking photos and 4K videos with fine detail. With USB-C charging, extended battery life, and improved durability, iPhone 15 is designed to keep up with your lifestyle — from content creation to everyday convenience.",
        899.00,
        "apple_iphone_15.jpg",
      ),
      Product(
        10,
        "Google Pixel 8a",
        "Experience Google's cutting-edge AI and camera capabilities in a sleek, compact device. The Pixel 8a offers a premium smartphone experience at a mid-range price point.",
        "The Pixel 8a delivers powerful performance with Google’s latest Tensor chipset, enabling lightning-fast processing, on-device AI, and intelligent photo editing tools. It features a stunning OLED display with ultra-smooth scrolling and vivid colors. Capture incredible shots with the advanced dual-camera system, enhanced by Google's computational photography. With Android 14, long-term security updates, and exclusive Pixel features like Call Screen and Magic Eraser, it’s designed for users who want smart, smooth, and secure smartphone experiences.",
        699.00,
        "google_pixel_8a.jpg",
      ),
      Product(
        11,
        "Samsung Galaxy A16",
        "Sleek and affordable 5G smartphone designed for everyday performance and next-gen connectivity. Ideal for users who want speed, style, and smart features on a budget.",
        "The Galaxy A16 5G combines Samsung’s trusted build quality with modern features like a vivid 6.5 HD+ display, triple rear camera setup, and a long-lasting battery. Powered by a fast octa-core processor and 5G capabilities, it handles multitasking, streaming, and gaming with ease. Capture stunning photos with its intelligent camera system and enjoy smooth performance with Android 13 and One UI Core. Whether you're upgrading or switching to 5G, the Galaxy A16 is the perfect blend of power and affordability.",
        799.00,
        "samsung_galaxy_a16.jpg",
      ),
    ]);

    // TVs
    category3Products.addAll([
      Product(
        13,
        "Amazon Fire Full HD",
        "Smart, sleek, and powerful — this Fire TV delivers Full HD entertainment with built-in Alexa voice control and endless streaming possibilities.",
        "The 40 Amazon Fire TV brings your favorite shows, movies, and apps to life in vibrant Full HD with HDR 10 support for stunning clarity and contrast. Integrated with Fire OS, it gives you direct access to thousands of streaming apps like Prime Video, Netflix, Disney+, and more. The included Alexa Voice Remote makes navigation easy and hands-free. With HDMI and USB ports, seamless screen mirroring, and a sleek, borderless design, this smart TV is perfect for any living room, bedroom, or media space.",
        1199.00,
        "amazon_fire_tv_40.jpg",
      ),
      Product(
        14,
        "FPD 43 Smart TV",
        "Immerse yourself in cinematic brilliance with this 43 Full HD Smart TV powered by Google TV. A perfect blend of smart features and stunning visuals.",
        "The FPD 43 Smart TV from the Palette Series delivers crystal-clear Full HD resolution and vibrant color performance. With Google TV built-in, you get personalized content recommendations and seamless access to YouTube, Netflix, Prime Video, and more. Voice control support through Google Assistant makes searching easier than ever. The sleek design, immersive display, and multiple connectivity options (HDMI, USB, Wi-Fi) make this TV ideal for both binge-watchers and casual viewers alike.",
        399.00,
        "google_tv.jpg",
      ),
      Product(
        15,
        "LG 75 Series Smart TV",
        "Massive screen, mind-blowing clarity. This 75 LG Smart TV with AI technology delivers a cinematic 4K UHD experience with smart features that adapt to your viewing.",
        "The LG UT7000 Series Smart TV is a visual powerhouse with a 75 4K UHD display, AI-powered picture enhancement, and HDR support. It brings vibrant colors and deep contrast for true-to-life imagery. Powered by webOS, it offers intuitive access to Netflix, Prime Video, Apple TV+, and more. With LG ThinQ AI and voice assistant support (Google Assistant & Alexa), you can control your TV and smart home with just your voice. A stunning centerpiece for any home theater setup.",
        999.00,
        "lg_tv.jpg",
      ),
      Product(
        16,
        "Samsung 70 UHD Smart TV",
        "Big screen brilliance with vibrant color and lifelike clarity. The Samsung Crystal UHD TV transforms your living room into a true home theater experience.",
        "This 70 Samsung Smart TV features Crystal UHD 4K resolution for crystal-clear picture quality with Dynamic Crystal Color for stunning vibrancy. Powered by the Crystal Processor 4K, it upscales content to 4K and delivers smooth motion. With Tizen OS, enjoy instant access to your favorite streaming services including Netflix, Disney+, and YouTube. Built-in Alexa and Google Assistant provide voice control, and multiple HDMI/USB ports ensure seamless connectivity. Perfect for movie nights, sports events, and binge-worthy series.",
        799.00,
        "samsung_tv.jpg",
      ),
    ]);

    // Cameras
    category4Products.addAll([
      Product(
        19,
        "5K Ultra HD Digital Camera",
        "Shoot like a pro with this feature-packed 5K digital camera. Ideal for advanced creators, vloggers, and hobbyists looking for performance and portability in one.",
        "This 5K Ultra HD digital camera offers 48MP resolution and 60FPS video recording for buttery-smooth content creation. Equipped with a wide-angle lens, macro lens, 16X digital zoom, and rotatable screen, it’s perfect for travel, YouTube, or professional-grade content. WiFi connectivity allows for real-time file transfer and remote control via your phone. Includes a full kit with 32GB SD card, 2 rechargeable batteries, lens hood, and charging cables — everything you need to start shooting right out of the box.",
        599.00,
        "5k_digital_camera.jpg",
      ),
      Product(
        20,
        "Canon EOS Rebel T7",
        "Capture stunning photos and Full HD videos effortlessly with the Canon EOS Rebel T7 — the perfect entry-level DSLR for aspiring photographers.",
        "The Canon EOS Rebel T7 offers a 24.1MP CMOS sensor and DIGIC 4+ Image Processor for beautiful, high-resolution images and quick performance. Its built-in Wi-Fi and NFC allow for easy photo sharing and remote shooting from your smartphone. The included EF-S 18–55mm lens is perfect for a variety of shooting situations, from landscapes to portraits. With features like Scene Intelligent Auto mode, a 9-point AF system, and creative filters, it’s a user-friendly DSLR built to elevate your photography game.",
        899.00,
        "canon_camera.jpg",
      ),
      Product(
        21,
        "Compact Digital Camera",
        "Cute, compact, and capable — this 48MP digital camera is perfect for beginners, teens, and content creators who want to capture life's moments in style.",
        "This lightweight point-and-shoot camera delivers 48MP photos and smooth HD video. With 16X digital zoom, anti-shake, face detection, and a built-in flash, it’s a great all-around choice for everyday use. The 2.7” LCD screen makes framing easy, while the included 64GB SD card and dual rechargeable batteries ensure you're always ready to shoot. Its pastel pink body adds a fun pop of color — ideal for travel, selfies, pets, and casual vlogging.",
        349.00,
        "digital_camera.jpg",
      ),
      Product(
        22,
        "5K Digital Camera",
        "A powerful yet portable camera perfect for vlogging, selfies, and beginner photography. Packed with features like 5K recording, WiFi sharing, and a 75MP sensor.",
        "This compact digital camera delivers ultra-high resolution with 75MP stills and stunning 5K video. It includes a flip-up screen, making it perfect for selfies, content creators, and vloggers. With 18X digital zoom, WiFi connectivity for instant sharing, and autofocus functionality, it provides exceptional versatility for everyday shooting. The kit includes a 32GB SD card and two rechargeable batteries, so you're ready to go right out of the box. Ideal for travel, social media, and capturing memories in high detail.",
        1499.00,
        "cameras.jpg",
      ),
      Product(
        23,
        "4K Digital Camera",
        "Capture professional-level photos and 4K video with this high-resolution digital camera. Built for creators, vloggers, and photography enthusiasts alike.",
        "This 4K digital camera delivers razor-sharp 72MP stills and Ultra HD video recording. Featuring a rotatable 3” flip screen, built-in flash, and 16X digital zoom, it’s perfect for shooting from creative angles or vlogging. Autofocus and face detection ensure every shot is sharp, while the 64GB SD card and rechargeable battery keep you ready to shoot longer. Whether you're traveling, filming action, or creating YouTube content, this camera offers powerful tools in a lightweight, DSLR-style design.",
        799.00,
        "4k_digital_camera.jpg",
      ),
    ]);

    // Accessories
    category5Products.addAll([
      Product(
        25,
        "RGB Gaming Headset",
        "Immerse yourself in every battle with crystal-clear audio and RGB flair. The Ozeino headset delivers powerful sound and all-day comfort for gamers on any platform.",
        "The Ozeino Gaming Headset features immersive surround sound with deep bass, precision-tuned 50mm drivers, and a noise-cancelling microphone for clear team communication. Designed for multi-platform use, it’s compatible with PS5, Xbox, Switch, PC, and mobile via a 3.5mm jack. The adjustable headband, soft memory foam earcups, and dynamic RGB lighting provide style and comfort for long gaming sessions. Plug in, power up, and dominate your game with a headset built for performance and flair.",
        19.99,
        "gaming_headset.jpg",
      ),
      Product(
        26,
        "Wireless Power Bank",
        "Charge on the go with style and speed. This MagSafe-compatible wireless power bank is perfect for iPhones and USB-C devices — no cables required.",
        "The Podoru MagSafe Power Bank features a sleek, foldable stand design with a powerful 10000mAh capacity, making it ideal for wireless charging on the fly. Compatible with MagSafe-enabled iPhones and standard Qi devices, it also includes fast-charging USB-C and USB-A ports for versatility. The digital display shows real-time battery percentage and charging status, while the fold-out stand turns it into a perfect desk companion. Lightweight, portable, and smart — it's a must-have for power users.",
        25.00,
        "power_bank.jpg",
      ),
      Product(
        27,
        "RGB Headphone Stand",
        "Upgrade your desk setup with this multifunctional RGB headphone stand. Built for gamers, streamers, and productivity lovers who crave style and utility.",
        "The TROND headphone stand isn’t just a stand — it’s a power hub. Featuring customizable RGB lighting, 3 USB charging ports, and 2 AC outlets, it keeps your workspace powered and organized. Its sleek design supports all headset sizes while protecting your gear with built-in surge protection. Perfect for PC or console setups, it combines aesthetics and function with ambient lighting and cable management. Whether for gaming or work, this is a must-have desk essential.",
        35.00,
        "headphone_stand.jpg",
      ),
      Product(
        28,
        "Power Bar",
        "Power everything from one sleek unit. This surge protector is designed for home offices, gaming setups, and anyone needing serious charging capacity.",
        "The TROND power bar delivers robust surge protection with 13 AC outlets, 3 USB-A ports, and 1 USB-C port for fast charging. Built with a heavy-duty 6.5 ft flat plug cord, it supports up to 1875W and includes safety features like fire-resistant casing and overload protection. Ideal for organizing multiple devices — from laptops to gaming consoles — it’s wall-mountable and perfect for desk or entertainment setups. Smart, compact, and powerful.",
        45.00,
        "power_bar.jpg",
      ),
      Product(
        29,
        "RGB Gaming Mouse",
        "Unleash precision and flair with this lightning-fast RGB gaming mouse. Designed for gamers who demand accuracy, comfort, and vibrant style.",
        "The VersionTECH. Gaming Mouse features customizable RGB crackle lighting with an ergonomic grip built for long gaming sessions. With 7 programmable buttons and adjustable DPI (800–7200), it offers the precision and responsiveness you need for FPS, MMO, or casual play. Plug-and-play USB compatibility ensures it's ready to go with PC, laptop, or console setups. Whether you're gaming in the dark or lighting up your desk setup, this mouse delivers style and control at an unbeatable price.",
        69.00,
        "gaming_mouse.jpg",
      ),
    ]);

    // Tablets
    category6Products.addAll([
      Product(
        31,
        "Apple iPad Air 13",
        "Unleash professional power in a featherlight form. The new iPad Air with the M3 chip redefines tablet performance — perfect for creatives, students, and pros.",
        "The 13 iPad Air is powered by Apple’s groundbreaking M3 chip, delivering lightning-fast graphics, seamless multitasking, and pro-level performance in a sleek aluminum body. The stunning Liquid Retina display brings content to life with P3 wide color, True Tone, and anti-reflective coating. With support for Apple Pencil Pro, Magic Keyboard, and iPadOS multitasking, it’s built for productivity, design, and entertainment. Whether you're editing video, sketching, or running demanding apps — this iPad Air handles it effortlessly.",
        649.00,
        "apple_ipad_air_13.jpg",
      ),
      Product(
        32,
        "Apple iPad Pro 11",
        "Blazing fast, razor sharp, ultra thin — the all-new iPad Pro 11 with the M4 chip is Apple’s most advanced tablet ever. Built for professionals, creators, and innovators.",
        "Redesigned from the chip up, the iPad Pro 11 is powered by the revolutionary Apple M4 chip — offering unmatched speed, energy efficiency, and pro-grade performance. The new Ultra Retina XDR display delivers unparalleled contrast, brightness, and color accuracy for media, design, and 3D work. It supports Apple Pencil Pro, Magic Keyboard, and advanced iPadOS features like Stage Manager and desktop-class apps. With WiFi 6E, Face ID, pro cameras, and all-day battery life, this iPad Pro is ready for the future of computing.",
        499.00,
        "apple_ipad_pro_11.jpg",
      ),
      Product(
        33,
        "Apple iPad A16",
        "Power meets portability with the all-new iPad. Featuring the A16 Bionic chip, sleek all-screen design, and powerful iPadOS — it’s built to do it all beautifully.",
        "The Apple iPad (10th Gen) boasts a stunning 10.9” Liquid Retina display and is powered by the ultra-fast A16 Bionic chip for blazing performance in apps, multitasking, and games. With a 12MP ultra-wide front camera (landscape orientation), it’s perfect for FaceTime and content creation. Enjoy seamless typing with Apple Pencil (1st Gen) and Magic Keyboard Folio support. iPadOS enhances productivity and creativity, while WiFi 6 keeps you connected faster. A premium tablet for work, play, and everything in between.",
        699.00,
        "apple_ipad_a16.jpg",
      ),
      Product(
        34,
        "Blackview 10.1 Android 14",
        "A smart, sleek, and affordable Android 14 tablet packed with performance for entertainment, learning, and light productivity — great for every age.",
        "Powered by Android 14, the Blackview 10.1” tablet offers 12GB RAM (expandable via virtual RAM) and 64GB internal storage for smooth app performance and multitasking. With a crisp Full HD display and Widevine L1 support, you can stream Netflix, Prime Video, and YouTube in high resolution. WiFi connectivity, a long-lasting battery, and dual cameras make this tablet a perfect choice for families, students, and travelers. All-day battery, responsive screen, and portable design — all under one smart budget.",
        299.00,
        "blackview_android_tablet.jpg",
      ),
      Product(
        35,
        "Samsung Galaxy Tab A9",
        "Compact yet powerful — the Galaxy Tab A9 is your ideal everyday tablet for entertainment, productivity, and portability, backed by Samsung’s trusted performance.",
        "Featuring a vibrant 8.7” WXGA+ display, the Galaxy Tab A9 offers smooth visuals and responsive touch performance in a lightweight, sleek design. With 4GB RAM and 64GB internal storage (expandable via microSD), it’s great for streaming, reading, note-taking, and light multitasking. The long-lasting battery and Dolby Atmos audio make it a solid pick for on-the-go entertainment. Ideal for students, travelers, or anyone wanting a reliable Android tablet in a compact form factor.",
        199.00,
        "samsung_galaxy_tab.jpg",
      )
    ]);

    Map<String, List<Product>> categories = {
      "laptops": category1Products,
      "mobiles": category2Products,
      "tvs": category3Products,
      "cameras": category4Products,
      "accessories": category5Products,
      "tablets": category6Products,
    };

    return categories;
  }

  static double getProductPriceById(int productId) {
    for (var category in getCategories().values) {
      for (var product in category) {
        if (product.productId == productId) {
          return product.price;
        }
      }
    }
    return 0;
  }
}
