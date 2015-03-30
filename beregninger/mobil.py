#!/usr/bin/env python
# -*- encoding: utf-8 -*-

# iPhone 6 kostnader
# http://recode.net/2014/09/23/teardown-shows-apples-iphone-6-cost-at-least-200-to-build/

# koster 216-263 å lage (6+), selger for 749-949
# bidrag: 533-686 (sykt bra)

def iphone6plus_recode(memory=128):
    # in dollars
    price_per_gig = 0.42
    cost = {
        "assembly": 4.5,
        "memory": price_per_gig*memory,
        "display": 52.5, # big display + touch
        "cpu": 20, # A8 + sensors, MASS produced
        "sensors": 22, # nfc + other sensors
    }

    # bedre teardown:
    # http://www.techinsights.com/teardown.com/apple-iphone-6/
    return sum(cost.values())

def iphone6plus():
    "In dollars"
    # from techinsights
    # http://www.techinsights.com/teardown.com/apple-iphone-6/
    costs = {
        "assembly and test": 11,
        "supporting materials": 6,
        "other": 34.5,
        "non-electric": 18,
        "power mgmt/audio": 7,
        "bb+xcr": 27.5,
        "cpu": 37,
        "sdram": 5,
        "nand": 9,
        "connectivity": 13,
        "camera": 17.5,
        "battery": 6,
        "display, touch + glass": 51,
    }
    return sum(costs.values())

def our():
    "In dollars"
    # from techinsights
    # http://www.techinsights.com/teardown.com/apple-iphone-6/
    costs = {
        "assembly and test": 11,
        "supporting materials": 6,
        "other": 34.5,
        "non-electric": 18,
        "power mgmt/audio": 7,
        "bb+xcr": 27.5, # baseband and transceiver chips
        "cpu": 7, # atmega64 price if buy 1000 (industrial!)
        "sdram": 1, # minimal need, only buffers,
        # this one (sdram) is 1 gig samsung flash though
        # ram must hold at least 1 picture taken
        # for video rec, streams it, so must be able to hold buffer
        # also need some onboard RAM for minimal OS + keybaord
        "nand": 0, # no need for flash
        "connectivity": 13, # ?
        "camera": 17.5,
        "battery": 6,
        "display, touch + glass": 51,
    }
    # problemet med denne er de store kostnadene som other, non-electric,
    # bb+xcr

    # se også denne som har tallene klar:
    # http://www.iclarified.com/24444/iphone-5-bill-of-materials-estimated-at-16750
    return sum(costs.values())


parts = iphone6plus()
price = 749
print("iPhone6+ parts %.2f" % parts)
print("         price %.2f" % price)
print("           net %.2f" % (price-parts))
print()
print("Our:")
print("Our parts: %.2f" % our())
