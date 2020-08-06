### Quick Start

Clone and install dependencies
```sh
$ git clone git@github.com:dearshrewdwit/boris-bikes-demo.git && cd boris-bikes-demo
$ bundle install
```

#### Screen Recordings
- [ ] [Part 1](https://youtu.be/hbQq5uHIceQ)
- [ ] [Part 2](https://youtu.be/YEBA9NOS6ec)
- [ ] [Part 3](https://youtu.be/x_nwIpFRlGc)

#### User Stories
```
# Part 1
As a member of the public
So I can return bikes I’ve hired
I want to dock my bike at the docking station

As a member of the public,
So that I can use a bike,
I’d like a docking station to release a bike.
```
```
# Part 2
As a member of the public,
So that I am not confused and charged unnecessarily,
I’d like docking stations not to release bikes when there are none available.

As a system maintainer,
So that I can control the distribution of bikes,
I’d like docking stations not to accept more bikes than their capacity, which is by default 20.
```


```
# Part 3
As a member of the public,
So that I can use a good bike,
I’d like to see if a bike is working

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I’d like to report a bike as broken when I return it.

As a system maintainer,
So that I can manage broken bikes and not disappoint users,
I’d like docking stations not to release broken bikes.

As a system maintainer,
So that I can manage broken bikes and not disappoint users,
I’d like docking stations to accept returning bikes (broken or not).
```

**Nouns**
- Docking Station
- Bike

**Verbs**
- dock
- release
- working
- report

**Objects** | **Messages** | **Data** | **Properties**
-|-|-|-
DockingStation | dock(bike), release() | array of bikes | capacity = 20
Bike | working?, report | boolean

**Status** | **Public Method** | **Scenario** | input | output
-|-|-|-|-
✅ | DockingStation#release | When there are working bikes | release() | bike
✅ | DockingStation#release | When there are none | release() | "Sorry, none available"
✅ | DockingStation#release | When there are none working | release() | "Sorry, all are broken"
✅ | DockingStation#dock | below capacity | dock(bike) | [bike]
✅ | DockingStation#dock | at or above capacity | dock(bike) | "Sorry, full!"
✅ | Bike#working? | when it is working | working? | true
✅ | Bike#working? | when it is broken | working? | false
✅ | Bike#report | when it is working | report | false
✅ | Bike#report | when it is broken | report | false
