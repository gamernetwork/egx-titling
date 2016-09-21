import sys, re, json

if __name__ == "__main__":
    j = json.loads(sys.stdin.read())
    for e in j:
        print( "\t".join( (
            e['day'],
            e['start'],
            e['end'],
            e['title'],
            e['description'],
            e['image'],
        ) ) )
