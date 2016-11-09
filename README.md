# TDDTimer

I created this app for the purpose of test-driving various ways of implementing an NSTimer in Swift using TDD. The primary use case was to have a date/time view which updates every second to count down from the desired time to 0, therefore this solution set is aimed at that specific use case.

In order to build and run the app [Carthage](https://github.com/Carthage/Carthage) is needed. Once you clone the repo and have installed Carthage, simply run the following on the command line to retrieve dependencies: 

```make bootstrap```

Tests can also be run by executing the following via the command line:

```make tests```

---

Given this challenge I've considered three initial ways to solve this problem (there are likely many more...) and am working to implement them:

- [x] 1. Using an object (a 'Repeater') to control the timer and the method that the timer invokes by passing in a closure/block. This object can be mocked for easy testing.
   - For this approach I was able to test everything including that the UI is updated as a part of the closure. Pretty satisfied with this implementation approach.

- [ ] 2. Defining a protocol (a 'Repeatable') to mimic the start / invalidate methods to which I can pass in an NSTimer object that could be a real NSTimer or a fake object of my own creation.

- [ ] 3. Creating an UIView that itself is 'updatable' and contains the NSTimer logic within the view and is initialized with the configuration of how to update itself.
