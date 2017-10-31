def lookup(dic, default,  key, *keys):
	'''safely looks up a dict or nested dict's key values recursively

	Args
		dic (dict) the dictionary to lookup
		default (any) the value to default to if no value found
		key (str) a key to look up on the top level dictionary
		*keys (str) the rest of the keys to recursively look up

	Returns:
		value of key or default passed in


		>>> d = {'a':{'b':{'c':5}}}
		>>> print lookup(d, '', a', 'b', 'c')
		5
		>>> print lookup(d, 0, 'a', 'c')
		0
		>>> print lookup(d, '', a', 'c')
		''
	'''
	if keys:
		return lookup(dic.get(key, {}), *keys)
	return dic.get(key, default)