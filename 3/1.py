with open("input") as f:
    raw = f.readlines()
    text = [a[:-1] for a in raw]


def split_halfway(s: str):
    halfway = len(s) // 2
    return [s[:halfway], s[halfway:]]


def intersection(pair):
    return set(pair[0]).intersection(set(pair[1]))


def priority(c: str):
    if 65 <= ord(c) <= 90:
        return ord(c) - 64 + 26
    if 97 <= ord(c) <= 122:
        return ord(c) - 96


chars = map(intersection, map(split_halfway, text))
print(sum([priority(a.pop()) for a in chars]))
