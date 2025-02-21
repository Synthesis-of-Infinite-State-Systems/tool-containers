#!/bin/sh

tslmt2rpg --prune --rules-disable-precise-deduction --muval-caller /muval/call-muval.sh  --muval-timeout 20 | rpgsolve
