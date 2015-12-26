//THIS IS FOR WICM 17//


//Okay, start c://

//Format: Quotes for game. Show names of characters and general quotes. When you press play, the audio will play a random line from 50% Off.

//Based on 50% Off.
//Characters:
    //Nagisa
    //Haru
    //Makoto
    //Rei
    //Kou
    //Rin
//Quote Topics:
    //Haru
    //Rei
    //Swimming/Pools/Water
    //Ocean Goblin
    //Prison
    //Inner Haru Dialogue
Global snips as integer

//A type to save us some work
Type _buttons
    Nagisa as integer
    Makoto as integer
    Rei as integer
    Haru as integer
    Kou as integer
    Rin as integer
    _next as integer
EndType

Global background as integer
Global button as _buttons //This assigns button to the type and globalises it
Global image as _buttons //This assigns text to the button type
Global Song as integer //Stores the current song playing
Global mode as integer //This stores the mode of the program

SetPrintSize( 2.5 )

dim snips[18] as integer
For i = 0 to 18
    snips[i] = LoadMusic( "music/" + str( i+1 ) + ".wav" )
Next i

background = CreateSprite( LoadImage( "BG3.jpg" ) ) : SetSpriteSize( background, 100, 95 ) : SetSpritePosition( background, 0, 5 )
image.Nagisa = LoadImage("Nagisa.png")
image.Makoto = LoadImage("Makoto.png")
image.Rei = LoadImage("Rei.png")
image.Haru = LoadImage("Haru.png")
image.Kou = LoadImage("Kou.png")
image.Rin = LoadImage("Rin.png")
image._next = LoadImage("Play!.png")

button.Nagisa = 1 : button.Makoto = 2 : button.Rei = 3 : button.Haru = 4 : button.Kou = 5 : button.Rin = 6 : button._next = 7
AddVirtualButton( button.Nagisa, 12, 70, 10 ) : SetVirtualButtonImageUp( button.Nagisa, image.Nagisa ) : SetVirtualButtonImageDown( button.Nagisa, image.Nagisa ) : SetVirtualButtonSize( button.Nagisa, 15 ) : SetVirtualButtonText( button.Nagisa, "Nagisa" )
AddVirtualButton( button.Makoto, 26, 70, 20 ) : SetVirtualButtonImageUp( button.Makoto, image.Makoto ) : SetVirtualButtonImageDown( button.Makoto, image.Makoto ) : SetVirtualButtonSize( button.Makoto, 25 ) : SetVirtualButtonText( button.Makoto, "Makoto" )
AddVirtualButton( button.Rei, 47, 70, 35 ) : SetVirtualButtonImageUp( button.Rei, image.Rei ) : SetVirtualButtonImageDown( button.Rei, image.Rei ) : SetVirtualButtonSize( button.Rei, 25 ) : SetVirtualButtonText( button.Rei, "Rei" )
AddVirtualButton( button.Haru, 57, 70, 20 ) : SetVirtualButtonImageUp( button.Haru, image.Haru ) : SetVirtualButtonImageDown( button.Haru, image.Haru ) : SetVirtualButtonSize( button.Haru, 27 ) : SetVirtualButtonText( button.Haru, "Haru" )
AddVirtualButton( button.Kou, 75, 70, 20 ) : SetVirtualButtonImageUp( button.Kou, image.Kou ) : SetVirtualButtonImageDown( button.Kou, image.Kou ) : SetVirtualButtonSize( button.Kou, 10 ) : SetVirtualButtonText( button.Kou, "Kou" )
AddVirtualButton( button.Rin, 88, 70, 20 ) : SetVirtualButtonImageUp( button.Rin, image.Rin ) : SetVirtualButtonImageDown( button.Rin, image.Rin ) : SetVirtualButtonSize( button.Rin, 15 ) : SetVirtualButtonText( button.Rin, "Rin" )
AddVirtualButton( button._next, 50, 30, 20 ) : SetVirtualButtonImageUp( button._next, image._next ) : SetVirtualButtonImageDown( button._next, image._next ) : SetVirtualButtonSize( button._next, 18 ) : SetVirtualButtonText( button._next, "Begin!" )

