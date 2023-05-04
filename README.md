# AI-Knowledge-Based-Activity-Recommendation

## Purpose
A prototype knowledge based system created for friday night Winnipeg recommendation list based off a few factors

## Running System
USE THIS ONLINE IDE (https://swish.swi-prolog.org/) BY COPY PASTING THE CODE BELOW THERE

CONVERT TO .pl since I couldnt not get amzi .pro to use random 


## Inadequencies about the system

**Inadequence 1:** Limited information as not all prefences recommend activity

**Potential Solution:** Add more information to the system by adding more activities and there facts.
                    

**Inadequence 2:** Implemented randomness in system using random_member predicate

**Potential Solution:** Could add certainity factor to the factors where the system recommends activity based on the certainity values calulated. That is might have a user mention what factor influence there decision like budget as top priority and so on so that system finds the best activity.


**Inadequence 3:** System requires the user to answer all the preferences question to receive activity.

****Potential Solution:** Could recommend the activities 1 preference at a time and only narrow it down when the user is prompted as to whether he/she wishes to add a new preference. This could be done by having mutiple friday_fun predicate (I had some issue implementing this as the system was getting stuck in some sort of infinite loop)
