import os
import sys
from graphviz import Digraph

def process(dot, root, mods, iterated):
	if root in iterated:
		return iterated
	dot.node(root, root)
	iterated.append(root)
	if root in mods:
		subs = mods[root]
		for item in subs:
			iterated = process(dot, item, mods, iterated)
		for item in subs:
			dot.edge(root, item)
	return iterated

dot = Digraph(comment='LORD modules dependences')

rootdir = sys.argv[1]
graph = sys.argv[2]
mods = {}
for subdir, dirs, files in os.walk(rootdir):
	if 'depends.txt' not in files:
		continue
	modname = os.path.basename(subdir)
	with open(os.path.join(subdir, 'depends.txt')) as f:
		depends = [item.replace("?","") for item in  f.read().splitlines()]

	mods[modname] = depends

if len(sys.argv) == 3:
	for name in mods:
		dot.node(name, name)

	for name in mods:
		deps = mods[name]
		for dep in deps:
			dot.edge(name, dep)
elif len(sys.argv) >= 4:
	rootname = sys.argv[3]
	process(dot, rootname, mods, [])

dot.render(graph)

