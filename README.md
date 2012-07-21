DohUtil
========

DohUtil is a library designed to help simplify application development (includes location / etc.), and for miscellaneous ruby enhancements.

An example exists in the example directory.  If you run it like so:

``` ruby
example/example.rb -b override-arg-2 1 2 3
```

The output will look like:
``` text
importing example_library_file
argument1 is: defaultvalue
argument2 is: override-arg-2
varargs: ["1", "2", "3"]

```