StatusText = CreateText( "Press play to start!" ) : SetTextPosition( StatusText, 50, 10 ) : SetTextAlignment( StatusText, 1 ) : SetTextColor( StatusText, 255, 0, 0, 255 )

do

    //Here we use the virtual button commands to set various snips play states, depending on the button pressed
    If GetVirtualButtonPressed( button._next ) = 1 and mode = 0
        Old = Song
        Repeat
            Song = random( 0, 18 )
        Until Song <> old
        PlayMusic( snips[ song ], 0, Song, Song )
        mode = 1
        SetVirtualButtonActive( button._next, 0 )
        SetVirtualButtonText( button._next, "Playing")
    ElseIf mode = 1
        If GetMusicPlaying() = 0
            SetVirtualButtonText( button._next, "You pass!")
            SetVirtualButtonActive( button._next, 1 )
            SetTextString( StatusText, "Was that what you guessed?" )
            mode = 2
        EndIf
    ElseIf GetVirtualButtonPressed( button._next ) = 1 and mode = 2
        Old = Song
        Repeat
            Song = random( 0, 18 )
        Until Song <> old
        PlayMusic( snips[ song ], 0, Song, Song )
        mode = 1
        SetVirtualButtonActive( button._next, 0 )
        SetVirtualButtonText( button._next, "Playing")
        SetTextString( StatusText, " " )
    EndIf


//1 to 3 = Nagisa
//4 to 6 = Makoto
//7 to 9 = Rei
//10 to 12 = Haru
//13 to 15 = Kou
//16 to 18 = Rin

    If GetVirtualButtonPressed( button.Nagisa ) = 1
        If Song <= 3 and Song => 1
            SetTextString( StatusText, "Tfw thug seme" )
            mode = 0
        Else
            SetTextString( StatusText, " " )
            mode = 0
        EndIf
    ElseIf GetVirtualButtonPressed( button.Makoto ) = 1
        If Song <= 6 and Song => 4
            SetTextString( StatusText, "Team mom team mom tEAM MOM." )
            mode = 0
        Else
            SetTextString( StatusText, " " )
            mode = 0
        EndIf
    ElseIf GetVirtualButtonPressed( button.Rei ) = 1
        If Song <= 12 and Song => 10
            SetTextString( StatusText, "WHAT A NERD. Rei is beautiful." )
            mode = 0
        Else
            SetTextString( StatusText, " " )
            mode = 0
        EndIf
    ElseIf GetVirtualButtonPressed( button.Haru ) = 1
        If Song <= 9 and Song => 7
            SetTextString( StatusText, "Yes Haru, just yes." )
            mode = 0
        Else
            SetTextString( StatusText, " " )
            mode = 0
        EndIf
    ElseIf GetVirtualButtonPressed( button.Kou ) = 1
        If Song <= 15 and Song => 13
            SetTextString( StatusText, "Kou is every fangirl omg" )
            mode = 0
        Else
            SetTextString( StatusText, " " )
            mode = 0
        EndIf
//Added here//
    ElseIf GetVirtualButtonPressed( button.Rin ) = 1
        If Song <= 18 and Song => 16
            SetTextString( StatusText, "Tbh Rin is sharkweek personified." )
            mode = 0
        Else
            SetTextString( StatusText, " " )
            mode = 0
        EndIf
    EndIf

    //Finally we report some information, if the snips is playing and what the volume is, this is mostly for troubleshooting.
    Print( "Audio from the youtube abridged series 50% Off by Octopimp." )
    Print( "Anime the series is based on: Free! Iwatobi Swim Club." )

    Sync()

loop
