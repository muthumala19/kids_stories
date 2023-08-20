import 'package:flutter/material.dart';
import 'package:kids_stories/models/category_model.dart';
import 'package:kids_stories/models/story_model.dart';

const categories = [
  Category(id: 'c1', title: 'Fairy Tales', color: Color(0xFFE57373)),
  Category(id: 'c2', title: 'Fantasy', color: Color(0xFF9575CD)),
  Category(id: 'c3', title: 'Adventure', color: Color(0xFF4DB6AC)),
  Category(id: 'c4', title: 'Animal Stories', color: Color(0xFFF06292)),
  Category(id: 'c5', title: 'Folktales', color: Color(0xFFFFA726)),
  Category(id: 'c6', title: 'Science Fiction', color: Color(0xFF64B5F6)),
  Category(id: 'c7', title: 'Mystery', color: Color(0xFF546E7A)),
  Category(id: 'c8', title: 'Humor', color: Color(0xFF81C784)),
  Category(id: 'c9', title: 'Friendship', color: Color(0xFFFFD700)),
  Category(id: 'c10', title: 'Historical Fiction', color: Color(0xFF8D6E63)),
  Category(id: 'c11', title: 'Picture Books', color: Color(0xFFFFC107)),
  Category(id: 'c12', title: 'Educational', color: Color(0xFF4CAF50)),
  Category(id: 'c13', title: 'Bedtime Stories', color: Color(0xFF7986CB)),
];

