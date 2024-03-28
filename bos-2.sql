-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 27, 2024 at 09:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bos`
--

-- --------------------------------------------------------

--
-- Table structure for table `djs`
--

CREATE TABLE `djs` (
  `id` int(4) NOT NULL,
  `name` text DEFAULT NULL,
  `url` text NOT NULL,
  `bio` text DEFAULT NULL,
  `post_date` text DEFAULT NULL,
  `hometown` text DEFAULT NULL,
  `soundcloud` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `djs`
--

INSERT INTO `djs` (`id`, `name`, `url`, `bio`, `post_date`, `hometown`, `soundcloud`) VALUES
(656, 'DJ K!RK', 'https://bosphilly.com/dj/dj-kirk/', '<strong>DJ K!RK</strong> is a Philadelphia resident better known as Kirk Beres, who has recently emerged into the DJ scene, where he continues to \"bring\" it.\n\nDJ K!RK prides himself in being able to read the crowd by playing not only Top 40 remix party crowd favorites but also classic club/house anthems.\n\nDJ K!RK is a high-energy, professional mobile DJ in the Philadelphia region. With a diverse background in events, he provides an experience playing the best music of all time that spans genres and eras, from the classics to the contemporary.\n\nA resident of Philadelphia, DJ K!RK believes in giving back to his community. That is why he co-created a charity pop-up dance party known as ChariTdance. It\'s a way to not only throw a dance party but also help give back to local charities of choice.', '2021-03-20 20:01:31', 'Philadelphia, PA', 'https://soundcloud.com/dj_krk/primal-outfest-mixtape-2019'),
(1622, 'DJ J Warren', 'https://bosphilly.com/dj/dj-j-warren/', '<!-- wp:paragraph -->\n<p>J Warren, born in Boston, is an international DJ and music producer. His unique blend of Brazilian big room circuit, progressive house and electro house has gained him a global fanbase. His high energy vocal driven live sets and podcasts are known for including fresh revisions of classic anthems, his custom edits, custom mashups and his own remixes. Whether he’s at the helm of an afternoon, tea dance, a prime time circuit event or a leather afterhours, he always brings his fresh, unique sound to the table.<br><br>J Warren fell in love with music at the young age of 15, and started DJing late in his college years. After college, he moved to Austin, TX where he started his first residency at Rain on 4th (nightclub). While enjoying various pride events around the country, he fell in love with the circuit sound. Once he headlined his first circuit party at Splash Days in Austin, he was hooked and it forever changed his music career. He devoted his time and talents to touring and his signature sound quickly became a fan favorite.<br><br>J Warren’s has spun some major events and venues in his career, such as The Pub (Goiânia, Brazil), Trade (New York City), Purple Party (Dallas), Kamasutra (SF Pride), Circuit Saturday (Denver), Overdrive (San Diego), Ruff (Vancouver Pride), Splash Days (Austin), Gay Days (Orlando), HNO (New Orleans), and many more. He has gained several residencies, including SAGA Saturdays (at his home club in Boston), SIN (Toronto), and the notorious DILF party (LA, San Diego, and Atlanta).<br><br>On the production side, J Warren started with his first single, “It’s Too Late” (2015) featuring the vocals by indie favorite of Janellie with co-producer Tristan Jaxx. Warren continues to release official remixes and un-official bootlegs, and has also co-produced remixes with such luminaries like Oscar Velazquez (Mexico) and Maycon Ries (Brazil).<br><br>J Warren continues to gain the attention of major events, promoters and record labels and is already booked for some major events coming up in 2018, including Winter Party Festival (Miami) this coming March. See less</p>\n<!-- /wp:paragraph -->', '2021-07-27 20:07:29', 'Atlanta, GA', 'https://soundcloud.com/j-warren-official'),
(1910, 'DJ Chris Urban', 'https://bosphilly.com/dj/dj-chris-urban/', '<!-- wp:paragraph -->\n<p>Chris toured the world back-up dancing for 6 years and has been djing for 10 more. His passion for performing transcends into spinning open-format club jams; and remixing relevant pop/diva vocals into tribal circuit and tech-house that will make you dance. His style of mixing will take you on a journey, always intending to make a memorable experience.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} -->\n<p class=\"has-black-color has-text-color\">Chris and his production brother, Drootax  create originals and remixes inspired by EDM, house, tribal, moombahton and Jersey club sound. ?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Current residencies:<br>SHORT CIRCUIT - (Philadelphia, PA)<br>ROXOFF - (Philadelphia, PA)</p>\n<!-- /wp:paragraph -->', '2021-08-25 20:43:17', 'Philadelphia, PA', 'https://soundcloud.com/dj-chris-urban'),
(1923, 'DJ MXM', '', '<!-- wp:paragraph -->\n<p>Aspiring, self taught DJ searching for fellow clubbers and dance music lovers. Collecting gems from an early age and doing my part to spread love and the underground sound.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Proudly serving a fine selection of house, tech, and tribal beats. I’m rooted in New York club sounds and pumping Jersey Shore classics, but I listen to all dance music and love anything with a groovy beat. I’m addicted to the drums and my sound reflects my deep connection to the rhythm and spiritual feeling I know and love. I’ve found my flow.</p>\n<!-- /wp:paragraph -->', '2021-08-31 22:54:20', 'NY/NJ', ''),
(2403, 'DJ Guy Scheiman', 'https://bosphilly.com/dj/guy-scheiman/', '<!-- wp:paragraph -->\n<p>Over the past decade, Scheiman has amassed an impressive roster of club appearances and major headlining events that span 3 continents. He’s played some of the biggest parties and clubs in Europe and the Middle East – including Oman 17 (TLV), Resident Beef (TLV), We party&nbsp; &amp; Kluster (Madrid Main Pride Event), Salvation, HustlaBall (London), Black &amp; White Party (Zurich), Redwolf/Scream/Matinee (Paris), Hunket (Brussels), Glam/L\'Omega (Nice), Pulse (Hamburg), OMG (Prague), Bear Necessity, FunHouse XXL - 8,000 PPL (Amsterdam Pride), Red &amp; Blue (Antwerp) and many more.​</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Outside Europe, Scheiman has toured extensively in the United States, Brazil, Chile Mexico, and China – where he headlined parties as Revolution In Rio (NYE &amp; Carnival), DF &amp; G – Music Fest in Mexico City, Destination Beijing, Icon Shanghai, and I:M festival in Seoul. In the U.S &nbsp;Scheiman headlined Jeffrey Sanker’s White Party Palm Springs, Dallas Purple Party, Orlando\'s One Magical Weekend, and many more. He also debuted his DJ skills in Canada for Fly Toronto. Guy Scheiman is global!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>​</p>\n<!-- /wp:paragraph -->', '2021-12-13 21:13:07', 'Denver, CO', 'https://soundcloud.com/guyscheimanmusic/sets/dj-sets'),
(2552, 'DJ Nina Flowers', 'https://bosphilly.com/dj/dj-nina-flowers/', '<!-- wp:paragraph -->\n<p>Jorge Flores, aka NINA FLOWERS, was born in the city of Bayamon Puerto Rico in 1974.He began his career in music in 1989, where he became a resident Dj at one of the most prestigious clubs in the Caribbean, Krash Klub Kafe. As a DJ/Producer he brings an infectious understanding of how to bring music alive on the dance floor.As a recording artist he has collaborated with some of the most talented Dj\'s/Producers/Remixers of this new Era in music.<br><br>Today Nina Flowers holds Dj residencies in several cities in the US and, and he continues to captivate fans around the globe with his powerfully engaging connection to the audiences, and his progressive sound filled with tribal beats.“The lights, the music, the stage, and the crowd – putting it all together – magic in the making”&nbsp;</p>\n<!-- /wp:paragraph -->', '2019-10-12 02:50:00', 'Denver, CO', 'https://soundcloud.com/nina-flowers'),
(2911, 'DJ Shane Marcus', 'https://bosphilly.com/dj/dj-shane-marcus/', '<!-- wp:paragraph -->\n<p>Shane Marcus is a New York City based DJ aimed at creating a full sensory musical experience by matching powerful vocals and pulsating drums centered on an international sound with heavy influences from Tel Aviv.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Having worked in nightlife for over ten years, Shane developed an affinity and passion for house music, and sought out to recreate those memorable moments that drove him to take over the decks as a DJ.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Shane delivers a truly explosive high energy performance mixing tracks from the unexpected yesterday to the well-known music we all know and love today; an experience that focuses on bringing the crowd together in a unique and memorable way.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>He believes that if you can deliver an emotional experience to people through music, you can lift their senses and propel them to wherever they want to be.</p>\n<!-- /wp:paragraph -->', '2022-04-05 16:02:39', 'New York City', 'https://soundcloud.com/shanemarcus/masterbeat-forever-tel-aviv-promo-set-shane-marcus-1'),
(3111, 'DJ TWiN', 'https://bosphilly.com/dj/dj-twin/', '<!-- wp:paragraph -->\n<p>TWiN is a long time dj who is new to streaming. TWiN is one of Washington DC\'s most prominent circuit DJs. With a large following and a resident at DC\'s hottest circuit party (Flashy), he is known to keep the energy high and the dance floor packed.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>He\'s opened up for the world famous DJ/Producer Marshmello and the legendary house DJ Erick Morillo. He\'s spun countless times at CHERRY and all the major circuit parties in Washington DC.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '2022-03-04 15:14:03', 'Washington DC', 'https://soundcloud.com/djtwinofficial'),
(3540, 'DJ Superstar Cindel', 'https://bosphilly.com/dj/dj-cindel/', '<!-- wp:paragraph -->\n<p>DJ Cindel grew up around Chicago where his endless exposure to house music led to his love, and eventual practice, of producing it. Having done so since the age of 15, he has especially honed his skills creating drum mixes and tribal-house vocals, earning him the title “The King of Drums”. Major influences such as Danny Tenaglia, Chus and Ceballos and Ralphi Rosario, along with his Puerto Rican roots, have helped mold his high-energy style into a successful career. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Now, DJ Cindel continues to land bookings all over the US as well as internationally, holding 7 residencies in LA, Chicago, SF, Atlanta, Boston, Vancouver &amp; Toronto. Cindel is very known for his deep tribal after-hours sounds mixed with lots of drums. No matter what the event or venue, he commits to giving you a set full of fantastic beats and quality sound.</p>\n<!-- /wp:paragraph -->', '2022-07-21 15:32:23', 'Chicago', 'https://soundcloud.com/djcindel'),
(3556, 'DJ Joey with the Mustache', '', '<!-- wp:paragraph -->\n<p>Joey (you know, the one with the mustache, obviously) mixes disco, house, funk and everything in between to provide audiences exceptionally authentic, fun, and meaningful experiences</p>\n<!-- /wp:paragraph -->', '2022-07-21 15:45:43', 'NYC', 'https://soundcloud.com/joeywiththemustache'),
(3609, 'DJ Nick Stracener', 'https://bosphilly.com/dj/dj-nick-stracener/', '<!-- wp:paragraph -->\n<p>DJ Nick Stracener, who many already know as an influencer in the LGBT community, is also a classically trained musician with his finger on the pulse of the current circuit club scene. From gogo dancing to promoting, Nick has lived the scene from every angle. Passionate about sound, DJ Nick Stracener has several creative lenses he filters his music through, combining indigenous rhythms with sultry female vocals. Performing with an energetic flair that’s addictive as it is therapeutic, Nick Stracener is a musical medicine man. His uplifting sound is self-care shared, offering listeners with a remedy for life\'s daily grind, coupled with a holistic grinding of his own. Don’t get your turntables twisted. He may look like a musclebound meathead, but fans know Nick takes his art more seriously than himself, a trait his 187k Instagram followers love about him. -Come for the muscle, stay for the music.</p>\n<!-- /wp:paragraph -->', '2022-08-13 17:08:48', 'Dallas, TX', 'https://soundcloud.com/nickstracener'),
(4135, 'DJ Mike Foch', 'https://bosphilly.com/dj/dj-mike-foch/', '<!-- wp:paragraph -->\n<p>House &amp; Techno DJ, Nature Lover and more.  You need more HOUSE MUSIC in your life. Spreading the good sounds, the rhythm, the vibe.</p>\n<!-- /wp:paragraph -->', '2022-10-21 19:03:49', 'NJ / NYC / Philly', 'https://soundcloud.com/dj_foch/bos-philly-stuffd-teaser'),
(4958, 'DJ Chris B', 'https://bosphilly.com/dj/chris-barns/', '<!-- wp:paragraph -->\n<p>DJ Chris B aka Chris Barnes, has been electrifying dance floors since 2009, landing his first club residency after spinning his first ever live gig in Salt Lake City, Utah. He quickly became Salt Lake City’s #1 favorite Gay Club DJ, several years running. In 2011, he joined an elite group of national DJs by becoming a Billboard dance chart reporter for several years. Since then, Chris has headlined countless events on the West Coast, East Coast, and everywhere in between. Chris has always had a passion for dance music and it shows through his high energy, fusion of house and circuit sounds, and beautiful vocals that he plays, elevating every dance floor he visits. His music takes him and everyone in the room on a journey, and it’s always a night to remember.</p>\n<!-- /wp:paragraph -->', '2023-01-03 16:02:57', 'Philadelphia, PA', 'https://soundcloud.com/djchrisb79/tracks'),
(5077, 'DJ Abel Aguilera', 'https://bosphilly.com/dj/dj-abel-aguilera/', '<!-- wp:paragraph -->\n<p>Meet Abel Aguilera, a man who has reached the pinnacle of success in the DJ world. Alongside his production and mixing team, Rosabel, Abel has produced numerous #1 Billboard dance hits, including their Grammy-nominated remix of Rihanna\'s \"Only Girl in the World.\" He\'s also served as the official remixer for major artists like Gloria Estefan, Jennifer Lopez, Madonna, Katy Perry, and Janet Jackson, to name a few. With multiple #1 hits under his belt, including their own hit \"Chacha Heels\" and a two-week #1 with a classic remake of \"Don\'t You Want My Love,\" featuring Debbie Jacobs Rock, it\'s no wonder Abel has earned a reputation as an \"Uber DJ.\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>But Abel\'s journey to the top didn\'t happen overnight. A native of Brooklyn, New York, Abel developed a passion for house music at a young age and had his first set of turntables and mixer at 15. Within a year, he was spinning at high school parties and weddings. Throughout the 1980s, 1990s, and 2000s, Abel held residencies at some of the most renowned nightclubs in Miami and New York City, including Club 1235, Sound Factory, Paragon, Salvation, and Space. He also hosted a five-year radio mix show on Miami\'s Super Q FM 107 from 1982-1987. It was at Paragon in South Beach, Miami, where Abel truly made a name for himself in the dance community, with his signature blend of heavy, progressive tribal beats and diva anthems. From there, he secured headlining gigs at clubs and events across the globe and became a fixture at San Francisco\'s Aftershock and WPPS.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In 1994, Abel teamed up with Ralphi Rosario to form the production and mixing team, Rosabel. Together, they\'ve released a full-length album, ROSABEL \"The Album,\" and an EP on Nervous Records titled \"The Unexpected EP: Can You Resist?\" Abel is known for his diverse style, blending underground house, deep house, techno, and tech house, and has also created a party brand called \"Resist.\" So, if you\'re looking for an unforgettable night out on the dance floor, be sure to check out one of Abel\'s events happening around the world, including in Miami, New York City, and beyond.</p>\n<!-- /wp:paragraph -->', '2023-01-10 02:17:37', 'Miami, FL', 'https://soundcloud.com/abelaguilera/abel-aguilera-in-the-mix-93fm-112022'),
(5163, 'DJ Joshua Ruiz', 'https://bosphilly.com/dj/dj-joshua-ruiz/', '<!-- wp:paragraph -->\n<p>Born in NYC into a mixed Cuban/ Puerto Rican family, house music was an integral part of his upbringing and still is to this day. Upon moving to Miami for college in 2010, it was then Joshua was exposed to nightclubs and venues with music from industry legends.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Joshua’s sound is a blend of tech house, tribal circuit and sultry progressive beats. Inspired by greats such as Abel Aguilera and Eddie Martinez, each of his sets are a culmination of genres that he skillfully curates to take his listeners on their respective musical journeys.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Entering the NYC nightlife scene in the summer of 2021 with the ability to play to various crowds and rooms, he has swiftly made a name for himself in the circuit and house music scene.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Joshua holds 2 current residences at The Q NYC and The Eagle - Wilton Manors.</p>\n<!-- /wp:paragraph -->', '2023-01-11 23:38:31', 'New York, NY', 'https://soundcloud.com/joshua-ruiz-392335694'),
(5272, 'DJ James Anthony', 'https://bosphilly.com/dj/dj-james-anthony/', '<!-- wp:paragraph -->\n<p>James Anthony is an internationally renowned DJ, remixer and producer.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>From his earliest years, James has been bringing music to the masses while cultivating a deep musical knowledge as a tastemaker, touring DJ and radio host on SiriusXM Studio 54.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>James’ proven versatility as a DJ has made him a sought after name, bringing his signature big tribal disco big room sound to the delight of clubgoers from all over.&nbsp; From soaring vocal house sets to deep after hours to poolside classic disco tea dances, James has earned a reputation as an innovator in the DJ booth who is never afraid to think outside the box to create the perfect sound for every event.&nbsp;</p>\n<!-- /wp:paragraph -->', '2023-01-23 15:47:31', 'New York, NY', 'https://soundcloud.com/thedjjamesanthony/sets/dj-james-anthony-presents'),
(6876, 'DJ Brett Oosterhaus', 'https://bosphilly.com/dj/dj-brett-oosterhaus/', '<!-- wp:paragraph -->\n<p>Brett Oosterhaus is a Big Room DJ and producer from New York City. He developed his love of music on the dance floors of legends like Peter Rauhofer, Manny Lehman, Abel, Victor Calderone, Offer Nissim and many others. Incorporating genres from Circuit and House, to Tribal, Progressive and Tech House, Brett has spun for some of the biggest promoters and parties in the gay dance community. His productions have been played at nearly every major Circuit event in the world, and by some of the most respected names in the business. More than 25 of Brett’s original productions and remixes have charted on Beatport - the largest dance music site in the world. Brett has DJ’d at some of the biggest gay festivals and clubs across North America, including major brands like MASTERBEAT, WPPS, Mantamar (PV), Kinetic Presents (DC), MEAT, UNITE, and The Eagle NYC, just to name a few. Whether it’s a Prime-Time Event, Tea Dance or an Afterhours, Brett moves the crowd with his love of music, creativity and passion for his craft.</p>\n<!-- /wp:paragraph -->', '2023-05-16 20:15:14', 'NYC', 'https://soundcloud.com/bos-philly/bosphilly-presents-super-bros-dj-brett-oosterhaus'),
(6888, 'DJ Alexis Tucci', 'https://bosphilly.com/dj/dj-alexis-tucci/', '<!-- wp:paragraph -->\n<p>Alexis Tucci s a whole VIBE. Passionate and deeply committed to anything and everything dance music and a good time, this lil mama has done it all. But the one job carrying her to new global heights and gaining her international recognition, as well as her rapid US popularity in her 28 + year career, is that of the Disc Jockey.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Paired with more than 30 years experience as a successful rave, edm and nightlife promoter in the Midwest, this Saint Louis, Missouri native has withstood the test of time with her carefully curated sets and skillfully designed immersive underground events… currently recognized for her successful 9 year run with her event series Nightchaser and most recently receiving massive recognition for taking the LGBTQ+ community by storm with her fun loving, positive, community focused energy and slamming disco and house sets! Coast to Coast, Alexis has been selling out shows in some of the biggest gay nightclubs and events in the country, and has become a staple on Fire Island where she is often referred as Queen of Fire Island and mother. The latter a title she wears proudly.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>With a lifetime of vinyl djing under her belt and a fast paced traveling career on the rise digitally, Alexis is rocking crowds all over the globe with her deep driving disco, tribal afro house and intricately woven deep n funky tech house. Given proper length to play, she is known to drop tempos, drift into break beats and explore tribal, afro-cuban rhythms in her sets. A story teller thru and thru.<br>Alexis is known for pairing her dj sets with improvisational live performances including drums, horns and guitars and often with her writing partner Jesse Gannon on Keys… performing as a full ensemble or in smaller configurations and occasionally with Grammy Award winning Ronkat Spearman from the P Funk Allstars!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>She can be found performing at Burning Man every year on various stages as well as her own sound stage, performing at other regional burns and Afrikaburn in South Africa and traveling coast to coast and overseas to spread her abundant love and enthusiastic dj sets to the people. There are too many artists to count in her extensive career but to name a few… she has rovided direct support for some of the best… Purple Disco Machine, Horse Meat Disco, Claud Vonstroke, Gene Ferris, Francois K, Mark Farina, LP Giobbi, Todrick Hall, Osunlade, Dj Dan, Seth Schwarz, Joeski, Derrick Carter, Sabo, and the list goes on!</p>\n<!-- /wp:paragraph -->', '2023-05-17 13:41:05', 'St. Louis', 'https://soundcloud.com/alexis-tucci-hansen'),
(6908, 'DJ Jace M', 'https://bosphilly.com/dj/dj-jace-m/', '<!-- wp:paragraph -->\n<p>DJ Jace M is a highly skilled and experienced DJ with a remarkable ability to move crowds with his infectious beats and expert song selection. With two decades of experience in the club circuit, he has perfected the art of creating the perfect atmosphere on the dance floor. DJ Jace M\'s deep love for music is the driving force behind his DJ career, and whether he\'s listening to music, composing his own tracks, or performing for enthusiastic club-goers, his passion for music is palpable.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In addition to his DJing prowess, DJ Jace M is also a talented computer engineer, working for a renowned cloud computing company. This background in technology has provided him with a unique advantage in music production, allowing him to seamlessly remix songs and adapt them for the energetic dance floors he frequents. His ability to read the crowd and understand the nuances of dance music sets him apart as a DJ with exceptional talent. With a strong commitment to creating inclusive spaces, Misleh actively participates in events and sponsors occasions through his production company, Thots &amp; Prayers, aiming to provide a welcoming environment where people from all walks of life can come together and celebrate the power of music.</p>\n<!-- /wp:paragraph -->', '2023-05-22 14:04:44', 'Miami', 'https://soundcloud.com/jacedj'),
(7532, 'DJ Las Bibas', 'https://bosphilly.com/dj/las-bibas/', '<!-- wp:paragraph -->\n<p>Las Bibas From Vizcaya, the first Brazilian drag DJ, singer, musician, and music producer, has been an influential force in the LGBTQI+ music scene for over twenty-five years. Known for her high-energy, performative sets filled with her own remixed club hits, Las Bibas From Vizcaya has DJ\'d at renowned danceclubs and events around Brazil, including The Week Brazil, Acquaplay, and numerous Gay Pride celebrations. With over thirty official releases across various digital platforms, an album mentioned by TIME OUT magazine, and a wildly successful podcast, Las Bibas From Vizcaya has also proven her prowess in music production and performance. Her YouTube channel currently boasts over six million views, and her eclectic blend of house, tribal, funk, and pop has solidified her as a major player in the worldwide dance music scene.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Beyond the DJ booth, Las Bibas From Vizcaya is all about fun, laughter, and embracing the fabulousness of the gay community and culture. With lyrics that celebrate everything from drag, men, and parties to outrageous personas and looks, her music serves as an unapologetic tribute to the vibrant, diverse world she inhabits. Collaborating with talented guest vocalists and always pushing the envelope.</p>\n<!-- /wp:paragraph -->', '2023-06-23 14:27:10', 'Vizcaya, Brazil', 'https://soundcloud.com/lasbibasofficial/clubland-sf-pride-2023'),
(7552, 'DJ Gui Barros', 'https://bosphilly.com/dj/dj-gui-barros/', '<!-- wp:paragraph -->\n<p>Introducing the talented and dynamic DJ Gui Barros, a renowned producer and composer in the gay nightlife scene. Currently rocking the beats as a DJ and producer at Victoria Haus, the premier LGBTQ+ club in Brasília, DJ Gui Barros brings a vibrant and unforgettable experience to partygoers.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>DJ Gui Barros has built a solid reputation for combining the best of electronic music and pulsating beats, keeping the dance floor packed and the energy electrifying. Attendees at Victoria Haus can expect nothing less than a sensational night, filled with love, unity, and the freedom to express their true selves under the mesmerizing lights.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>In his private life, Gui is a loving partner to Jordan, and a proud father to his adorable puppy, Dudu.</p>\n<!-- /wp:paragraph -->', '2023-06-23 16:04:33', 'Brazil', 'https://soundcloud.com/djguibarros'),
(7876, 'DJ Charlie B', '', '<!-- wp:paragraph -->\n<p>Introducing the sensational DJ Charlie B! Our fantastic groove guru, reigning from the heart of Los Angeles! He\'s notorious for spinning records that burst with bubbly beats, infused with the nostalgic charm of an upbeat disco era. One thing\'s for sure - DJ Charlie B is a supernova of positivity, sending out waves of good energy that resonate across the universe. He operates on the mantra that any moment not spent celebrating is a precious moment wasted. Prepare to dive into an ocean of unforgettable tunes, and let the magic of DJ Charlie B grip your soul into a rhythmic dance extravaganza!</p>\n<!-- /wp:paragraph -->', '2023-08-08 19:04:37', 'Los Angeles', 'https://soundcloud.com/djcharlieb1'),
(7877, 'DJ Alex Acosta', '', NULL, NULL, NULL, NULL),
(7878, 'DJ Riva', '', NULL, NULL, NULL, NULL),
(7879, 'DJ Bianca', '', NULL, NULL, NULL, NULL),
(7880, 'DJ Danny Kim', '', NULL, NULL, NULL, NULL),
(7882, 'DJ Lili St Queer', '', NULL, NULL, NULL, NULL),
(7883, 'DJ Night Owl', '', NULL, NULL, NULL, NULL),
(7884, 'DJ Sakalem', '', NULL, NULL, NULL, NULL),
(7885, 'DJ Stephen Durkin', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `djs_events`
--

CREATE TABLE `djs_events` (
  `id` int(11) NOT NULL,
  `dj_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `djs_events`
