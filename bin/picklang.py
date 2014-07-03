#!/usr/bin/env python3
import argparse
from random import choice

low_level = ['C', 'C++', 'GoLang', 'D']
high_level = ['C#', 'Python', 'Ruby', 'Javascript']
functional = ['Scala', 'Haskell', 'Erlang', 'Clojure']
assembly = ['ASM']

parser = argparse.ArgumentParser(
    description='Randomly chose a language for your exercise.')

parser.add_argument('-f', '--functional', help='Include functional languages', 
                    action='store_true')
parser.add_argument('-v', '--highlevel', 
                    help='Include very-high-level languages', 
                    action='store_true')
parser.add_argument('-l', '--lowlevel', help='Include low-level languages', 
                    action='store_true')
parser.add_argument('-a', '--asm', help='Include assembly language', 
                    action='store_true')


args = parser.parse_args()

total_list = (args.functional * functional) + \
             (args.highlevel  * high_level) + \
             (args.lowlevel * low_level)    + \
             (args.asm * assembly)

print(choice(total_list))