const List<Story> stories = [
  Story(
    id: '0',
    title: "The Quest for the Golden Friendship Flower",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692444657/kids_stories_app/The%20Quest%20for%20the%20Golden%20Friendship%20Flower/rvuzzzob6prazoxjdwoa.png',
    categories: ['c3', 'c9'],
    // Adventure, Friendship
    complexity: Complexity.challenging,
    duration: 45,
    paragraphs: [
      "In the heart of the mystical Enchanted Forest, two inseparable friends, Lily the brave rabbit and Oliver the clever squirrel, lived in a cozy burrow. One day, a rumor reached their ears about a legendary flower known as the Golden Friendship Flower. It was said that anyone who found it would be granted the most precious and lasting friendship.",
      "Lily and Oliver were excited beyond measure. They decided to embark on an adventure to find this extraordinary flower. Equipped with a map drawn by the wise old owl, they set out on a journey through dense forests, across bubbling brooks, and over towering mountains.",
      "Their path was filled with challenges and obstacles, but Lily's bravery and Oliver's clever thinking helped them overcome each one. They encountered talking animals, mysterious riddles, and even a hidden cave filled with shimmering crystals. Through it all, their friendship remained unshakable.",
      "As they journeyed deeper into the forest, their bond grew stronger. They laughed, they encouraged each other, and they shared their hopes and dreams. The challenges they faced tested not only their courage but also the depth of their friendship.",
      "Finally, after many days of travel, Lily and Oliver stumbled upon a clearing bathed in golden sunlight. In the center of the clearing stood the magnificent Golden Friendship Flower, its petals shimmering like pure gold.",
      "Overwhelmed with joy, Lily and Oliver picked the flower together, their hearts filled with gratitude for the adventure they had shared. As they held the flower, a warm and comforting glow surrounded them, filling the air with a sense of fulfillment.",
      "With the Golden Friendship Flower in their paws, Lily and Oliver knew that their friendship was already the most precious treasure they could ever have. The flower symbolized the challenges they had overcome, the laughter they had shared, and the unwavering bond they had forged.",
      "They returned to their burrow, where the other forest creatures gathered to hear about their journey. Lily and Oliver shared their story, inspiring everyone to treasure the friendships in their lives and embark on their own adventures, no matter how big or small.",
      "And so, the story of Lily and Oliver's quest for the Golden Friendship Flower became a legend in the Enchanted Forest, reminding everyone that true friendship is an adventure that brings courage, joy, and memories that last a lifetime.",
      "And they lived adventurously and joyfully ever after, cherishing their golden friendship.",
    ],
  ),
  Story(
    id: '1',
    title: "The Quest for the Lost Crown",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692445207/kids_stories_app/The%20Quest%20for%20the%20Lost%20Crown/eaxie5pjggioirifqijb.png',
    categories: ['c3'],
    // Adventure
    complexity: Complexity.challenging,
    duration: 45,
    paragraphs: [
      "In the land of Eldoria, where towering mountains met lush valleys and sparkling rivers, lived a brave young adventurer named Finn. With his trusty map and boundless curiosity, Finn had explored every corner of his homeland, from the Whispering Woods to the Misty Peaks. Yet, there was one place he had always dreamed of visiting: the legendary Lost Castle.",
      "Legends spoke of an ancient crown, studded with rare gems, that was hidden within the Lost Castle. This crown was said to possess magical powers that could bring prosperity and happiness to the entire kingdom. Determined to uncover the truth behind the stories, Finn set out on a grand adventure.",
      "Guided by his map, Finn traversed treacherous paths and crossed rushing rivers. He faced challenges like towering cliffs, rickety bridges, and mysterious caves. Along the way, he met new friends who joined him on his quest – a mischievous forest sprite named Willow and a wise old owl named Olliver.",
      "As Finn and his companions drew closer to the Lost Castle, they encountered obstacles that tested their courage and friendship. They solved riddles, outsmarted cunning creatures, and helped those in need. Each challenge brought them one step closer to the crown, but also taught them valuable lessons about teamwork and perseverance.",
      "Finally, after a long and arduous journey, Finn and his friends reached the entrance of the Lost Castle. The castle was a magnificent sight, its walls adorned with intricate carvings and shimmering with an otherworldly glow. Inside, they navigated a labyrinth of corridors and chambers, each more enchanting than the last.",
      "At the heart of the castle, Finn found the fabled crown resting atop a pedestal. As he gently lifted the crown, a wave of warmth and light enveloped him. The gems sparkled like stars, and a sense of peace and harmony filled the air. Finn knew that he had discovered something truly magical.",
      "With the crown in his possession, Finn and his friends returned to Eldoria. As they journeyed home, they realized that the real power of the crown was not in its gems, but in the unity and friendship it symbolized. They shared the story of their adventure with the people of Eldoria, inspiring them to come together and work towards a brighter future.",
      "And so, the kingdom flourished, and Finn's name became synonymous with bravery and selflessness. The Lost Castle, once a place of mystery, became a symbol of hope and possibility. And as for Finn, he continued to explore and seek new adventures, knowing that the greatest treasures were the ones he discovered along the way.",
    ],
  ),
  Story(
    id: '2',
    title: "The Enchanted Rose",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692445587/kids_stories_app/The%20Enchanted%20Rose/canikhjeovcnbufddhiv.png',
    categories: ['c1'],
    // Fairy Tales
    complexity: Complexity.simple,
    duration: 15,
    paragraphs: [
      "In a faraway land, nestled between rolling hills and ancient forests, there lived a young girl named Lily. Lily was known throughout the village for her kindness and love for nature. She had a special connection with the animals and plants that surrounded her home.",
      "One day, as Lily was exploring the woods, she stumbled upon an old, overgrown garden. In the center of the garden stood a magnificent rosebush, unlike any she had ever seen before. The roses were as white as snow, and they emitted a faint, magical glow. Mesmerized by their beauty, Lily reached out to touch one of the roses.",
      "As soon as her fingers brushed against the petals, a soft voice spoke from within the rose. 'Thank you for setting me free,' it whispered. Startled, Lily looked around, trying to find the source of the voice. Then, a shimmering figure emerged from the heart of the rose. It was a tiny fairy, her wings glistening like dewdrops in the morning sun.",
      "The fairy introduced herself as Seraphina, the guardian of the Enchanted Rose. She explained that the rose had been under a powerful curse, trapped in its own petals for centuries. Only an act of pure kindness could break the curse, and Lily's selfless nature had accomplished just that.",
      "Seraphina granted Lily a special gift – the ability to communicate with animals and plants. With this newfound power, Lily became a true friend to all creatures of the forest. She listened to their stories, solved their problems, and helped them live in harmony.",
      "Word of Lily's remarkable gift spread far and wide. People from distant lands came to seek her advice, and animals journeyed to her garden for solace and companionship. Lily's village became a haven of unity and understanding, all thanks to the Enchanted Rose and her kind heart.",
      "And so, the tale of Lily and the Enchanted Rose became a cherished story, passed down through generations. The garden thrived, its beauty forever preserved, and the world was a better place because of a young girl who believed in the magic of kindness.",
    ],
  ),
  Story(
    id: '3',
    title: "The Starlight Voyage",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692445757/kids_stories_app/The%20Starlight%20Voyage/nmpcris6zwslmfcqqn86.png',
    categories: ['c2'],
    // Fantasy
    complexity: Complexity.challenging,
    duration: 40,
    paragraphs: [
      "In a world where dreams took flight on the wings of imagination, there lived a young dreamweaver named Nova. Every night, she would gaze up at the sky, captivated by the shimmering stars. But Nova had a secret – she could hear the whispers of the stars, each one telling a tale waiting to be told.",
      "One fateful night, a shooting star streaked across the heavens, brighter than any Nova had ever seen. Intrigued, she followed its trail, and to her astonishment, she found a celestial ship nestled among the constellations. The ship was adorned with twinkling lights, and its sails were woven from stardust.",
      "With a heart full of wonder, Nova boarded the ship and set sail on a starlight voyage. Guided by the constellations, she journeyed through the night sky, visiting distant planets and meeting celestial beings. Each stop brought a new adventure – from dancing with moonlit sprites on Luna Lagoon to unraveling riddles in the Enchanted Nebula.",
      "As Nova traveled farther into the cosmos, she discovered that the stars held the stories of beings from across the universe. She listened to tales of courage from brave comet riders and heard the songs of distant galaxies. Through her travels, Nova learned that the universe was a tapestry of stories, woven together by the threads of time and space.",
      "But as her voyage drew to a close, Nova faced a choice. She could return to her own world and share the wondrous stories she had gathered, or she could remain among the stars and become a part of the cosmic tales herself. With a bittersweet smile, Nova realized that her destiny was to bring the magic of the stars to her own realm.",
      "With the memories of her starlight voyage etched in her heart, Nova returned home. She became a storyteller, weaving together the stories of the stars and sharing them with people near and far. Her tales inspired others to look up at the night sky with a newfound sense of wonder, and the world became a place where dreams truly knew no bounds.",
    ],
  ),
  Story(
    id: '4',
    title: "The Secret Garden's Enchantment",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692464512/kids_stories_app/The%20Secret%20Garden%27s%20Enchantment/fgtuyful3dxkkdyawq9w.png',
    categories: ['c1', 'c2', 'c5', 'c12'],
    // Fairy Tales, Fantasy, Folktales, Educational
    complexity: Complexity.challenging,
    duration: 50,
    paragraphs: [
      "In a quiet village nestled between rolling hills and ancient forests, a young girl named Lily discovered a hidden gate that led to a world unlike any other. This enchanting garden, known as the Secret Garden, was a place of wonder and mystery, its beauty and magic transcending the boundaries of reality.",
      "Lily was drawn to the garden's vibrant flowers, which glowed with colors not found in the ordinary world. She felt a sense of belonging as she wandered among the blooms, as if they whispered secrets only she could hear. Little did Lily know, the Secret Garden was a bridge between realms, a place where fantasy and reality converged.",
      "One day, as Lily explored deeper into the garden, she encountered a talking rabbit named Oliver. With his impeccable manners and clever wit, Oliver revealed that the garden was a gateway to various worlds. Each section of the garden represented a different realm, and only those with pure hearts could unlock their magic.",
      "Lily and Oliver embarked on adventures that spanned across the realms, from the towering castles of fairy tales to the futuristic landscapes of science fiction. They solved riddles in the Mystery Woods, befriended fantastical creatures in the Animal Kingdom, and discovered long-lost artifacts in the Historical District.",
      "As Lily's journeys continued, she formed unbreakable bonds with creatures and characters from all walks of life. Together, they overcame challenges, learned valuable lessons, and celebrated the beauty of friendship. The Secret Garden became a place where stories intertwined, blurring the lines between categories and genres.",
      "Word of Lily's magical escapades spread, capturing the imagination of people far and wide. Children and adults alike gathered to hear her tales, and soon, the garden's influence extended beyond its borders. The village flourished as people embraced the spirit of adventure, and the garden's magic brought people together in ways they had never imagined.",
      "Lily's adventures became legendary, and her story was told in the pages of picture books and educational texts. The Secret Garden's legacy extended to bedtime stories that whisked children away to dreams of magical realms, and its enchantment remained a source of joy and inspiration for generations to come.",
    ],
  ),
  Story(
    id: '5',
    title: "The Celestial Friendship Quest",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692465035/kids_stories_app/The%20Celestial%20Friendship%20Quest/vrlngzgk0k9cyfeqc4q4.png',
    categories: ['c1', 'c2', 'c6'],
    // Fairy Tales, Fantasy, Science Fiction
    complexity: Complexity.challenging,
    duration: 55,
    paragraphs: [
      "In a land where fairy tales mingled with science fiction, a young adventurer named Alex embarked on an extraordinary journey. Alex had always been fascinated by the stars and had dreams of exploring the cosmos. Little did they know that their dreams were about to become reality in the most unexpected way.",
      "One night, while gazing at the night sky through a telescope, Alex noticed a shimmering portal among the stars. With a mixture of excitement and trepidation, they stepped through the portal and found themselves in a world that was both magical and futuristic. The sky was adorned with constellations that seemed to dance with life, and floating cities illuminated the horizon.",
      "As Alex explored this new realm, they encountered a small, curious creature named Luna. Luna had the appearance of a mythical being, yet possessed advanced technology that allowed her to manipulate energy and matter. Together, they formed an unlikely but unbreakable friendship, bridging the gap between the fantastical and the technological.",
      "Luna explained that their world was a harmonious blend of magic and science, and the two friends set out on a quest to restore balance to the cosmos. They traveled through vast forests inhabited by talking animals, delved into the mysteries of ancient artifacts, and even navigated through the labyrinthine passages of a floating library.",
      "Their journey led them to the heart of a cosmic conflict, where they discovered that the celestial constellations were fading. Without the constellations' magic, the delicate equilibrium between science and magic was in jeopardy. Alex and Luna realized that they held the key to rekindling the stars' brilliance and restoring harmony.",
      "Drawing on Luna's knowledge of energy manipulation and Alex's understanding of mythical tales, they devised a plan to revive the constellations. Through a combination of advanced technology and ancient incantations, they managed to ignite the stars' magic once more. The skies came alive with a breathtaking display of light and energy.",
      "As the constellations regained their luminosity, the realm was infused with renewed vitality. The floating cities shimmered brighter than ever before, and the animals in the forest sang songs of gratitude. The friendship between Alex and Luna became a beacon of unity, proving that even in a world of diverse influences, true friendship could bridge any gap.",
      "Their tale of adventure, friendship, and cosmic restoration spread across the realms, earning them a place in both the annals of science fiction and the pages of fairy tales. The story of Alex and Luna continued to inspire generations, reminding everyone that the bonds of friendship could transcend boundaries, whether they were made of stardust or code.",
    ],
  ),
  Story(
    id: '6',
    title: "The Enchanted Explorer",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692465971/kids_stories_app/The%20Enchanted%20Explorer/jaqovrmj6xj1e8cpxuxf.png',
    categories: ['c1', 'c2', 'c9', 'c10', 'c11', 'c12'],
    // Fairy Tales, Fantasy, Friendship, Historical Fiction, Picture Books, Educational
    complexity: Complexity.challenging,
    duration: 60,
    paragraphs: [
      "Once upon a time, in a land where fantasy met historical reality, lived a young adventurer named Maya. Maya's fascination with history and her love for the mystical made her an extraordinary explorer. With a satchel of maps and a heart full of curiosity, she set out on a journey that would bridge the gap between the past and the present.",
      "Maya's quest began when she stumbled upon an ancient book filled with maps that led to hidden realms. Each map was imbued with a unique power, transporting her to places where time itself seemed to dance and weave. Armed with her historical knowledge and an adventurous spirit, Maya embarked on a voyage that transcended the boundaries of time.",
      "Her first destination was a realm of medieval castles and chivalrous knights. Here, Maya discovered that history was not confined to books but lived on in the stories told by the stones themselves. She witnessed tournaments, befriended a curious court jester, and even helped a noble knight find his lost sword.",
      "From there, Maya's journey took her to a world of myth and folklore, where creatures of legend roamed free. She encountered talking animals, wise old wizards, and mischievous fairies that could grant wishes. Through her interactions, Maya learned that the line between reality and myth was often thinner than she had ever imagined.",
      "Her next adventure transported her to a distant future, where towering cities reached for the skies and advanced technology was intertwined with nature. Maya marveled at the ingenuity of mankind, yet she also discovered that the core of human emotions remained unchanged across the ages. In this futuristic landscape, she forged friendships that defied the boundaries of time.",
      "Throughout her travels, Maya learned valuable lessons from each era she visited. The courage of the past, the magic of myths, and the innovation of the future all shaped her perspective. She came to understand that while times may change, the core values of kindness, friendship, and curiosity remained constant, connecting people across time and space.",
      "As Maya returned to her own time, she carried the wisdom of her adventures with her. She chronicled her experiences in a series of books that blended history, fantasy, and futuristic imagination. The stories of the Enchanted Explorer became beloved across genres, inspiring generations to embrace the past, dream of the future, and find magic in the world around them.",
    ],
  ),
  Story(
    id: '7',
    title: "Mia's Enchanted Orchestra",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692469450/kids_stories_app/Mia%27s%20Enchanted%20Orchestra/vai7zhnayoigymszxasj.png',
    categories: ['c12', 'c9'],
    // 'Educational', 'Friendship'
    complexity: Complexity.simple,
    duration: 20,
    paragraphs: [
      "In a charming village surrounded by emerald forests and babbling brooks, lived a young girl named Mia. With her fingers graced by the magic of music, Mia could hear melodies in the rustling leaves and symphonies in the raindrops. She dreamed of forming an orchestra that would harmonize the natural world's melodies with her own compositions.",
      "One day, as the sun painted the sky in hues of gold and rose, Mia stumbled upon a hidden glade deep within the forest. The glade was adorned with ancient instruments, each bearing a story of its own. Mia's heart fluttered with excitement – she knew that this was the place where her enchanted orchestra would come to life.",
      "With fervor in her heart, Mia gathered the forgotten instruments and began to practice. Her violin hummed in harmony with the wind's gentle whisper, and the drums echoed the rhythm of the babbling brooks. Birds perched on branches to listen, and even the leaves seemed to dance to the enchanting melodies.",
      "As days turned into weeks, word of Mia's enchanted orchestra spread throughout the village. Curious villagers gathered in the glade, their hearts touched by the music that transcended the ordinary. Mia's orchestra was more than just an arrangement of instruments – it was a symphony of nature and human spirit, woven together in perfect unity."
    ],
  ),
  Story(
    id: '8',
    title: "Leo's Galactic Quest",
    imageUrl:
        'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692499003/kids_stories_app/Leo%27s%20Galactic%20Quest/zg3lys0qivdm6t9duwd7.png',
    categories: ['c6', 'c9'],
    // 'Science Fiction', 'Friendship'
    complexity: Complexity.simple,
    duration: 23,
    paragraphs: [
      "In a quaint cottage nestled at the edge of a small village, lived a boy named Leo. His eyes held the glint of distant galaxies, and his mind was an endless canvas of constellations. Leo's greatest desire was to embark on a galactic quest that would take him beyond the stars and into the heart of the universe.",
      "One night, as the moon cast a silvery glow over the landscape, Leo discovered an old star map tucked away in his grandfather's attic. The map depicted celestial wonders and hidden cosmic trails, a treasure trove of secrets waiting to be unveiled. Leo's heart raced with anticipation – he knew that this star map held the key to his cosmic aspirations.",
      "With unwavering determination, Leo charted a course among the stars. Each constellation became a guidepost, and each comet a fleeting companion. He encountered planets dressed in vibrant hues and met extraterrestrial beings who spoke in riddles. As he ventured deeper into the cosmos, Leo realized that the universe was a symphony of wonder and mystery.",
      "As the years passed, Leo returned to his village with tales that ignited the imaginations of young and old alike. The quaint cottage became a hub of galactic inspiration, and the star map found a new home on Leo's wall, a testament to his intrepid journey. And while Leo's feet remained planted on Earth, his spirit forever wandered among the stars."
    ],
  ),
  Story(
    id: '9',
    title: "Zara and the Enchanted Forest",
    imageUrl: 'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692499599/kids_stories_app/Zara%20and%20the%20Enchanted%20Forest/rayqzeycbujunoqchea6.png',
    categories: ['c2', 'c9'],
    // 'Fantasy', 'Friendship'
    complexity: Complexity.simple,
    duration: 24,
    paragraphs: [
      "In a picturesque village nestled between towering mountains and lush valleys, lived a spirited girl named Zara. Her laughter echoed through meadows, and her eyes held the wisdom of ancient trees. Zara's heart yearned for adventure, and she dreamt of exploring the depths of an enchanted forest rumored to be magical.",
      "One misty morning, as sunlight pierced through the mist like golden threads, Zara stumbled upon an old map tucked within the pages of a dusty book. The map depicted a forest teeming with mythical creatures and hidden wonders. Zara's heart raced with excitement – she knew that this map held the key to the mysterious forest she had longed to discover.",
      "With a backpack filled with provisions and courage in her heart, Zara embarked on her journey. Moss-covered paths led her deeper into the woods, where fireflies lit the way and gentle streams whispered secrets. Zara encountered mischievous fairies who played pranks and encountered a wise old owl who shared tales of the forest's magic.",
      "As the days turned into weeks, Zara's connection with the forest grew stronger. She befriended creatures big and small, and her laughter intertwined with the rustling leaves. The enchanted forest revealed its secrets one by one, and Zara felt like a part of its timeless tapestry.",
      "When Zara returned to her village, she brought with her stories of the enchanted forest's wonders. The villagers gathered around, enchanted by her tales, and the old dusty book became a cherished relic. Zara's heart remained forever entwined with the magic of the forest, and her spirit continued to dance among the ancient trees."
    ],
  )
];
