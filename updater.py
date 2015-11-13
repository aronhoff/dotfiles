#!/usr/bin/python
import os
import subprocess
import re
import sys

mods = os.path.join(os.path.realpath(os.path.dirname(__file__)), ".gitmodules")
if not os.path.isfile(mods):
    print("./.gitmodules does not exist")
    sys.exit(0)

with open(mods) as f:
    for line in f.readlines():
        filename = ""
        mat = re.match("\s*path\s*=\s*(.+)", line)
        if mat:
            filename = mat.group(1)
        else:
            continue
        print("###")
        print(filename)
        cdir = os.path.join(os.path.realpath(os.path.dirname(__file__)), filename)
        if not os.path.exists(cdir):
            print(cdir + " does not exist!!!")
            print()
            continue
        p = subprocess.Popen("/usr/bin/git checkout master", shell=True, cwd=cdir)
        p.wait()
        p = subprocess.Popen("/usr/bin/git pull", shell=True, cwd=cdir)
        p.wait()
        p = subprocess.Popen("/usr/bin/git submodule update --recursive --init", shell=True, cwd=cdir)
        p.wait()
        print()
