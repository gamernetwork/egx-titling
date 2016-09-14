import sys, re


with open(sys.argv[1], 'r') as f:
    print "\
        var boxes = [\
    "
    for ln in f:
        #sys.stderr.write(ln)
        (day, timeStart, timeEnd, header, subHeading, image) = ln.strip().split('\t')
        print ("\
            {\
                day: \"%s\",\
                heading: \"%s\",\
                subHeading: \"%s\",\
                timeStart: \"%s\",\
                timeEnd: \"%s\",\
                image: \"%s\"\
            },\
        " % (day, header, subHeading, timeStart, timeEnd, image))
    print "\
        ]\
    "
