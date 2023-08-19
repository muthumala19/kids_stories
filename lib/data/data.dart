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

const stories = [
  Story(
    id: '',
    title: "The Quest for the Golden Friendship Flower",
    imageUrl: 'https://res.cloudinary.com/dgvv3j3st/image/upload/v1692354664/kids_stories_app/The%20Quest%20for%20the%20Golden%20Friendship%20Flower/asmcxs1mzrm4duyhixaq.jpg',
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
    id: '',
    title: "The Quest for the Lost Crown",
    imageUrl: '',
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
    id: '',
    title: "The Enchanted Rose",
    imageUrl: '',
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
    id: '',
    title: "The Starlight Voyage",
    imageUrl: '',
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

];
