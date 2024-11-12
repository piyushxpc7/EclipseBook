let books: [Book] = [
    Book(title: "The Great Gatsby", imageName: "b1", description: "A novel by F. Scott Fitzgerald that explores the themes of decadence, idealism, resistance to change, social upheaval, and excess, set in the Roaring Twenties. It follows the story of Jay Gatsby, a mysterious millionaire, and his obsession with the beautiful Daisy Buchanan, as narrated by Nick Carraway, who becomes entangled in Gatsby's world of wealth and disillusionment.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "To Kill a Mockingbird", imageName: "b2", description: "Published in 1960, Harper Lee's Pulitzer Prize-winning novel is a poignant exploration of racial injustice and moral growth in the Deep South during the 1930s. Through the eyes of young Scout Finch, the story delves into the complexities of human behavior and empathy, as her father, Atticus Finch, defends a black man accused of raping a white woman, challenging the prejudices of their community.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "1984", imageName: "b3", description: "George Orwell's dystopian novel is a chilling portrayal of a totalitarian regime that employs surveillance, propaganda, and thought control to maintain power. Set in a world where the Party, led by Big Brother, suppresses individuality and freedom, the story follows Winston Smith, a low-ranking member of the Party who begins to question the oppressive system and seeks truth and rebellion in a society that demands conformity.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "Stardust Dreams", imageName: "b4", description: "This enchanting romantic novel by Jane Austen follows the life of a young woman navigating the complexities of love and societal expectations in early 19th-century England. Through its rich character development and witty dialogue, it captures the essence of longing, passion, and the pursuit of happiness, illustrating the struggles faced by women in a patriarchal society.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "Pride and Prejudice", imageName: "b5", description: "A classic novel by Jane Austen, published in 1813, that examines the themes of love, reputation, and class in early 19th-century England. The story centers on Elizabeth Bennet, a spirited young woman, and her tumultuous relationship with the proud Mr. Darcy. As their perceptions of each other evolve, the novel highlights the importance of understanding and individual growth, all set against a backdrop of societal expectations.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "Harry Potter and the Sorcerer's Stone", imageName: "b6", description: "The first installment in J.K. Rowling's beloved series introduces readers to Harry Potter, an orphan who discovers he is a wizard on his 11th birthday. As he enters Hogwarts School of Witchcraft and Wizardry, Harry makes friends, uncovers the truth about his parents' mysterious deaths, and confronts the dark wizard Voldemort. The novel combines themes of friendship, bravery, and the battle between good and evil, captivating readers of all ages.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "War and Peace", imageName: "b7", description: "Leo Tolstoy's epic novel is a sweeping narrative that intertwines the lives of several characters against the backdrop of the Napoleonic Wars. The story delves into themes of fate, free will, and the impact of historical events on individual lives, exploring the complexities of love, family, and personal growth in a society on the brink of change. It is considered one of the greatest works of world literature, renowned for its deep psychological insight and rich detail.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "A Tale of Two Cities", imageName: "b8", description: "Charles Dickens's historical novel is set during the tumultuous times of the French Revolution. It tells the story of Dr. Alexandre Manette, who is released from years of wrongful imprisonment in the Bastille, and his daughter Lucie, who reunites with him in Paris. Through their experiences and the lives of characters like the dashing Charles Darnay and the dissolute Sydney Carton, the novel examines themes of resurrection, sacrifice, and the struggle for justice in a world filled with chaos.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "The Old Man and the Sea", imageName: "b9", description: "Ernest Hemingway's poignant novella follows Santiago, an aging fisherman who struggles with a relentless battle against a giant marlin in the Gulf Stream. This tale of perseverance and resilience against nature captures the essence of the human spirit and explores themes of dignity, pride, and the quest for personal triumph in the face of adversity. Santiago's journey becomes a profound meditation on life, death, and the relationship between man and the natural world.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "One Hundred Years of Solitude", imageName: "b10", description: "Gabriel Garcia Marquez's landmark novel is a multi-generational saga of the Buendía family in the fictional town of Macondo. Blending magical realism with historical and social commentary, the story explores themes of solitude, love, and the cyclical nature of time. As the characters navigate their intertwined fates, the novel offers a rich tapestry of human experience, examining the complexities of life, memory, and the passage of time in Latin American culture.", amazonRating: "4.5", goodreadsRating: "3.91")
]
let famousPeople = [
    FamousPerson(
        famousPersonImage: "em",
        description: "Elon Musk is an entrepreneur and the CEO of companies like Tesla and SpaceX.",
        name: "Elon Musk",
        title: "Entrepreneur & CEO"
    ),
    FamousPerson(
        famousPersonImage: "bg",
        description: "Bill Gates is the co-founder of Microsoft and a philanthropist. He is recognized for his significant contributions to technology and global health through his charity, the Bill & Melinda Gates Foundation.",
        name: "Bill Gates",
        title: "Philanthropist & Co-founder of Microsoft"
    ),
    FamousPerson(
        famousPersonImage: "ow",
        description: "Oprah Winfrey is a media mogul and philanthropist known for her talk show 'The Oprah Winfrey Show' and her impact on the entertainment industry. She is an influential figure in social change and empowerment.",
        name: "Oprah Winfrey",
        title: "Media Mogul & Philanthropist"
    ),
    FamousPerson(
        famousPersonImage: "ew",
        description: "Emma Watson is an actress, best known for playing Hermione Granger in the Harry Potter series. She is also a UN Women Goodwill Ambassador and a passionate advocate for gender equality.",
        name: "Emma Watson",
        title: "Actress & UN Ambassador"
    ),
    FamousPerson(
        famousPersonImage: "bo",
        description: "Barack Obama served as the 44th President of the United States, and is known for his leadership in healthcare reform, global diplomacy, and his legacy of hope and change.",
        name: "Barack Obama",
        title: "44th President of the United States"
    )
]

//    // Additional books
//    Book(title: "Moby Dick", imageName: "moby_dick", description: "A novel by Herman Melville about a captain's obsession with a whale."),
//    Book(title: "The Catcher in the Rye", imageName: "catcher_rye", description: "A novel by J.D. Salinger about teenage rebellion."),
//    Book(title: "Brave New World", imageName: "brave_new_world", description: "A dystopian novel by Aldous Huxley."),
//    Book(title: "The Road", imageName: "the_road", description: "A novel by Cormac McCarthy about a father and son's journey."),
//    Book(title: "The Brothers Karamazov", imageName: "brothers_karamazov", description: "A philosophical novel by Fyodor Dostoevsky."),
//    Book(title: "Crime and Punishment", imageName: "crime_punishment", description: "A psychological drama by Fyodor Dostoevsky."),
//    Book(title: "Anna Karenina", imageName: "anna_karenina", description: "A love story and social critique by Leo Tolstoy."),
//    Book(title: "Frankenstein", imageName: "frankenstein", description: "A novel by Mary Shelley about the dangers of unchecked ambition."),
//    Book(title: "The Hobbit", imageName: "hobbit", description: "A fantasy novel by J.R.R. Tolkien."),
//    Book(title: "Dracula", imageName: "dracula", description: "A Gothic novel by Bram Stoker.")

let authors: [Author] = [
    Author(name: "Jane Austen", bio: "An English novelist known for her novels about the British landed gentry at the end of the 18th century.", image: "aa"),
    
    Author(name: "George Orwell", bio: "An English novelist famous for '1984' and 'Animal Farm'.", image: "bgo"),
    Author(name: "Virginia Woolf", bio: "An English writer, considered one of the foremost modernists of the twentieth century.", image: "bvw"),
    Author(name: "F. Scott Fitzgerald", bio: "An American novelist and short story writer, widely regarded as one of the greatest American writers of the 20th century.", image: "bfs"),
    Author(name: "Leo Tolstoy", bio: "A Russian writer best known for War and Peace and Anna Karenina.", image: "blt")
]
let genres = [
    "Crime",
    "Mystery",
    "Romance",
    "Science Fiction",
    "Fantasy",
    "Horror",
    "Thriller",
    "Adventure",
    "Historical",
    "Non-Fiction"
]

let booksSwipe: [Book] = [
    Book(title: "The Great Gatsby", imageName: "b1", description: "A novel by F. Scott Fitzgerald that explores the themes of decadence, idealism, resistance to change, social upheaval, and excess, set in the Roaring Twenties. It follows the story of Jay Gatsby, a mysterious millionaire, and his obsession with the beautiful Daisy Buchanan, as narrated by Nick Carraway, who becomes entangled in Gatsby's world of wealth and disillusionment.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "To Kill a Mockingbird", imageName: "b2", description: "Published in 1960, Harper Lee's Pulitzer Prize-winning novel is a poignant exploration of racial injustice and moral growth in the Deep South during the 1930s. Through the eyes of young Scout Finch, the story delves into the complexities of human behavior and empathy, as her father, Atticus Finch, defends a black man accused of raping a white woman, challenging the prejudices of their community.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "1984", imageName: "b3", description: "George Orwell's dystopian novel is a chilling portrayal of a totalitarian regime that employs surveillance, propaganda, and thought control to maintain power. Set in a world where the Party, led by Big Brother, suppresses individuality and freedom, the story follows Winston Smith, a low-ranking member of the Party who begins to question the oppressive system and seeks truth and rebellion in a society that demands conformity.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "Stardust Dreams", imageName: "b4", description: "This enchanting romantic novel by Jane Austen follows the life of a young woman navigating the complexities of love and societal expectations in early 19th-century England. Through its rich character development and witty dialogue, it captures the essence of longing, passion, and the pursuit of happiness, illustrating the struggles faced by women in a patriarchal society.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "Pride and Prejudice", imageName: "b5", description: "A classic novel by Jane Austen, published in 1813, that examines the themes of love, reputation, and class in early 19th-century England. The story centers on Elizabeth Bennet, a spirited young woman, and her tumultuous relationship with the proud Mr. Darcy. As their perceptions of each other evolve, the novel highlights the importance of understanding and individual growth, all set against a backdrop of societal expectations.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "Harry Potter and the Sorcerer's Stone", imageName: "b6", description: "The first installment in J.K. Rowling's beloved series introduces readers to Harry Potter, an orphan who discovers he is a wizard on his 11th birthday. As he enters Hogwarts School of Witchcraft and Wizardry, Harry makes friends, uncovers the truth about his parents' mysterious deaths, and confronts the dark wizard Voldemort. The novel combines themes of friendship, bravery, and the battle between good and evil, captivating readers of all ages.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "War and Peace", imageName: "b7", description: "Leo Tolstoy's epic novel is a sweeping narrative that intertwines the lives of several characters against the backdrop of the Napoleonic Wars. The story delves into themes of fate, free will, and the impact of historical events on individual lives, exploring the complexities of love, family, and personal growth in a society on the brink of change. It is considered one of the greatest works of world literature, renowned for its deep psychological insight and rich detail.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "A Tale of Two Cities", imageName: "b8", description: "Charles Dickens's historical novel is set during the tumultuous times of the French Revolution. It tells the story of Dr. Alexandre Manette, who is released from years of wrongful imprisonment in the Bastille, and his daughter Lucie, who reunites with him in Paris. Through their experiences and the lives of characters like the dashing Charles Darnay and the dissolute Sydney Carton, the novel examines themes of resurrection, sacrifice, and the struggle for justice in a world filled with chaos.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "The Old Man and the Sea", imageName: "b9", description: "Ernest Hemingway's poignant novella follows Santiago, an aging fisherman who struggles with a relentless battle against a giant marlin in the Gulf Stream. This tale of perseverance and resilience against nature captures the essence of the human spirit and explores themes of dignity, pride, and the quest for personal triumph in the face of adversity. Santiago's journey becomes a profound meditation on life, death, and the relationship between man and the natural world.", amazonRating: "4.5", goodreadsRating: "3.91"),
    
    Book(title: "One Hundred Years of Solitude", imageName: "b10", description: "Gabriel Garcia Marquez's landmark novel is a multi-generational saga of the Buendía family in the fictional town of Macondo. Blending magical realism with historical and social commentary, the story explores themes of solitude, love, and the cyclical nature of time. As the characters navigate their intertwined fates, the novel offers a rich tapestry of human experience, examining the complexities of life, memory, and the passage of time in Latin American culture.", amazonRating: "4.5", goodreadsRating: "3.91")

]
