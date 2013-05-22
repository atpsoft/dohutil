DohUtil
========

[![Build Status](https://travis-ci.org/atpsoft/dohutil.png)](https://travis-ci.org/atpsoft/dohutil)
[![Code Climate](https://codeclimate.com/github/atpsoft/dohutil.png)](https://codeclimate.com/github/atpsoft/dohutil)

DohUtil is a library designed to help simplify application development (includes location / etc.), and for miscellaneous ruby enhancements.

Sample code exists in the sample directory.  If you run it like so:

``` ruby
sample/sample.rb -b override-arg-2 1 2 3
```

The output will look like:
``` text
importing sample_library_file
argument1 is: defaultvalue
argument2 is: override-arg-2
varargs: ["1", "2", "3"]

```

