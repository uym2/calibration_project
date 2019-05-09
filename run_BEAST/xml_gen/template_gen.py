#! /usr/bin/env python

from sys import argv

sample_file = argv[1]
output_file = argv[2]

with open(sample_file,'r') as fin:
    with open(output_file,'w') as fout:
        while 1:
            line = fin.readline()
            if not line.strip()[:2] == "<!":
                fout.write(line)
            if line.strip()[:8] == "<taxa id":
                break
        while 1:
            line = fin.readline()
            if line.strip()[:6] == "</taxa":
                fout.write(line)
                break
        while 1:
            line = fin.readline()
            if not line.strip()[:2] == "<!":
                fout.write(line)
            if line.strip()[:10] == "<alignment":
                break
        while 1:
            line = fin.readline()
            if line.strip()[:11] == "</alignment":
                fout.write(line)
                break
        while 1:
            line = fin.readline()
            if not line.strip()[:2] == "<!":
                fout.write(line)
            if line.strip()[:13] == "<rescaledTree":
                break
        while 1:
            line = fin.readline()
            if line.strip()[:14] == "</rescaledTree":
                fout.write(line)
                break


        for line in fin:
            if not line.strip()[:2] == "<!":
                fout.write(line)
