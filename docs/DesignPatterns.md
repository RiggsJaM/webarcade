# Design Patterns

Design Patterns was a book released in 1994, which outlined a set of guidelines for writing good Object Oriented Code, as well as potential pitfalls that might come therewith. We will be utilizing a couple of these original Design Patterns in our project.


## Design Patterns Currently In Use

Due to our decision to use Flutter and Dart, we have found several uses of the Builder Design Pattern. For every page that's created and therefore displayed, the Flutter framework utilizes an overridden build method, which creates a builder like the example below: 

![BuilderPattern](../src/assets/images/BuilderPattern.png)

# Design Patterns for Potential Future Use

We will likely have more uses of the Builder pattern, as it creates the page differently, depending on which system Flutter will be building for. We may implement a Singleton in a few places, in the different games, but may not end up finding its way into the project.
