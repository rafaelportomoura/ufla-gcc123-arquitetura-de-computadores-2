import os
import sys

file = sys.argv[1]

os.system(f'g++ -std=c++20 -mavx2 {file}.cpp -Wall -o {file}.exe')
