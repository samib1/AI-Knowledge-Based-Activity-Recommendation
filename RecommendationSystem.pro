/*-----------------------------------------------------------
Author:      Sami Byaruhanga 
Purpose:     A prototype knowledge based system
Note:	     System created is friday night Winnipeg recommendation list based off a few factors
-----------------------------------------------------------*/


/*-----------------------------------------------------------
NOTE ON RUNNING: CONVERT TO .pl since I couldnt not get amzi .pro to use random 
OR USE THIS ONLINE IDE (https://swish.swi-prolog.org/) BY COPY PASTING THE CODE BELOW THERE
-----------------------------------------------------------*/


/*-------------------- facts, rules used -------------------
facts: activities, factors, cost, category, location, vibes, interests
rules: recommend_activity 
-----------------------------------------------------------*/
%--- Factor for choosing activity-
factor(cost).
factor(category).
factor(location).
factor(mood).
factor(interests).
%---------------------------------


%------- Activities --------------
%could definetly add more. Used less so as to test by hand easily.
activity(cards).
activity(read_book).
activity(karaoke).

activity(drinks).
activity(the_leaf). %Assiniboia Park 
activity(the_forks).
activity(restaurant).
activity(movie_night).

activity(clubing).
activity(sking).
activity(bomber_game).

activity(zoo).
activity(human_rights_museum).
activity(manitoba_museum).
activity(winnipeg_art_gallery).
activity(aviation_museum).
activity(thermea).
activity(jets_game).
activity(goldeyes_game).
activity(legislative_building).
activity(royal_ballet).
%---------------------------------


%------- Cost for activity -------
%cost free, cheap, expensive
cost(cards, free).
cost(karaoke, free).
cost(read_book, free).

cost(drinks, cheap).
cost(the_leaf, cheap).
cost(the_forks, cheap).
cost(restaurant, cheap).
cost(movie_night, cheap).

cost(sking, expensive).
cost(clubing, expensive).
cost(bomber_game, expensive).

cost(aviation_museum, free).
cost(winnipeg_art_gallery, free).
cost(legislative_building, free).
cost(zoo, cheap).
cost(goldeyes_game, cheap).
cost(manitoba_museum, cheap).
cost(human_rights_museum, cheap).
cost(thermea, expensive).
cost(jets_game, expensive).
cost(royal_ballet, expensive).
%---------------------------------


%------- category for activity ----
%either indoor, outdoor
category(restaurant, indoor).
category(movie_night, indoor).
category(drinks, indoor).
category(clubing, indoor).
category(cards, indoor).
category(karaoke, indoor).
category(read_book, indoor).
category(the_leaf, indoor).

category(sking, outdoor).
category(the_forks, outdoor).
category(bomber_game, outdoor).

category(zoo, outdoor).
category(thermea, outdoor).

category(human_rights_museum, indoor).
category(manitoba_museum, indoor).
category(winnipeg_art_gallery, indoor).
category(aviation_museum, indoor).
category(jets_game, indoor).
category(goldeyes_game, indoor).
category(legislative_building, indoor).
category(royal_ballet, indoor).
%---------------------------------



%------- location for activity ---
%either at home, close, far
location(cards, home).
location(karaoke, home).
location(read_book, home).

location(restaurant, close).
location(movie_night, close).
location(drinks, close).
location(the_forks, close).

location(sking, far).
location(clubing, far).
location(bomber_game, far).
location(the_leaf, far).

location(human_rights_museum, close).
location(manitoba_museum, close).
location(winnipeg_art_gallery, close).
location(jets_game, far).
location(goldeyes_game, close).
location(zoo, far).
location(thermea, far).
location(royal_ballet, far).
location(aviation_museum, far).
location(legislative_building, far).
%---------------------------------


%------- mode -------------------
%alone, social
mood(movie_night, alone).
mood(sking, alone).
mood(read_book, alone).
mood(the_leaf, alone).
mood(the_forks, alone).

mood(cards, social).
mood(karaoke, social).
mood(drinks, social).
mood(restaurant, social).
mood(clubing, social).
mood(bomber_game, social).

