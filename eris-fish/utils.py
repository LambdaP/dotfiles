#!/usr/bin/env python
# coding=UTF-8

import sys, math, subprocess

if sys.argv[1] == "line":
    l = int(sys.argv[2]) - int(sys.argv[3]) - 10 - 5
    sys.stdout.write("─" * l)
elif sys.platform == "darwin":
    p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
    output = p.communicate()[0]

    o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
    o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

    b_max = float(o_max.rpartition('=')[-1].strip())
    b_cur = float(o_cur.rpartition('=')[-1].strip())

    charge = b_cur / b_max
    charge_threshold = int(math.ceil(10 * charge))

    # Output

    if sys.argv[1] == "draw":
        total_slots, slots = 10, []
        filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
        empty = (total_slots - len(filled)) * u'▹'

        out = (filled + empty).encode('utf-8')
        sys.stdout.write(out)
    elif sys.argv[1] == "color":
        if charge_threshold < 4:
            sys.stdout.write("red")
        elif charge_threshold < 6:
            sys.stdout.write("yellow")
        else:
            sys.stdout.write("green")
else:
    if sys.argv[1] == "draw":
        sys.stdout.write("──────────")
    elif sys.argv[1] == "color":
        sys.stdout.write("white")
