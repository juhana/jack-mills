Version 1 of Auctioneer by Juhana Leinonen begins here.

"Ambient sounds for an auctioneer calling bids. Random and pre-described items, and bidding on them."

[Note: This extension has been released to the public domain by the author.]

Book 1

A room can be an auction arena. A room is usually not an auction arena.



Table of default random auction items
Adjective	Noun	Era	Starting price	Step
"an Ethiopian"	"oil painting"	"the 18th century"	100	10
"a Scottish"	"war axe"	"about 150 bc"	200	10
"a slightly damaged"	"writing desk"	"an unknown era"	150	10
"a well kept"	"porceline doll"	"1950s"	300	20
"an exquisite"	"quill pen"	"the 12th century"	500	50
"a Chinese"	"miniature cannon"	"the post-war era"	800	100
"an African"	"silver fork"	"the 13th century"	50	5
"a Finnish"	"leather belt"	"the last century"	100	10
"an Indian"	"dagger"	"the beginning of 1800's"	200	20


Table of pre-defined auction items
Number	Noun	Starting price	Step	Biddable
number	text	number	number	number
1	"nothing"	100	10	0	[will never be shown]
[I would've gladly called the second column simply "item", but the word seems to conflict with the Locksmith extension.]

The current item description is a text that varies. The current item description is "null".

The random items is a table-name that varies. The random items is the table of default random auction items.

The auctioning is a recurring scene.
The auctioning begins when the player is in an auction arena.
The auctioning begins when the auctioning ends.
The auctioning ends when the auctioneer countdown is 5.

The current item adjective is text that varies.
The current item noun is text that varies.
The current item era is text that varies.
The current price is number that varies.
The current step is number that varies.
The auctioneer countdown is number that varies. The auctioneer countdown is 0.
The bidding activity is a number that varies. The bidding activity is 2.
The player's bid is a number that varies. The player's bid is 0.
The current item biddability is a number that varies. The current item biddability is 0.

The currency unit is a text that varies. The currency unit is "dollars".

The temp-var is text that varies.

When the auctioning begins:
	change the auctioneer countdown to 0;
	change the current item biddability to 0;
	change the player's bid to 0;
	if the number of filled rows in the table of pre-defined auction items is not 0
	begin;
		choose the row with number column of 1 in the table of pre-defined auction items;
		change the current item noun to noun entry;
		change the current item adjective to "";
		change the current item era to "";
		if the auctioning has ended,
			say "'Next item, [current item noun].'";
		change the current price to starting price entry;
		change the current step to step entry;
		change the current item biddability to biddable entry;
		blank out the whole row;
	otherwise;
		choose a random row in the random items;
		change the current item adjective to adjective entry;
		choose a random row in the random items;
		change the current item noun to noun entry;
		choose a random row in the random items;
		change the current item era to era entry;
		choose a random row in the random items;
		change the current price to starting price entry;
		change the current step to step entry;
		if the auctioning has ended,
		say "'Next item, [a current item adjective] [current item noun] from [current item era].'";
	end if;




Every turn when the auctioning is happening:
	if the player's bid is not 0 and the player's bid is greater than the current price
	begin;
		change the current price to the player's bid; 
		change the auctioneer countdown to 0;
		let the auctioneer-saying be "'[player's bid] offered.'";
	otherwise;
		if the auctioneer countdown is 0 
		begin;	[before the 1st.. 2nd.. 3rd.. sold phase]
			if the time since the auctioning began is 0 minutes
			begin;
				let the auctioneer-saying be "'The bidding starts at [current price + current step] [currency unit].'";
			otherwise;
				    if a random chance of the bidding activity in bidding activity + 1 succeeds or the time since the auctioning began is 1 minutes
				    begin;
					    change the current price to the current price plus the current step;
					    if a random chance of 1 in 2 succeeds
						begin;
						    let the auctioneer-saying be "'[current price] [currency unit] offered.'";
					    otherwise;
					    	let the auctioneer-saying be "'I see [current price] [currency unit].'";
					end if;
				    otherwise;
					change the auctioneer countdown to 1;
				    end if;
			end if;
		end if;
		if the auctioneer countdown is not 0
		begin;
			if the auctioneer countdown is 1,
				let the auctioneer-saying be "'Going first...'";
			if the auctioneer countdown is 2,
				let the auctioneer-saying be "'...going second...'";
			if the auctioneer countdown is 3,
				let the auctioneer-saying be "'...sold for [current price] [currency unit].'";
			if the auctioneer countdown is 3 and the player's bid is the current price, try winning the bid;
			increase the auctioneer countdown by 1;
		end if;
	end if;
	if the location is an auction arena
	    begin;
	    [if the player's bid is not 0 and the player's bid is the current price minus the current step, say "Someone tops your offer.[paragraph break]";]
	    if the auctioneer-saying is not "", say "[auctioneer-saying][line break]";
	    [say "Current bid: [current price], Your bid: [player's bid], time since scene began: [time since the auctioning began], countdown: [auctioneer countdown]";]
	end if;


Book 2 - Bidding

Bidding is an action applying to nothing.
Understand "bid" as bidding.
Understand "offer" as bidding.
Understand "buy" as bidding.


Check bidding:
	if the player is not in an auction arena,
	    say "Excuse me?" instead;
	if the current item biddability is 0, 
	    say "The current item isn't worth bidding." instead;
	if the auctioneer countdown is 5,
	    say "You're a bit late - the bidding is over." instead;
	if the time since the auctioning began is less than 1 minutes,
	    say "You have to wait for the bidding to start." instead;
	if the player's bid is the current price, 
	    say "You already have the highest bid." instead;
	
Carry out bidding:
	change the player's bid to the current price plus the current step;

Report bidding:
	say "You offer [player's bid] for the item.";


Winning the bid is an action out of world applying to nothing.

[what happens when the bid is won is left upon the main game]

Auctioneer ends here. 

---- DOCUMENTATION ----

The Auctioneer extension provides an ambient sound of an auctioneer taking bids for pre-described and random items and an optional bidding action.

There can be many rooms in which the player hears the bids and can participate in the auction (for example if the player can hear the auctions from a hallway). The rooms must be given the "auction arena" property. There can only be one auction in the game, so all rooms declared auction arenas will run the same auction.


Example: * Sotheby's - Bare-bones example of the voice of auctioneer calling bids, without the opportunity for the player to participate.

Note that the auction keeps going even when the player is not in the auction hall.

	"Sotheby's"
	
	Include Auctioneer by Juhana Leinonen.

	New Bond Street is a room. "You are standing in front of the legendary Sotheby's. The entrance is to the east."


	Sotheby's is an auction arena room. Sotheby's is east of New Bond Street. "Sotheby's auction items are always of finest quality."

	Test me with "e/z/z/z/w/z/z/e/z/z".
