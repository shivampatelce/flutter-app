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
        "Lightweight, fast, student-friendly laptop for cloud-first users with excellent battery life.",
        "The Chromebook Laptop is the ultimate solution for students, educators, and professionals who rely on Google apps. It features ultra-fast boot time, seamless Google integration, and long battery life. Its lightweight frame makes it ideal for portability, and the responsive keyboard enhances productivity, whether you're attending virtual classes or working remotely.",
        899.99,
        "chromebook_laptop.jpg",
      ),
      Product(
        2,
        "Laptop 2",
        "High-end performance laptop with GPU acceleration for gamers and creators.",
        "Engineered for those who push limits, Laptop 2 brings together raw performance and immersive graphics. Its advanced cooling system ensures stable performance during intense gaming or creative sessions. With a 144Hz refresh rate display, customizable RGB keyboard, and immersive surround sound, it’s a powerhouse built for multitasking and entertainment.",
        1299.00,
        "laptops.jpg",
      ),
      Product(
        3,
        "Laptop 3",
        "Budget-friendly everyday laptop with all the essentials.",
        "Ideal for students and light office users, this laptop offers efficient multitasking for web browsing, word processing, and streaming. It features a long-lasting battery, compact design, and user-friendly operating system for hassle-free computing.",
        599.00,
        "laptops.jpg",
      ),
      Product(
        4,
        "Laptop 4",
        "Convertible touchscreen laptop for creatives and multi-taskers.",
        "Laptop 4 functions as both a laptop and tablet, offering a 360-degree hinge, responsive stylus support, and vivid touch display. Designed for drawing, note-taking, and on-the-go presentations, it’s the perfect hybrid device for creatives and professionals.",
        749.00,
        "laptops.jpg",
      ),
      Product(
        5,
        "Laptop 5",
        "Business laptop built for professionals on the move.",
        "Laptop 5 comes with a sleek chassis, fingerprint reader, and advanced security features. Enjoy smooth performance, ample ports, and reliability with enterprise-grade build quality ideal for meetings, presentations, and travel.",
        999.00,
        "laptops.jpg",
      ),
      Product(
        6,
        "Laptop 6",
        "Slim ultrabook designed for portability and long-lasting battery.",
        "Laptop 6 weighs less than 1kg and offers up to 12 hours of battery life, making it ideal for travelers and remote workers. It also features a stunning display, SSD storage, and quiet operation for focused work anywhere.",
        849.00,
        "laptops.jpg",
      ),
    ]);

    // Mobiles
    category2Products.addAll([
      Product(
        7,
        "Mobile 1",
        "Premium flagship phone with pro-grade camera and blazing fast 5G.",
        "Mobile 1 brings the best of innovation and style with a triple-lens camera system that captures life in stunning clarity, even in low light. It includes AI scene detection, 8K video recording, and optical zoom. The 5G chipset delivers unmatched performance whether you're gaming, multitasking, or streaming your favorite shows.",
        1099.00,
        "mobiles.jpg",
      ),
      Product(
        8,
        "Mobile 2",
        "Affordable smartphone offering smooth performance and reliable battery.",
        "Mobile 2 is perfect for budget-conscious users who want modern features without compromise. With a crisp HD+ display, dual camera system, and Android 12 support, it provides a smooth and user-friendly experience. Enjoy social media, light gaming, and video streaming with a battery that lasts all day.",
        299.00,
        "mobiles.jpg",
      ),
      Product(
        9,
        "Mobile 3",
        "High-resolution mobile camera for creators and influencers.",
        "Mobile 3 includes a 108MP sensor, ultra-wide lens, and portrait-enhancing AI. Perfect for capturing life’s moments in detail and style. It also supports 4K video recording and advanced stabilization features.",
        899.00,
        "mobiles.jpg",
      ),
      Product(
        10,
        "Mobile 4",
        "Compact smartphone with powerful performance and sleek design.",
        "Mobile 4 combines elegance and practicality with a small form factor, edge-to-edge display, and fast processor. It fits easily in your pocket while delivering a premium Android experience.",
        699.00,
        "mobiles.jpg",
      ),
      Product(
        11,
        "Mobile 5",
        "Gaming-optimized smartphone with high refresh rate and cooling.",
        "Equipped with a 144Hz AMOLED screen, advanced heat dissipation system, and shoulder triggers, Mobile 5 ensures peak gaming performance for esports, mobile shooters, and AR experiences.",
        799.00,
        "mobiles.jpg",
      ),
      Product(
        12,
        "Mobile 6",
        "Well-balanced smartphone for entertainment and productivity.",
        "Mobile 6 delivers strong performance, fast charging, and a clean software interface. It’s the perfect device for users looking for all-round capabilities at a mid-range price.",
        649.00,
        "mobiles.jpg",
      ),
    ]);

    // TVs
    category3Products.addAll([
      Product(
        13,
        "TV 1",
        "Ultra HD 4K Smart TV with voice assistant and cinematic visuals.",
        "Enjoy an immersive viewing experience with TV 1, featuring 4K resolution, Dolby Vision HDR, and built-in smart apps like Netflix, Prime Video, and YouTube. The frameless design adds elegance to any room, while the voice-controlled remote offers seamless navigation and hands-free operation.",
        1199.00,
        "tvs.jpg",
      ),
      Product(
        14,
        "TV 2",
        "Budget LED TV with essential features and HDMI connectivity.",
        "Designed for basic entertainment, TV 2 delivers HD visuals with sharp clarity and balanced sound. It's the perfect choice for bedrooms or offices, with multiple ports for connecting set-top boxes, game consoles, or USB drives. Lightweight and easy to wall mount.",
        399.00,
        "tvs.jpg",
      ),
      Product(
        15,
        "TV 3",
        "Vibrant QLED display with HDR and premium finish.",
        "TV 3 boasts a color-rich Quantum Dot panel, deep blacks, and wide viewing angles. With a sleek metal frame and intuitive OS, it’s perfect for your home theatre setup.",
        999.00,
        "tvs.jpg",
      ),
      Product(
        16,
        "TV 4",
        "Curved Smart TV with panoramic screen for immersive visuals.",
        "Enjoy the cinematic experience right at home with a curved screen that wraps visuals around your field of view. Great for binge-watching series or playing console games.",
        799.00,
        "tvs.jpg",
      ),
      Product(
        17,
        "TV 5",
        "OLED panel with perfect blacks and infinite contrast ratio.",
        "TV 5 delivers unmatched image quality with per-pixel lighting, ultra-thin design, and cinematic surround audio. Designed for film enthusiasts and modern living rooms.",
        1499.00,
        "tvs.jpg",
      ),
      Product(
        18,
        "TV 6",
        "Compact smart TV with wireless casting and HD resolution.",
        "Ideal for dorm rooms, kitchens, or RVs, this portable TV features Wi-Fi streaming, HDMI input, and USB playback. Small but mighty for personal entertainment.",
        299.00,
        "tvs.jpg",
      ),
    ]);

    // Cameras
    category4Products.addAll([
      Product(
        19,
        "Camera 1",
        "Entry-level DSLR with guided modes and 24MP sensor.",
        "Camera 1 is ideal for beginners, offering simplified controls, tutorial assist, and compatibility with a wide range of lenses. Great for learning photography basics and capturing family events.",
        599.00,
        "cameras.jpg",
      ),
      Product(
        20,
        "Camera 2",
        "Compact mirrorless camera with 4K video and touchscreen LCD.",
        "Capture high-res stills and vlogs using fast autofocus and real-time face detection. Includes Wi-Fi, flip-out screen, and mic input for creators and travelers.",
        899.00,
        "cameras.jpg",
      ),
      Product(
        21,
        "Camera 3",
        "Waterproof action camera with stabilization and wide-angle lens.",
        "Designed for adventure, this cam supports underwater shooting, slow-mo video, and 4K 60fps capture. Mountable on helmets, bikes, and surfboards.",
        349.00,
        "cameras.jpg",
      ),
      Product(
        22,
        "Camera 4",
        "Professional DSLR with full-frame sensor and dual card slots.",
        "High dynamic range, burst shooting, and robust body make it ideal for wedding and wildlife photography. Trusted by pros worldwide.",
        1499.00,
        "cameras.jpg",
      ),
      Product(
        23,
        "Camera 5",
        "Vlogger-friendly camera with stabilization and face tracking.",
        "Create professional video content with this compact cam that includes a mic jack, 180-degree flip screen, and beautify mode for social platforms.",
        799.00,
        "cameras.jpg",
      ),
      Product(
        24,
        "Camera 6",
        "Superzoom digital cam with 60x optical zoom and image clarity.",
        "Capture distant wildlife, concerts, or cityscapes without changing lenses. Features easy presets, manual mode, and tripod support.",
        999.00,
        "cameras.jpg",
      ),
    ]);

    // Accessories
    category5Products.addAll([
      Product(
        25,
        "Accessory 1",
        "Durable phone case with shock absorption and sleek profile.",
        "This accessory offers military-grade protection with soft TPU edges and a rugged polycarbonate back. Designed to absorb impact and prevent scratches, it's slim enough to fit in your pocket without compromising on safety or style.",
        19.99,
        "accessories.jpg",
      ),
      Product(
        26,
        "Accessory 2",
        "Elegant laptop sleeve with foam cushioning and water resistance.",
        "Carry your laptop in style with this minimalist sleeve, featuring a plush interior lining, shock-absorbing padding, and a water-resistant zipper. It keeps your device safe from bumps, drops, and spills during travel or commutes.",
        25.00,
        "accessories.jpg",
      ),
      Product(
        27,
        "Accessory 3",
        "Fast wireless charging pad with sleek aluminum finish.",
        "Compatible with all Qi-enabled devices, this pad charges quickly and safely, with temperature control and soft rubber feet to prevent slipping.",
        35.00,
        "accessories.jpg",
      ),
      Product(
        28,
        "Accessory 4",
        "Multi-port USB-C hub with HDMI and SD reader.",
        "Expand your laptop’s potential with this all-in-one adapter featuring 4K HDMI, USB 3.0, SD card reader, and Type-C charging.",
        45.00,
        "accessories.jpg",
      ),
      Product(
        29,
        "Accessory 5",
        "Wireless earbuds with noise cancellation and 20hr playtime.",
        "Crystal clear audio, comfortable fit, and touch controls make these earbuds your go-to for music, workouts, and calls.",
        69.00,
        "accessories.jpg",
      ),
      Product(
        30,
        "Accessory 6",
        "Adjustable stand for tablets and smartphones up to 12\".",
        "Aluminum alloy body with anti-slip base and angle adjustment. Great for video calls, cooking recipes, or bedside use.",
        29.00,
        "accessories.jpg",
      ),
    ]);

    // Tablets
    category6Products.addAll([
      Product(
        31,
        "Tablet 1",
        "Powerful iPad Air with Apple Pencil and M1 chip support.",
        "With blazing-fast M1 performance and a sleek metal body, this tablet is made for creatives, professionals, and students. Whether you're drawing, editing videos, or attending meetings, it handles everything with fluidity and ease. Comes with Apple Pencil support, USB-C, and all-day battery life.",
        649.00,
        "tablets.jpg",
      ),
      Product(
        32,
        "Tablet 2",
        "Android tablet with HD screen, stereo sound, and great battery.",
        "This budget-friendly tablet delivers more than expected. Enjoy crystal-clear visuals and dual-speaker sound while watching your favorite series. The latest Android version ensures a smooth interface, app compatibility, and long-lasting battery backup.",
        499.00,
        "tablets.jpg",
      ),
      Product(
        33,
        "Tablet 3",
        "2-in-1 Windows tablet with detachable keyboard and pen.",
        "Run full desktop apps like MS Office or Photoshop with ease. Ideal for work-from-home, presentations, and digital art.",
        699.00,
        "tablets.jpg",
      ),
      Product(
        34,
        "Tablet 4",
        "Affordable Android tablet with expandable storage and kid mode.",
        "Equipped with parental controls, content filters, and a durable case, this tablet is perfect for young learners and family use.",
        299.00,
        "tablets.jpg",
      ),
      Product(
        35,
        "Tablet 5",
        "Durable kids tablet with educational content preloaded.",
        "Includes fun learning apps, reading games, and a kid-friendly interface. Protected with rubber casing and a 2-year worry-free warranty.",
        199.00,
        "tablets.jpg",
      ),
      Product(
        36,
        "Tablet 6",
        "High-end Android tablet with AMOLED display and stylus.",
        "Perfect for digital artists and multitaskers, this tablet features 120Hz refresh rate, DeX desktop mode, and keyboard case support.",
        899.00,
        "tablets.jpg",
      ),
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