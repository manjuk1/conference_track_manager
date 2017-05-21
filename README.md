-----------------------------------
How to run the program?
-----------------------------------

ruby conference_scheduler.rb <input_file>

Where,

<input_file> : input file name. It supports only .txt . The file needs to be present in the current directory of the main program(project root).

EX: ruby conference_scheduler.rb input.txt

-----------------------------------
Output 
-----------------------------------

Output will be printed on the console. Below is the output captured from test run

Track 1:
09:00 AM : Ruby on Rails Legacy App Maintenance 60min
10:00 AM : Rails Magic 60min
11:00 AM : Writing Fast Tests Against Enterprise Rails 60min
12:00 PM : Lunch Break
01:00 PM : Pair Programming vs Noise 45min
01:45 PM : Common Ruby Errors 45min
02:30 PM : Overdoing it in Python 45min
03:15 PM : A World Without HackerNews 30min
03:45 PM : Programming in the Boondocks of Seattle 30min
04:15 PM : Woah 30min
04:45 PM : Rails for Python Developers lightning
04:50 PM : Networking Event
Track 2:
09:00 AM : Ruby on Rails: Why We Should Move On 60min
10:00 AM : Clojure Ate Scala (on my project) 45min
10:45 AM : Ruby Errors from Mismatched Gem Versions 45min
11:30 AM : Ruby vs. Clojure for Back-End Development 30min
12:00 PM : Lunch Break
01:00 PM : Lua for the Masses 30min
01:30 PM : Communicating Over Distance 60min
02:30 PM : User Interface CSS in Rails Apps 30min
03:00 PM : Accounting-Driven Development 45min
03:45 PM : Sit Down and Write 30min
04:15 PM : Networking Event

--------------------------------------------------
For Running Unit tests
--------------------------------------------------
gem install rspec

please run the specs from the project root

command : rspec spec

-------------------------------------------------
Design
-------------------------------------------------

classes:

ConferenceScheduler : Main Class which will take input file and provides the scheduled output.

TxtReader and BaseReader : TxtReader has been inherited from base reader keeping in mind that it may be extended to read input from other file types ex: CSV

Talk , Track, Session : These are the core entities of this system representing talks , session and tracks in real world.

TalksBuilder : This is the entity resposible for reading and creating the Talks in memory for scheduling purpose.

TrackManager : This entity is resposible building Tracks for given talks. Track internally depends on Session to scehdule either morning or after noon sessions.