--

INSERT INTO `djs_events` (`id`, `dj_id`, `event_id`) VALUES
(1, 5077, 33),
(2, 7877, 47),
(3, 6876, 47),
(4, 6888, 46),
(5, 6888, 35),
(6, 7878, 35),
(7, 7879, 35),
(8, 6876, 34),
(9, 6876, 40),
(10, 4958, 9),
(11, 4958, 11),
(12, 4958, 13),
(13, 4958, 30),
(14, 1910, 19),
(15, 1910, 28),
(16, 1910, 45),
(17, 3540, 45),
(18, 7880, 43),
(19, 2403, 22),
(20, 1622, 26),
(21, 5272, 32),
(22, 5272, 41),
(23, 5163, 31),
(24, 5163, 37),
(25, 656, 1),
(26, 656, 2),
(27, 656, 3),
(28, 656, 7),
(29, 656, 10),
(30, 656, 12),
(31, 656, 15),
(32, 656, 17),
(33, 656, 20),
(34, 656, 39),
(35, 7532, 38),
(36, 6908, 38),
(37, 7882, 4),
(38, 7882, 6),
(39, 4135, 27),
(40, 4135, 29),
(41, 4135, 42),
(42, 3609, 24),
(43, 7883, 8),
(44, 2552, 14),
(45, 7884, 44),
(46, 2911, 21),
(47, 7885, 5),
(48, 3540, 25),
(49, 3111, 16),
(50, 3111, 23),
(51, 3111, 36);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `venue` text DEFAULT NULL,
  `date` text DEFAULT NULL,
  `flyer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `venue`, `date`, `flyer`) VALUES
(1, 'Boys of Hallows Eve', 'Bike Stop', '10/27/2017', 'https://bosphilly.com/wp-content/uploads/2024/01/Screenshot-2024-01-13-174357-jpg.webp'),
(2, 'MASC', 'Bike Stop', '5/12/2018', 'https://bosphilly.com/wp-content/uploads/2024/01/32072754_10156358078543524_8375506979652632576_n-jpg.webp'),
(3, 'FREAQ', 'Voyeur', '8/4/2018', 'https://bosphilly.com/wp-content/uploads/2018/08/37800365_10156548655803524_1533519374411890688_o1-150x150.jpg'),
(4, 'FREAQ - Gear Party', 'Bike Stop', '8/13/2018', 'https://bosphilly.com/wp-content/uploads/2024/01/gear-jpg.webp'),
(5, 'Goldlust', 'Trocadero', '10/6/2018', 'https://bosphilly.com/wp-content/uploads/2021/03/42551557_2361290193911244_2168007454166614016_o1-150x150.jpg'),
(6, 'Thriller', 'Bike Stop', '10/26/2018', 'https://bosphilly.com/wp-content/uploads/2018/10/42918020_10156713956248524_5949112871324483584_o1-150x150.jpg'),
(7, 'BOS VIP', 'Voyeur', '12/28/2018', 'https://bosphilly.com/wp-content/uploads/2021/03/1-6-1024x680.jpg'),
(8, 'LTHR', 'Bike Stop', '1/17/2019', 'https://bosphilly.com/wp-content/uploads/2019/01/50248163_10156959342458524_6939748602860273664_o1-150x150.jpg'),
(9, 'HRC After Dark', 'Concourse', '3/9/2019', 'https://bosphilly.com/wp-content/uploads/2021/03/52016064_10157040135668524_8282408989371662336_o1-150x150.jpg'),
(10, 'STEAM\'D', 'Bike Stop', '4/27/2019', 'https://bosphilly.com/wp-content/uploads/2021/03/56410963_10157153549263524_2799502195119095808_o1-150x150.jpg'),
(11, 'Fairydust', 'Moshulu', '6/8/2019', 'https://bosphilly.com/wp-content/uploads/2021/03/59605999_10157220636373524_7608471282815860736_o1-150x150.jpg'),
(12, 'Poolside Disco', 'The Raven Pool', '8/4/2019', 'https://bosphilly.com/wp-content/uploads/2019/08/67433468_10157434367998524_9121601893422858240_o1-150x150.jpg'),
(13, 'Circuitron', 'Bike Stop', '8/24/2019', 'https://bosphilly.com/wp-content/uploads/2024/01/67743634_10157470535833524_5318032779399659520_n-jpg.webp'),
(14, 'Primal', 'Warehouse on Watts', '10/12/2019', 'https://bosphilly.com/wp-content/uploads/2019/10/69406359_10157513848008524_303617358482636800_o1-150x150.jpg'),
(15, 'SIN', 'Bike Stop', '1/16/2020', 'https://bosphilly.com/wp-content/uploads/2024/01/80039017_10157869157168524_2112401427413336064_n-jpg.webp'),
(16, 'Go4Gold', 'Bike Stop', '2/29/2020', 'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F91227989%2F13497456417%2F1%2Foriginal.20200206-151823?h=200&w=450&auto=format%2Ccompress&q=75&sharp=10&s=727affacca132c30c9a9bb1719982d83'),
(17, 'Pride Night', 'Concourse', '6/11/2021', 'https://bosphilly.com/wp-content/uploads/2021/05/thumbnail_Pride-Night-Concourse-1024x576.jpg'),
(18, 'Night Swim', 'Vesper Pool Club', '8/21/2021', 'https://bosphilly.com/wp-content/uploads/2021/08/227058960_1022061918561384_29486814370172141_n-1024x576.jpg'),
(19, 'PINKLUST', 'Cockatoo', '10/9/2021', 'https://bosphilly.com/wp-content/uploads/2021/09/https___cdn.evbuc_.com_images_155527989_69030302143_1_original1-150x150.jpg'),
(20, 'Ice Queen', 'The Foundary', '2/26/2022', 'https://bosphilly.com/wp-content/uploads/2022/02/thumbnail_ice-queen-flyer-cover-photo-1024x582.jpg'),
(21, 'Big Pride Boat Party', 'Moshulu', '6/3/2022', 'https://bosphilly.com/wp-content/uploads/2022/06/boat-1-1024x683.jpg'),
(22, 'Cyberpunk 2069', 'Concourse', '6/4/2022', 'https://bosphilly.com/wp-content/uploads/2022/06/cyberpunk-1024x683.jpg'),
(23, 'Eden', 'The Alley', '8/19/2022', 'https://bosphilly.com/wp-content/uploads/2022/07/eden-1024x731.jpg'),
(24, 'SIR', 'Warehouse on Watts', '10/7/2022', 'https://bosphilly.com/wp-content/uploads/2022/10/300920055_785752409237953_3752854817553819110_n-819x1024.jpg'),
(25, 'Cirque Du Circuit', 'The Ave', '10/8/2022', 'https://bosphilly.com/wp-content/uploads/2022/09/301313180_543136780899668_6710907239204231705_n-1024x1024.jpg'),
(26, 'EROTICA', 'Warehouse on Watts', '11/6/2022', 'https://bosphilly.com/wp-content/uploads/2021/09/241568674_902583224027911_8957780767394380774_n-1024x536.jpg'),
(27, 'Stuff\'d', 'Bike Stop', '11/23/2022', 'https://bosphilly.com/wp-content/uploads/2022/11/thumbnail1-1024x683.jpg'),
(28, 'Touchdown', 'Bike Stop', '1/28/2023', 'https://bosphilly.com/wp-content/uploads/2022/12/mccann76_a_group_of__handsome_muscular_body_builders_41de0278-c1e5-4c0d-9db8-170298ab52321.jpg'),
(29, 'Earn Your Beads', 'Bike Stop', '2/18/2023', 'https://bosphilly.com/wp-content/uploads/2022/12/mccann76_handsome_muscled_man_in_mardi_gras_mask_and_beads_f4eb54cb-5003-426e-bdac-4fac6e8a8dee1.png'),
(30, 'Go Green', 'Bike Stop', '3/18/2023', 'https://bosphilly.com/wp-content/uploads/2022/12/gogreen-e1679022827546-150x150.png'),
(31, 'Get Pinned', 'Bike Stop', '4/15/2023', 'https://bosphilly.com/wp-content/uploads/2022/12/336012478_227328893167518_7651323374912070110_n1-e1680789084637.jpg'),
(32, 'YES SIR!', 'Bike Stop', '5/20/2023', 'https://bosphilly.com/wp-content/uploads/2022/12/yessir.png'),
(33, 'Candyland', 'Concourse', '6/3/2023', 'https://bosphilly.com/wp-content/uploads/2023/06/IMG-1.jpg'),
(34, 'Super Bros', 'Bike Stop', '6/17/2023', 'https://bosphilly.com/wp-content/uploads/2023/05/346101430_640522494114000_6401866762391250300_n.jpg'),
(35, 'Miami Vice', 'Stratus', '8/6/2023', 'https://bosphilly.com/wp-content/uploads/2023/06/361915673_1474708496619322_7800326743914844538_n-scaled.webp'),
(36, 'Summer Camp', 'Bike Stop', '8/19/2023', 'https://bosphilly.com/wp-content/uploads/2023/06/Summer-Camp-Flyer-jpg.webp'),
(37, 'White Party', 'Bike Stop', '9/16/2023', 'https://bosphilly.com/wp-content/uploads/2023/06/370609755_681255756833807_9192501806118560638_n-819x1024.webp'),
(38, 'Jungle', 'Concourse', '10/7/2023', 'https://bosphilly.com/wp-content/uploads/2023/06/354469729_2020568871610961_7716554767228196644_n-jpg.webp'),
(39, 'Halloween', 'Bike Stop', '10/21/2023', 'https://bosphilly.com/wp-content/uploads/2024/01/391605448_807382991391438_2175104100502599521_n-jpg.webp'),
(40, 'Wild West', 'Bike Stop', '11/18/2023', 'https://bosphilly.com/wp-content/uploads/2024/01/395275085_812829814180089_5178332922315945650_n-jpg.webp'),
(41, 'Nut Cracker', 'Bike Stop', '12/16/2023', 'https://bosphilly.com/wp-content/uploads/2024/01/409137816_842483457881391_3537452560555767038_n-jpg.webp'),
(42, 'POP NYE', 'Miss Saigon', '12/31/2023', 'https://bosphilly.com/wp-content/uploads/2024/01/409175880_842484647881272_7110532919049074024_n-jpg.webp'),
(43, 'Wig Party', 'Bike Stop', '2/17/2024', 'https://bosphilly.com/wp-content/uploads/2024/01/417037538_1475885142972797_1228034143619408646_n-jpg.webp'),
(44, 'Lucky', 'Bike Stop', '3/16/2024', 'https://bosphilly.com/wp-content/uploads/2024/02/circuit2-1024x574.webp'),
(45, 'Heaven and Hell', 'Vesper', '4/13/2024', 'https://i.imgur.com/7hPYA8M.jpeg'),
(46, 'Tea Dance', 'Winston on the Water', '5/5/2024', 'https://i.imgur.com/kUIVZda.png'),
(47, 'Opulence', 'Filmore', '6/1/2024', 'https://bosphilly.com/wp-content/uploads/2024/01/420198760_1293134267993558_8971226105116551971_n-scaled.webp'),
(48, 'Tea Dance', 'Stratus', '6/23/2024', 'https://i.imgur.com/mPxf5RV.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `djs`
--
ALTER TABLE `djs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `djs_events`
--
ALTER TABLE `djs_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_dj_id` (`dj_id`),
  ADD KEY `FK_event_id` (`event_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `djs`
--
ALTER TABLE `djs`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7886;

--
-- AUTO_INCREMENT for table `djs_events`
--
ALTER TABLE `djs_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `djs_events`
--
ALTER TABLE `djs_events`
  ADD CONSTRAINT `FK_dj_id` FOREIGN KEY (`dj_id`) REFERENCES `djs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
