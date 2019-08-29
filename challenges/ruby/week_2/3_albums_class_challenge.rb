# Create three classes: Artist, Album and Song

# # Artist class
# 1. Artist class has two attributes: name and albums, the albums attribute will be an array of album objects
# 2. The Artist class will also have an instance method that will allow to add album objects to the albums attribute
# 3. Create two instances of the Artist class
# Hint: you may need to initialize the albums attribute as an empty array

    class Artist
        def initialize(name)
            @name = name
            @albums = []
        end

        def name=(name_input)
            @name 
        end

        def albums(album)
            @albums << album
        end
    end

    # artists_one = Artist.new("Max")
    # artists_two = Artist.new("John")
    # artists_one.albums = "First album"
    # artists_two.albums = "Second album"
    # p artists_one
    # p artists_two

# # Album class
# 4. Similarly, the Album class will have a title, release_date and songs array and an instance method to add song objects to the songs attrtibute
# 5. Create at least three instances of the Album class
# 6. Use the instance method defined in the Artist class to add these album objects in the Artist instances created above.

    class Album

        # Initialize sets the class with a number of starting data.
        def initialize(title, release_date)
            @title = title
            @release_date = release_date
            @songs = []
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
    end

    artists_one = Artist.new("Max")
    p artists_one.name = ("John")
    album_one = Album.new("Album One", 1997)
    album_one.songs = "First song"
    album_one.songs = "Second song"
    artists_one.albums = (album_one) 
        # This is grabbing our artist varible called artists_one it is then calling .albums which is a method in the artist class. The method is then defining a push method into the albums array this allows us to push album one into the album array in artist
    
# Song class
# 7. The Song class will have title, duration and genre
# 8. Create at least three instances of the Song class
# 9. Use the instance method defined in the Album class to add these song objects in the Album instances created above.

    class Song
        def initialize
            
        end
    end

# Beast
# 10. create a method in the Artist class that will count how many albums that artist instance has
# 11. create a method in the Album class that will count how many songs that album instance has

# Beast ++
# 12. Create a Billboard class and define a method in there which will count how many instances of the Artist class have been created