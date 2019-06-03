import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/hike.dart';
import 'package:portfolio/apps/california/data/lodge.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/apps/california/data/spot.dart';
import 'package:portfolio/apps/california/data/gift.dart';
import 'package:portfolio/apps/california/data/rental.dart';

class Data {
  static Park yosemite = Park(
    name: 'Yosemite Park',
    description: 'National Park',
    image: 'images/california/yosemite.png',
    background: LinearGradient(
      colors: [Colors.blue[300], Colors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    spots: [
      Spot(
          name: 'El Capitan',
          description:
              'A rock-climber favorite, and a must-see for any Yosemite visitor',
          image:
              'https://www.incimages.com/uploaded_files/image/970x450/getty_90247080_200013331818843227_386796.jpg',
          rating: Random().rating),
      Spot(
        name: 'Vernal Fall',
        description:
            'Vernal Fall is a 317-foot waterfall on the Merced River just downstream of Nevada Fall in Yosemite',
        image:
            'https://cdn-files.apstatic.com/hike/7031492_medium_1554931132.jpg',
        rating: Random().rating,
      ),
      Spot(
        name: 'Glacier Point',
        description:
            'An overlook with a commanding view of Yosemite Valley, Half Dome, Yosemite Falls, and Yosemite’s high country',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Glacier_Point_at_Sunset%2C_Yosemite_NP%2C_CA%2C_US_-_Diliff.jpg/1920px-Glacier_Point_at_Sunset%2C_Yosemite_NP%2C_CA%2C_US_-_Diliff.jpg',
        rating: Random().rating,
      ),
      Spot(
        name: 'Yosemite Falls',
        description:
            'The highest waterfall in Yosemite National Park, dropping a total of 2,425 feet (739 m) from the top of the upper fall to the base of the lower fall',
        image:
            'https://cdn-image.travelandleisure.com/sites/default/files/1550083880/yosemite-horsetail-falls-firefall-FIREFALL0219.jpg',
        rating: Random().rating,
      ),
    ],
    lodges: [
      Lodge(
        name: 'Majestic Yosemite',
        description:
            'The Majestic Yosemite Hotel (formerly the Ahwahnee Hotel) is the standard in luxury for Yosemite National Park lodging. Enjoy fine dining and a handcrafted cocktail under the tall log archways of the Grand Dining Room where views of Half Dome, Glacier Point, and Yosemite Falls',
        image:
            'https://www.travelyosemite.com/media/574844/winter-at-the-majestic-yosemite-hotel_1000x667.jpg',
        rating: Random().rating,
        price: 299,
      ),
      Lodge(
        name: 'Evergreen Lodge',
        description:
            'For nearly a century, this rustic mountain resort has been welcoming Yosemite visitors with its charming, woodsy cabins. It\'s replete with family-friendly amenities, but also a favourite retreat for couples. It\’s just outside the national park boundary, so plan on driving here',
        image:
            'https://www.telegraph.co.uk/content/dam/Travel/hotels/north-america/california/evergreen-lodge-yosemite-national-park-california-pool-p.jpg',
        rating: Random().rating,
        price: 349,
      ),
    ],
    hikes: [
      Hike(
        name: 'Tioga Pass Road',
        description:
            'The A-list destination for the Yosemite sightseer who can\'t decide what he wants. It\'s got some of everything - granite peaks, alpine lakes and meadows, a giant sequoia grove, and even a few hikes to the north rim of Yosemite Valley',
        image:
            'https://www.christravelblog.com/wp-content/uploads/ngg_featured/ellery-lake-tioga-road-usa-yosemite-to-mono-lake-the-best-stops-on-tioga-pass-road-IMG_9844-678x381.jpg',
        difficulty: Difficulty.Easy,
        length: 11.2,
      ),
      Hike(
        name: 'Hetch Hetchy Valley',
        description:
            'This valley has been flooded for more than 80 years, much to the detriment of its own beauty and the environmental cred of the city of San Francisco, which is adamantly opposed to tearing the dam down',
        image:
            'https://www.tripsavvy.com/thmb/-OFsstY0O7nq4OhnnhcEaSvxP00=/870x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4614652908_6c3f8f8db7_o-586198995f9b586e022d8b73.jpg',
        difficulty: Difficulty.Intermediate,
        length: 21.0,
      ),
      Hike(
        name: 'Big Oak Flat',
        description:
            'About 4.5 miles inside the Big Oak Flat park entrance grows the Merced Grove of Giant Sequoia trees; one of three sequoia groves in Yosemite Park',
        image:
            'http://www.undiscovered-yosemite.com/images/Tenaya-Lake-Yosemite-450.jpg',
        difficulty: Difficulty.Nuts,
        length: 52.4,
      ),
      Hike(
        name: 'Mariposa Grove',
        description:
            ' It\'s by far the biggest sequoia grove in Yosemite, home to hundreds of the handsome beasts, but the 1,800-year-old Grizzly Giant sequoia is worth the trip all by itself. And Wawona Point offers the best views of Wawona Valley anywhere in the western United States',
        image: 'http://www.redwoodhikes.com/YosemiteNP/Mariposa1.jpg',
        difficulty: Difficulty.Advanced,
        length: 10.5,
      ),
    ],
    gifts: [
      Gift(
          name: 'Sequin Bear Patch',
          description:
              'Truly unique, one-of-a-kind patch. Hand crafted by the greatest patch-maker of all time, Patch Patcherson!',
          image:
              'https://shop.travelyosemite.com/mediacontent//2019/05/15/14/27172_214382.jpg',
          price: 8.99,
          rating: Random().rating),
      Gift(
          name: 'Yosemite Mug',
          description:
              'A mug. From Yosemite. Mugs and Yosemite. Yosemite and Mugs.',
          image:
              'https://images-na.ssl-images-amazon.com/images/I/61L-52mf1qL._SL1000_.jpg',
          price: 14.99,
          rating: Random().rating),
      Gift(
          name: 'Yosemite Ornament',
          description:
              'Not your average chistmass tree ornament. This one is even more Yosemite-er!',
          image:
              'https://images-na.ssl-images-amazon.com/images/I/818THVyEK%2BL._SL1500_.jpg',
          price: 4.99,
          rating: Random().rating),
    ],
    rentals: [
      Rental(
        name: 'Volvo XC90',
        description:
            'The Volvo XC90 T8 Twin Engine is the only seven-seat plug-in hybrid luxury SUV currently on UK roads. The XC90 T8 runs in Hybrid mode by default and automatically manages the energy stored in the battery to recharge through engine and road braking. Apart from the silent electric drive, the T8 performs like any other XC90 and looks exactly the same as the rest of the SUV range',
        image:
            'https://avisassets.abgemea.com/.imaging/featureImageLarge/dam/DMS/global/fleet/prestige/feature/volvo-xc90-sideview-feature.jpg',
        service: 'Avis',
        price: 399,
        age: 25,
      ),
      Rental(
        name: 'Mercedes GLE AMG',
        description:
            'The Mercedes-Benz GLE 450 AMG Coupe is creating its own niche in the luxury crossover sector with its sleek bodystyle and sportier looks than the larger GLE SUV. The GLE 450 AMG Coupe has a terrific range of equipment including cruise and climate control, sat-nav, all-round parking sensors with a reversing camera, Bluetooth, DAB radio, cruise control and 21-inch AMG alloys. The interior has an understated feel with elegant styling and comes with the AMG sports steering wheel also featuring DIRECT SELECT gearshift paddles for the new 9G-TRONIC automatic transmission',
        image:
            'https://avisassets.abgemea.com/.imaging/featureImageLarge/dam/DMS/global/fleet/prestige/feature/merc-gle-coupe-feature.jpg',
        service: 'Hertz',
        price: 499,
        age: 30,
      ),
      Rental(
        name: 'Porsche 911 Carrera S',
        description:
            'Now in its seventh generation, the Porsche 911 maintains high levels of performance and comfort, matched with advanced safety features and intelligent thinking everywhere you look. The Carrera S has real day-to-day usability, alongside the legendary 911 sportiness',
        image:
            'https://avisassets.abgemea.com/.imaging/featureImageLarge/dam/DMS/global/fleet/prestige/feature/porsche-911-carerra-s-sideview-feature.jpg',
        service: 'Driverso',
        price: 799,
        age: 30,
      ),
      Rental(
        name: 'Range Rover Vogue',
        description:
            'The 3.0 litre Range Rover Vogue SE is a tremendous all-rounder with a seriously plush interior. The refined 4x4 boasts excellent handling and tip-top road manners. There\'s masses of boot space (958 litres rising to 2,000 with the rear seats down) and sits four adults without fuss. Whizzy tech includes Dynamic Stability Control, climate control, remote central locking, cruise control, a trip computer, alloy wheels, satellite navigation and rear and front parking sensors. The Range Rover Vogue is available for collection or delivery at locations across England and Scotland',
        image:
            'https://avisassets.abgemea.com/.imaging/featureImageLarge/dam/DMS/global/fleet/prestige/feature/range-rover-vogue-new-sideview-feature.jpg',
        service: 'Avis',
        price: 299,
        age: 21,
      ),
    ],
  );
}
