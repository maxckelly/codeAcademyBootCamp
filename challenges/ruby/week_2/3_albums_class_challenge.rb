# Create three classes: Artist, Album and Song
# Artist class
    # 1. Artist class has two attributes: name and albums, the albums attribute will be an array of album objects
    # 2. The Artist class will also have an instance method that will allow to add album objects to the albums attribute
    # 3. Create two instances of the Artist class
        # Hint: you may need to initialize the albums attribute as an empty array
# Album class
    # 4. Similarly, the Album class will have a title, release_date and songs array and an instance method to add song objects to the songs attrtibute
    # 5. Create at least three instances of the Album class
    # 6. Use the instance method defined in the Artist class to add these album objects in the Artist instances created above.
# Song class
    # 7. The Song class will have title, duration and genre
    # 8. Create at least three instances of the Song class
    # 9. Use the instance method defined in the Album class to add these song objects in the Album instances created above.
# Beast
    # 10. create a method in the Artist class that will count how many albums that artist instance has
    # 11. create a method in the Album class that will count how many songs that album instance has
# Beast ++
    # 12. Create a Billboard class and define a method in there which will count how many instances of the Artist class have been created

class Billboard
    
    @@artist_counter = 0

    def artist_counter
        @@artist_counter
    end
end

class Artist < Billboard
    
    @@album_counter = 0

    def initialize(name)
        @artist_name = name
        @albums = []
        @@artist_counter += 1
    end

    def name=(name_input)
        @artist_name 
    end

    def albums=(album)
        @albums << album
    end

    def album_counter
        @@album_counter
    end
end

class Album < Artist

    @@song_counter = 0
    # Initialize sets the class with a number of starting data.
    def initialize(title, release_date)
        @title = title
        @release_date = release_date
        @songs = []
        @@album_counter += 1
    end

    def songs=(song)
        @songs << song
        self
    end

    def album_description
        return {
            title: @title,
            release_date: @release_date,
            songs: @songs
        }
    end

    def song_counter
        @@song_counter
    end
end
    
class Song < Album

    def initialize(title, duration, genre)
        @title = title
        @duration = duration
        @genre = genre
        @@song_counter += 1
    end
end

artists_one = Artist.new("Max")
album_one = Album.new("Album One", 1997)
album_two = Album.new("Album Two", 2000)
song_one = Song.new("My first song", 3.67, "Pop")
song_two = Song.new("My second song", 5.00, "Rock")
song_three = Song.new("My third song", 3.00, "Vocal")
album_one.songs = (song_one)
album_one.songs = (song_two)
album_one.songs = (song_three)    
artists_one.albums = (album_one) 
    # This is grabbing our artist varible called artists_one it is then calling .albums which is a method in the artist class. The method is then defining a push method into the albums array this allows us to push album one into the album array in artist
p artists_one.artist_counter