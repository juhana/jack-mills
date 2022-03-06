Version 1 of Essential Supplements by Juhana Leinonen begins here.

"Adds common actions and synonyms missing in the standard rules. New actions: reading, knocking, dancing, greeting. Shows viable directions if the player walks into wrong direction."

Use authorial modesty.

Chapter 1 - Synonyms

Understand "climb in [something]" as entering.
Understand "climb on [something]" as climbing.
Understand "get out/off of [something]" as getting off.Understand "get up from [something]" as getting off.
Understand "hand [something preferably held] to [something]" as giving it to.
Understand "listen [something]" as listening to.
Understand "sit down" as entering.
Understand "sit down on [something]" as entering.
Understand "say yes/y" as saying yes.
Understand "agree" and "yeah" and "yep" and "all right" and "of course" as saying yes.
Understand "look around" as looking.
Understand "load" as restoring the game.

Understand "woman/girl" as a woman.
Understand "man/boy" as a man.


Chapter 2 - Actions

Section 1 - Reading

[this is copied almost word-for-word from the Inform manual chapter 16.3]
A thing has some text called printing. The printing of a thing is usually "blank".

Understand the command "read" as something new. Understand "read [something]" as reading. Reading is an action applying to one thing.

Check reading:
	if the printing of the noun is "blank", say "There's nothing written on [the noun]." instead.

Carry out reading:
	say "[printing of the noun][line break]". 



Section 2 - Knocking

Knocking is an action applying to one touchable thing.
Understand "knock on/at [something]" and "knock [something]" as knocking.

Carry out knocking: say "You shouldn't waste your time knocking on everything you see." 


Section 3 - Dancing

Dancing with is an action applying to one thing.
Understand "dance", "dance to music" and "dance with [something]" as dancing with.

Rule for supplying a missing noun while dancing with:
	change the noun to the player.
	
Check dancing with:
	If the noun is the player and someone who is not the player is in the location, say "You'd make a fool of yourself." instead;
	if the noun is the player, say "You take a few steps to the tune you hear only in your head." instead;
	if the noun is not a person, say "You can't dance with inanimate objects!" instead;
	say "[The noun] doesn't seem to be in the mood for dancing."


Section 4 - Greeting

Greeting is an action applying to one thing.

Understand "hello" and "hi" and "greetings" and "hello [someone]" and "greet [someone]" and "say hello to [someone]" as greeting.

Rule for supplying a missing noun while greeting:
	if someone who is not the player is visible,
	change the noun to random visible person who is not the player;
	otherwise change the noun to the player.

Check greeting:
	if the noun is the player, say "Talking to yourself again, huh?" instead.

Report greeting:
	say "[The noun] greets you back."


Chapter 3 - Other changes

Section 1 - Viable directions

[from the chapter 7.13. example 87 of Inform 7 tutorial]
Definition: a direction is viable if the room it from the location is a room. 
Instead of going nowhere: 
    let count of exits be the number of viable directions; 
    if the count of exits is 0, say "There doesn't seem to be any obvious exits here." instead; 
    say "From here you can only go [list of viable directions].";  



Essential Supplements by Juhana Leinonen ends here.


---- DOCUMENTATION ----

The extension adds the following synonyms:

	Entering:
		climb in, sit down, sit down on

	Climbing:
		climb on

	Getting off:
		get out of, get off of, get up from

	Giving it to:
		hand to

	Listening to:
		listen

	Saying yes:
		say yes, say y, agree, yeah, yep, all right, of course

	Looking:
		look around

	Restoring the game:
		load

	woman (kind):
		woman, girl

	man (kind):
		man, boy


The new actions are as follows:

READING

Commands: 
	"read [something]"

Usage:

Every thing has a text called "printing". To add readable text to the thing, for example a book, we can use 'The printing of the book is...'

If the printing property is not given, then the READ command gives "There's nothing written on [the noun]."

Note that the reading action is taken almost as-is from the Inform 7 manual chapter 16.3. 

Example:
	The sticky note is a thing. The description of the sticky note is "It's a yellow note with some writing on it." The printing of the sticky note is "'Buy milk and bread.'".


KNOCKING

Commands:
	"knock [something]"
	"knock on/at [something"

Usage:
	
The knocking command is an "empty" command that should be implemented to every knockable item separately. The default answer is "You shouldn't waste your time knocking on everything you see." 

Example:
	The closet is a closed container. Instead of knocking the closet, say "Nobody answers, which makes sense, since as far as you know nobody lives in the closet."


DANCING WITH

Commands:
	"dance"
	"dance to music"
	"dance with [something]"

Usage:

The target of the dancing command defaults to the player character if a dancing partner is not given (i.e. player dances by herself). The default answer is "You'd make a fool of yourself." when dancing if there are other people present, "You take a few steps to the tune you hear only in your head." if the player is alone. Dancing with other people gives "[The noun] doesn't seem to be in the mood for dancing." and with non-people gives "You can't dance with inanimate objects!"

Example:
	The club is a room. The rapper is in the club.
	Instead of dancing with while the location is the club, say "Hip-hop doesn't inspire you to dance." Instead of dancing with the rapper, say "He's here just to sing."


In addition, the extension shows all allowed directions if the player moves towards an undefined direction ("From here you can only go east or west."). This code has been taken from the Inform 7 manual, chapter 7.13, example 87.