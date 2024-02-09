The aim of this repository is to show off a possible bug in Robot Framework, where two instances of the same global library are imported as the same library.

This repository contains three files:

* `FakeLibrary.py` is a simple POC (Proof of Concept) global library with attribute
* `__init__.robot` initializes first instance of `FakeLibrary`, as was in original production code where this possible bug was found
* `poc.robot` contains a simple test suite that import `Second` instance of `FakeLibrary`; when run, test cases show that libraries and their attributes are the same, hence test fails.

Seemingly, the behaviour is underspecified on Robot Framework User Guide, which says: 

> There is a need to import the same library several times with different arguments. This is not possible otherwise. \
Source: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-309

> If a library is imported multiple times with different arguments, a new instance is created every time regardless the scope. \
Source: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-568

But nothing was found about importing multiple instances of the same library at once with the same arguments.

So, maybe it's a bug or maybe it's a feature ;)

---

_Feel free to use this repo for further discussion, work on this topic and reference!_
