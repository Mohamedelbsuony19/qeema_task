import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String imageUrl;

  const ListCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFC25F30);
    const Color secondaryColor = Color(0xFF262626);
    const Color textColor = Color(0xFF999999);

    return Container(
      width: 243,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black, // Black background for the lower part
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // Upper half with the image and gradient fade
              Container(
                height: MediaQuery.of(context).size.height *
                    0.3, // Adjust the height for the upper half
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white, // الصورة تظهر بالكامل من الأعلى
                        Colors.transparent // الجزء السفلي يتلاشى
                      ],
                      stops: [0.9, 1], // التلاشي يبدأ فقط عند الجزء السفلي
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn, // Apply the fade effect
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover, // The image stays in its full size
                      ),
                    ),
                  ),
                ),
              ),

              // Lower half with the black background and text
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Item title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: textColor, size: 16),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: const Text(
                            overflow: TextOverflow.ellipsis,
                            '5 Nights (Jan 16 - Jan 20, 2024)',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.14,
                          child: const Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/person.png'),
                                radius: 12,
                              ),
                              Positioned(
                                left: 16,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/person.png'),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: 32,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 26, 25, 25),
                                  radius: 12,
                                  child: Text(
                                    '+6',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 90,
                          child: Text(
                            // overflow: TextOverflow.ellipsis,
                            '4 unfinished',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Floating container that overlaps image and lower card
          Positioned(
            bottom: 115,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: primaryColor, // Border color
                  width: 0.5,
                ),
                color: Colors.black
                    .withOpacity(0.5), // Semi-transparent background
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Pending Approval',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}