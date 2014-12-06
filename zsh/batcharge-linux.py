#!/usr/bin/env python
# coding=UTF-8

import sys

filled = 9 * u'─'
last = u'○'
out = (filled + last).encode('utf-8')

sys.stdout.write(out)