mood(zoo, alone).
mood(thermea, alone).
mood(royal_ballet, alone).
mood(manitoba_museum, alone).
mood(legislative_building, alone).
mood(human_rights_museum, alone).

mood(jets_game, social).
mood(goldeyes_game, social).
mood(aviation_museum, social).
mood(winnipeg_art_gallery, social).
%---------------------------------


%------- interests ---------------
%food, entertainment, games, art
interests(restaurant, food).
interests(drinks, food).

interests(movie_night, entertainment).
interests(read_book, entertainment).

interests(sking, games).
interests(clubing, games).
interests(bomber_game, games).
interests(cards, games).
interests(karaoke, games).

interests(the_leaf, art).
interests(the_forks, art).

interests(aviation_museum, art).
interests(manitoba_museum, art).
interests(legislative_building,art).
interests(human_rights_museum, art).
interests(winnipeg_art_gallery, art).
interests(zoo, entertainment).
interests(thermea, entertainment).
interests(royal_ballet, entertainment).

interests(jets_game, games).
interests(goldeyes_game, games).
%---------------------------------


%------- recommend_activity ------
%NOTE: Ask user for there preferences 
friday_fun(Activity) :-
    %Instruction on how to run the system
    write('To use the system'),nl,
    write('Answer the prefences questions below'),nl,
    write('By choosing the answers in paranthesis followed by period.'),nl,nl,

    %System begins
    write('What is your budget preference? (free/cheap/expensive) '),
    read(Budget),
    write('What is your location preference? (home/close/far) '),
    read(Location),
    write('What is your category preference? (indoor/outdoor) '),
    read(Category),
    write('What is your mood preference? (alone/social) '),
    read(Mood),
    write('What are your interests? (food/entertainment/games/art) '),
    read(Interests),

    %Find all activities and create activities list
    findall(Activity,
            (activity(Activity),
            cost(Activity, Budget),
            location(Activity, Location),
            category(Activity, Category),
            mood(Activity, Mood),
            interests(Activity, Interests)),
            Activities),
 
    %Recommmend the activity
    write(Activities),nl,

    %Choose a random activity from the activities (BUILT FUNCTION)
    random_member(Activity, Activities).
    %write('No matching activity found for your preference.').
%-----------------------------------------------------------


/*------------- Tests ---------------------------------------
NOTE: YOUR TEST RESULTS FOR WHERE THE USER HAS MULTIPLE PREFERENCES WILL BE RANDOM
      Decided to use random_member built in predicate hence using .pl as in amzi couldn't run
      IF tested in amzi, you will only see the list of activities but will not see random one.

NOTE: ALL REMAINING TESTS WHERE RUN ON SWI FOR THE RANDOM FEATURE
****** TEST 2: on SWI (ONLINE IDE: https://swish.swi-prolog.org/)
EXAMPLE 1:
?- friday_fun(A).
To use the system
Answer the prefences questions below
By choosing the answers in paranthesis followed by period.

What is your budget preference? (free/cheap/expensive) expensive.
What is your location preference? (home/close/far) far.
What is your category preference? (indoor/outdoor) indoor.
What is your mood preference? (alone/social) social.
What are your interests? (food/entertainment/games/art) games.
[clubing,jets_game]
clubing
?- 


EXAMPLE 2:
?- friday_fun(A).
To use the system
Answer the prefences questions below
By choosing the answers in paranthesis followed by period.

What is your budget preference? (free/cheap/expensive) free.
What is your location preference? (home/close/far) close.
What is your category preference? (indoor/outdoor) indoor.
What is your mood preference? (alone/social) social.
What are your interests? (food/entertainment/games/art) art.
[winnipeg_art_gallery]
winnipeg_art_gallery
?- 
**************************************

NOTE: U CAN RUN TESTS WITH YOUR OTHER PREFERENCES. 
BUT YOU MIGHT GET NO AS NOT ALL THE PREFERENCES HAVE ACTIVITIES.
-----------------------------------------------------------*/
